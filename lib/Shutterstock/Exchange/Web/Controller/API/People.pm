package Shutterstock::Exchange::Web::Controller::API::People;

use Moose;
use MooseX::MethodAttributes;
use syntax qw( simple/v2 catalyst_action );

extends 'Catalyst::Controller';

action start :
  Chained('/api/start')
  PathPart('people') CaptureArgs(0) { }

  action all :
    Chained('start') Args(0)
  {
    $ctx->stash(rest =>
      $ctx->model('Schema::Person')->as_arrayref);
  }

__PACKAGE__->meta->make_immutable;
