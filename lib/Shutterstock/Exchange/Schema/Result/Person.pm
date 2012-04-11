package Shutterstock::Exchange::Schema::Result::Person;

use syntax 'simple/v2';
use Shutterstock::Exchange::Schema::Candy
  -components => ['EncodedColumn'];

table 'person';

primary_column person_id => {
  data_type => "integer",
  is_auto_increment => 1};

unique_column handle => {
  data_type => 'varchar',
  size => '24'};

unique_column email => {
  data_type => 'varchar',
  size => '96'};

column password => {
  data_type => 'char',
  size => 40,
  encode_column => 1,
  encode_check_method => 'check_password',
  encode_class => 'Digest'};

might_have answer_rs => (
  '::Answer', 'person_id');

might_have question_rs => (
  '::Question', 'person_id');

method asks($question, $details) {
  $self->create_related( question_rs =>
    {title => $question, details => $details});
}

method answers($question, $answer) {
  $self->create_related( answer_rs =>
    {content => $answer, question =>$question});
}

1;

=head1 NAME

Shutterstock::Exchange::Schema::Result::Person

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Shutterstock::Exchange> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Shutterstock::Exchange> for rights information.

=cut
