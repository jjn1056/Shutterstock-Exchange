package Shutterstock::Exchange::Web::Controller::API::Questions;

use Moose;
use MooseX::MethodAttributes;
use syntax qw( simple/v2 catalyst_action );

extends 'Catalyst::Controller';

action start :
  Chained('/api/start')
  PathPart('questions') CaptureArgs(0) {
    $ctx->stash(q => $ctx->model('Schema::Question'));
  }

  action all :
    Chained('start') Args(0) PathPart('')
  {
    my @q = $ctx->stash->{q}
      ->search({},{prefetch=>'person_asked_by'})
        ->map( sub {
          +{
              title => $_->title,
              link => $ctx->uri_for_action(
                $ctx->controller->action_for('one', $_->id))
                  ->as_string,
              asked_on => $_->asked_on->dmy .' '. $_->asked_on->hms,
              asked_by => +{
                handle => $_->person_asked_by->handle,
                link => $_->person_asked_by->id },
           }
       });

    $ctx->stash(rest => \@q);
  }

  action one($id) :
    Chained('start') Args(1) PathPart('')
  {
    my $q = $ctx->stash->{q}->find($id);
    $ctx->stash(rest => {$q->get_columns});
  }

__PACKAGE__->meta->make_immutable;

