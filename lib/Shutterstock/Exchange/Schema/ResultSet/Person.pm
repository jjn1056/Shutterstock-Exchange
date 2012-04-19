package Shutterstock::Exchange::Schema::ResultSet::Person;

use Modern::Perl;
use syntax 'simple/v2';
use parent 'Shutterstock::Exchange::Schema::ResultSet';

method new_member(@args) { $self->create({@args}) }

1;
