#!/usr/bin/env perl
 
use Test::Most;
use Test::DBIx::Class qw(Person);

fixtures_ok ['sample_people'];

my ($confused, $knowledgable) = Person()
  ->search({},{rows=>2})
  ->all;

ok my $q = $confused->asks(
  'Where are the logs for integration?',
  'After pushing to integration I am getting errors...');

ok my $a = $knowledgable->answers(
  $q, "Try logs.shuttercorp.net...");

done_testing;

