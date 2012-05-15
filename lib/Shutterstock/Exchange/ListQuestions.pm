package Shutterstock::Exchange::ListQuestions;

use Moose;

has 'questions' => (is=>'ro', required=>1);

sub about { fields => ['questions'] }
sub about_questions { type => 'ResultSet' }

__PACKAGE__->meta->make_immutable;
