package Shutterstock::Exchange::Web::Model::ListQuestions;

use parent 'Catalyst::Model::Factory::PerRequest';

sub prepare_arguments {
  my ($self, $ctx) = @_;
  return +{ questions => $ctx->model('Schema::Question')
    ->search({},{prefetch=>'person_asked_by'}) };
}

__PACKAGE__->config({
  class => 'Shutterstock::Exchange::ListQuestions',
});

