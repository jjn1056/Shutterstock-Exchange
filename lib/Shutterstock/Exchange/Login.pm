package Shutterstock::Exchange::Login;

use Moose;
use HTML::FormHandler::Moose;

extends 'HTML::FormHandler';

has_field 'handle' => (type => 'Text', size => 45, required => 1);
has_field 'password' => (type => 'Password', size => 12, required => 1);
has_field 'submit' => (type => 'Submit', value => 'Go');

sub authenticate_if_valid {
  my ($self, $params) = @_;
  $self->process(params => $params);
}

sub validate {
  my $self = shift;
  $self->validate_authentication or
    $self->add_form_error("Incorrect login information");
}

sub validate_authentication {
  my $self = shift;
  $self->ctx->authenticate($self->values);
}

__PACKAGE__->meta->make_immutable;

