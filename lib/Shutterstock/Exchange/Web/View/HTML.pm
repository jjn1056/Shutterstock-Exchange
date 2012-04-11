package Shutterstock::Exchange::Web::View::HTML;

use Modern::Perl;
use parent 'Catalyst::View::TT';

sub uri_for {
  my ($self, $ctx, @args) = @_;
  $ctx->uri_for(@args);
}

sub uri_for_action {
  my ($self, $ctx, @args) = @_;
  $ctx->uri_for_action(@args);
}

__PACKAGE__->config(
  expose_methods => [qw/uri_for_action uri_for/],
);


