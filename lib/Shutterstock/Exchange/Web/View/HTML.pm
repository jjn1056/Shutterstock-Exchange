package Shutterstock::Exchange::Web::View::HTML;

use Modern::Perl;
use HTML::Zoom;
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

sub zoom {
  my ($context, $model) = @_;
  return sub {
    my $zoom = HTML::Zoom->from_html(shift);
    $model->render($zoom);
  };
}

__PACKAGE__->config(
  expose_methods => [qw/
    uri_for_action model uri_for/],
  FILTERS => { zoom => [\&zoom, 1] },
);
