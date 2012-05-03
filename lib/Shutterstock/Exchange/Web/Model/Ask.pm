package Shutterstock::Exchange::Web::Model::Ask;

use DateTime;
use parent 'Catalyst::Model::Factory::PerRequest';

sub prepare_arguments {
  my ($self, $ctx) = @_;
  my $item = $ctx->model('Schema::Question')
    ->new_result({
      person_asked_by => $ctx->user->obj,
      asked_on => DateTime->now,
    });

  return +{ item => $item, ctx => $ctx };
}

__PACKAGE__->config({
  class => 'Shutterstock::Exchange::Ask',
});

