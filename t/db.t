#!/usr/bin/env perl
 
use Test::Most;
use Test::DBIx::Class qw(Person);

fixtures_ok ['sample_people'];

is Person->count, 2, 'right number of people';
ok my $john = Person->find({handle=>'John'}),
  'Found John';

ok $john->check_password('abc123'),
  'password validates';

ok ! $john->check_password('NOTPASSWORD'),
  'wrong password fails to validate';

done_testing;
