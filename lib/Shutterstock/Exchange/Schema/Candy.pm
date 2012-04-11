package Shutterstock::Exchange::Schema::Candy;

use Modern::Perl;
use parent 'DBIx::Class::Candy';

sub base { $_[1] || 'Shutterstock::Exchange::Schema::Result' }

1;

=head1 NAME

Shutterstock::Exchange::Schema::Candy - My Candy Class

=head1 SYNOPSIS

	package Shutterstock::Exchange::Schema::Result::User;
    use Shutterstock::Exchange::Schema::Candy;

=head1 DESCRIPTION

Our custom subclass of L<DBIx::Class::Candy>

=head1 METHODS

This module defines the following methods.

=head2 base

Sets the base class for all Results

=head1 AUTHOR

See L<Shutterstock::Exchange> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Shutterstock::Exchange> for rights information.

=cut


