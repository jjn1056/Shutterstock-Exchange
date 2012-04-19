package Shutterstock::Exchange::Web::Controller::Login;

use Moose;
use MooseX::MethodAttributes;

extends 'Catalyst::Controller';

sub start : Chained('/start') PathPrefix CaptureArgs(0) { }

  sub login :
    Chained('start')
    PathPart('') Args(0)
  {
    my ($self, $ctx) = @_;
    $ctx->stash(current_model => 'Login');
    if(my $params = $ctx->req->body_parameters) {
       $ctx->model
         ->process(params => $params)
          and $ctx->go('welcome');
    }
  }

  sub welcome : Action { }

__PACKAGE__->meta->make_immutable;

