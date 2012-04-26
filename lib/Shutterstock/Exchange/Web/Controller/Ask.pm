package Shutterstock::Exchange::Web::Controller::Ask;

use Moose;
use MooseX::MethodAttributes;

extends 'Catalyst::Controller';

sub start : Chained('/start') PathPrefix CaptureArgs(0) {
  pop->stash(current_model => 'Ask');
}

  sub ask :
    Chained('start')
    ActionClass('REST')
    PathPart('') Args(0) { }

    sub ask_GET { }

    sub ask_POST {
      my ($self, $ctx) = @_;
      $ctx->model->post_if_valid(
        $ctx->req->body_parameters)
          and $ctx->go('posted');
    }

  sub posted : Action { }

__PACKAGE__->meta->make_immutable;

