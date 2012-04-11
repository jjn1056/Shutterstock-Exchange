package Shutterstock::Exchange::Schema::Result::Question;

use Shutterstock::Exchange::Schema::Candy;

table 'question';

primary_column question_id => {
  data_type => 'integer',
  is_auto_increment => 1};

column title => {
    data_type => 'varchar',
    size => 64,
  },

  details => {
    data_type => 'text'},

  asked_on => {
    data_type => 'datetime'},

  person_id => {
    data_type => 'integer',
    is_foreign_key => 1};

belongs_to person_asked_by => (
  '::Person', 'person_id');

might_have answered_by => (
  '::Answer', 'question_id');

1;

=head1 NAME

Shutterstock::Exchange::Schema::Result::Question

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<Shutterstock::Exchange> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Shutterstock::Exchange> for rights information.

=cut
