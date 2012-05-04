package Shutterstock::Exchange::Ask;

use Moose;
use HTML::FormHandler::Moose;

extends 'HTML::FormHandler';

with 'HTML::FormHandler::Widget::Theme::Bootstrap';

has_field 'title' => (type => 'Text', size => 45, required => 1);
has_field 'details' => (type => 'TextArea', required => 1);
has_field 'submit' => (type => 'Submit', value => 'Go');

sub post_if_valid {
  my ($self, $params) = @_;
  $self->process(params => $params)
}

sub update_model {
  my $item = (my $self = shift)->item;
  $item->fill_fields_from_hashref($self->value);
  $item->insert;
}

__PACKAGE__->meta->make_immutable;

