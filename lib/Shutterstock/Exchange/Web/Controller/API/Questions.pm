package Shutterstock::Exchange::Web::Controller::API::Questions;

use Moose;
use MooseX::MethodAttributes;
use syntax qw( simple/v2 catalyst_action );

extends 'Catalyst::Controller';

action start :
  Chained('/api/start')
  PathPart('questions') CaptureArgs(0) { }

  action all :
    Chained('start') Args(0)
  {
    $ctx->stash(rest =>
      $ctx->model('Schema::Question')->as_arrayref);
  }

  action recent :
    Chained('start') Args(0)
  {
    my $questions = $ctx->model('Schema::Question')
      ->search({}, { join => 'person_asked_by',
        '+select' => 'person_asked_by.handle',
        '+as' => 'asked_by'})
      ->as_arrayref;

    $ctx->stash(rest => $questions);
  }

__PACKAGE__->meta->make_immutable;
