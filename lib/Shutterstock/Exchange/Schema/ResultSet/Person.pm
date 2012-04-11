package Shutterstock::Exchange::Schema::ResultSet::Person;

use Modern::Perl;
use parent 'Shutterstock::Exchange::Schema::ResultSet';
use syntax 'simple/v2';

method new_member(@args) { $self->create({@args}) }

1;
