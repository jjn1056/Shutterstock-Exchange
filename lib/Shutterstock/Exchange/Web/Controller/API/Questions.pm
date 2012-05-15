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
    my @q = $ctx->model('Schema::Question')
      ->search({},{prefetch=>'person_asked_by'})
        ->map( sub {
          +{
              title => $_->title,
              link => $_->id,
              asked_on => $_->asked_on->dmy .' '. $_->asked_on->hms,
              asked_by => +{
                handle => $_->person_asked_by->handle,
                link => $_->person_asked_by->id },
           }
       });

    $ctx->stash(rest => \@q);
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

