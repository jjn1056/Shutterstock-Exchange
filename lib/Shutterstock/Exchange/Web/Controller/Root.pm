package Shutterstock::Exchange::Web::Controller::Root;
 
use Moose;
use MooseX::MethodAttributes;
use syntax qw( simple/v2 catalyst_action );

extends 'Catalyst::Controller';
 
action start : Chained('/') PathPrefix CaptureArgs(0) { }

action index : Chained(start) PathPart('') Args(0) {
  $ctx->stash(current_model => 'ListQuestions');
}

action end : ActionClass('RenderView') { }
 
__PACKAGE__->meta->make_immutable;

