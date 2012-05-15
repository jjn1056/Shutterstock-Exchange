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
  HTML::Zoom->from_html(shift);
}

sub _zoom_resultset {
  my ($field, $rs) = @_;
  return sub {
    shift->repeat('#'.$field, sub {
      HTML::Zoom::CodeStream->new({
        code => sub {
          while (my $row = $rs->next) {
            return sub {
              $_->replace_content('.title' => $row->title)
                ->replace_content('.asked_by' => $row->person_asked_by->handle)
                  ->replace_content('.asked_on' => $row->asked_on->dmy .' '. $row->asked_on->hms)
            };
          }
          return;
        },
      });
    });
  };
}

sub zoom {
  my ($context, $model) = @_;
  if ($model->can('about')) {
    my @steps = ( \&_zoom_init );
    my %about = $model->about;
    foreach my $field (@{$about{fields}}) {
      my $about_field_method = "about_$field";
      my %about_field = $model->$about_field_method;
      if($about_field{type} eq 'ResultSet') {
        my $rs = $model->questions;
        push @steps, _zoom_resultset($field, $rs);
      }
    }
    return sub {
      my $stash = shift;
      foreach my $step (@steps) {
        $stash = $step->($stash);
      }
      $stash->to_html;
    };
  } else {
    return sub { shift };
  }
}

__PACKAGE__->config(
  expose_methods => [qw/
    uri_for_action model uri_for/],
  FILTERS => { zoom => [\&zoom, 1] },
);
