package Shutterstock::Exchange::Web::Model::ListQuestions;

use parent 'Catalyst::Model::Factory::PerRequest';

sub prepare_arguments {
  my ($self, $ctx) = @_;
  return +{ question_rs => $ctx->model('Schema::Question') };
}

__PACKAGE__->config({
  class => 'Shutterstock::Exchange::ListQuestions',
});

