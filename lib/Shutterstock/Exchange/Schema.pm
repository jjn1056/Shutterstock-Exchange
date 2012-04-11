package Shutterstock::Exchange::Schema;

use Modern::Perl;
use parent 'DBIx::Class::Schema';

our $VERSION = 1;

__PACKAGE__->load_namespaces(
  default_resultset_class => 'DefaultRS',
);

1;

=head1 NAME

Shutterstock::Exchange::Schema - Root Schema logic and ORM management

=head2 SYNOPSIS

	my $schema = Shutterstock::Exchange::Schema->connect($dsn);

=head1 DESCRIPTION

Defines the core domain logic for the application platform.  Good methods to
put here would include everything related to deploying upgrading the database,
business methods that cut across multiple classes, and other logic related to
the database as a whole.

=head1 METHODS

This class defines the following methods

=head1 AUTHOR

See L<Shutterstock::Exchange> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Shutterstock::Exchange> for rights information.

=cut
