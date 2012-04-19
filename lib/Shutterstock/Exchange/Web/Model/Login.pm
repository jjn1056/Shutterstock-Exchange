package Shutterstock::Exchange::Web::Model::Login;
use parent 'Catalyst::Model::Factory::PerRequest';

sub prepare_arguments {
  my ($self, $ctx) = @_;
  return +{ ctx => $ctx };
}

__PACKAGE__->config({
  class => 'Shutterstock::Exchange::Login',
});

