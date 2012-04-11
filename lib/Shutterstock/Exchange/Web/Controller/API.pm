package Shutterstock::Exchange::Web::Controller::API;
 
use Moose;
use MooseX::MethodAttributes;
use syntax qw( simple/v2 catalyst_action );

extends 'Catalyst::Controller::REST';

action start : 
  Chained('/start')
  PathPrefix CaptureArgs(0) { }

__PACKAGE__->meta->make_immutable;
