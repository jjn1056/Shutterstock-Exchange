package Shutterstock::Exchange::Web::View::HTML;

use Modern::Perl;
use HTML::Zoom;
use HTML::Zoom::CodeStream;

use parent 'Catalyst::View::TT';

sub uri_for {
  my ($self, $ctx, @args) = @_;
  $ctx->uri_for(@args);
}

sub uri_for_action {
  my ($self, $ctx, @args) = @_;
  $ctx->uri_for_action(@args);
}

sub model {
  my ($self, $ctx, @args) = @_;
  $ctx->model(@args);
}

sub _zoom_init {
  sub { HTML::Zoom->from_html(shift) };
}

sub _fill_result {
  my ($result) = @_;
  return sub {
    my $zoom = shift;
    foreach my $field (@{$result->about->{fields}}) {
      $zoom = $zoom->replace_content(".$field" => $result->$field);
    }
    return $zoom;
  }
}

sub _fill_resultset {
  my ($rs) = @_;
  return sub {
    shift->repeat('#'.$rs->about->{id}, sub {
      HTML::Zoom::CodeStream->new({
        code => sub {
          while (my $row = $rs->next) {
            return sub {
              _fill_result($row)->($_);
            };
          }
          return;
        },
      });
    });
  };
}

sub _run_steps {
  my @steps = @_;
  return sub {
    my $stash = shift;
    foreach my $step (@steps) {
      $stash = $step->($stash);
    }
    $stash->to_html;
  };
}

sub _process_model {
  my ($model, @steps) = @_;
  if($model->about->{type} eq 'ResultSet') {
    push @steps,
      _fill_resultset($model);
  } elsif($model->about->{type} eq 'Result') {
    push @steps, _fill_resultset($model);
  }

  return _run_steps(@steps);
}

sub zoom {
  my ($context, $model) = @_;
  return $model->can('about') ?
    _process_model($model, _zoom_init) : sub { shift };
}

__PACKAGE__->config(
  expose_methods => [qw/
    uri_for_action model uri_for/],
  FILTERS => { zoom => [\&zoom, 1] },
);
