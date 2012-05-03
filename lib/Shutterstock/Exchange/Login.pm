package Shutterstock::Exchange::Login;

use Moose;
use HTML::FormHandler::Moose;

extends 'HTML::FormHandler';

with 'HTML::FormHandler::Widget::Theme::Bootstrap';

has_field 'handle' => (type => 'Text', size => 45, required => 1);
has_field 'password' => (type => 'Password', size => 12, required => 1);
has_field 'submit' => (type => 'Submit', value => 'Login');

sub authenticate_if_valid {
  my ($self, $params) = @_;
  $self->process(params => $params);
}

sub has_any_field_errors {
  my $self = shift;
  return $self->field('password')->has_errors || 
    $self->field('handle')->has_errors;
}

sub add_password_error {
  shift->field('handle')
    ->add_error("Password doesn't match")
}

sub validate {
  my $self = shift;
  $self->has_any_field_errors or
    $self->validate_authentication or
      $self->add_password_error;
}

sub validate_authentication {
  my $self = shift;
  $self->ctx->authenticate($self->values);
}

__PACKAGE__->meta->make_immutable;

