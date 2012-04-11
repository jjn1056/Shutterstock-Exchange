package Shutterstock::Exchange::Schema::Result::Answer;

use Shutterstock::Exchange::Schema::Candy;

table 'answer';

primary_column answer_id => {
  data_type => "integer",
  is_auto_increment => 1};

column content => {
    data_type => "text"},

  person_id => {
    data_type => "integer",
    is_foreign_key => 1},

  question_id => {
    data_type => "integer",
    is_foreign_key => 1};

belongs_to person => (
  '::Person', 'person_id');

belongs_to question => (
  '::Question', 'question_id');

1;

=head1 NAME

Shutterstock::Exchange::Schema::Result::Answer

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Shutterstock::Exchange> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Shutterstock::Exchange> for rights information.

=cut
