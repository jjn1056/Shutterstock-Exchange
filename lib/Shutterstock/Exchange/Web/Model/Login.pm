package Shutterstock::Exchange::Web::Model::Login;

use Moose;
extends 'Catalyst::Model::Factory::PerRequest';

around 'ACCEPT_CONTEXT', sub {
  my ($orig, $self, $ctx, @args) = @_;
  $ctx->stash(current_model_instance =>
    (my $instance = $self->$orig($ctx, @args, ctx => $ctx)));
  return $instance;
};

__PACKAGE__->meta->make_immutable;
__PACKAGE__->config({
  class => 'Shutterstock::Exchange::Login',
});

