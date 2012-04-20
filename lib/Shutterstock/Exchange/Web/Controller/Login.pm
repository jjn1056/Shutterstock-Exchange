package Shutterstock::Exchange::Web::Controller::Login;

use Moose;
use MooseX::MethodAttributes;

extends 'Catalyst::Controller';

sub start : Chained('/start') PathPrefix CaptureArgs(0) {
  pop->stash(current_model => 'Login');
}

  sub login :
    Chained('start')
    ActionClass('REST')
    PathPart('') Args(0) { }

    sub login_GET { }

    sub login_POST {
      my ($self, $ctx) = @_;
      $ctx->model->process(params
        => $ctx->req->body_parameters)
          and $ctx->go('welcome');
    }

  sub welcome : Action { }

__PACKAGE__->meta->make_immutable;

