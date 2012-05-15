package Shutterstock::Exchange::ListQuestions;

use Moose;

has 'questions' => (
  is=>'bare',
  required=>1,
  handles=>[qw/next/]);

sub about { +{type => 'ResultSet', id => 'questions'} }

around 'next', sub {
  my ($orig, $self, @args) = @_;
  my $result = $self->$orig(@args);
  return $result ?
    Shutterstock::Exchange::Question->new(result=>$result) :
    $result;
};

Shutterstock::Exchange::ListQuestions->meta->make_immutable;

package Shutterstock::Exchange::Question;

use Moose;

has 'result' => (
  is=>'bare',
  required=>1,
  handles=>[qw/title asked_on person_asked_by/]);

sub about { +{type => 'Result', id => 'question',
  fields => [qw/title asked_on person_asked_by_handle asked_on_dmy asked_on_hms/]} }

sub person_asked_by_handle {
  shift->person_asked_by->handle;
}

sub asked_on_dmy {
  shift->asked_on->dmy;
}

sub asked_on_hms {
  shift->asked_on->hms;
}

Shutterstock::Exchange::Question->meta->make_immutable;
