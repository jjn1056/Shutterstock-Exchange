package Shutterstock::Exchange::Web::Controller::Root;
 
use Moose;
use MooseX::MethodAttributes;
use syntax qw( simple/v2 catalyst_action );

extends 'Catalyst::Controller';
 
action start : Chained('/') PathPrefix CaptureArgs(0) { }

action index : Chained(start) PathPart('') Args(0) {

    $ctx->session( aaa=>1);
    $ctx->stash(questions =>[
        {total_answers=>0, title=>"Why did the chicken?", asked_by=>"Johnn", asked_on=>"January 1, 2010"},
        {total_answers=>11, title=>"Why did the chicken?", asked_by=>"Johnn", asked_on=>"January 1, 2010"},
        {total_answers=>999, title=>"Why did the chicken?", asked_by=>"Johnn", asked_on=>"January 1, 2010"},

        ]);
}

action end : ActionClass('RenderView') { }
 
__PACKAGE__->meta->make_immutable;

