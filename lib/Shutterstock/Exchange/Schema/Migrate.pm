package Shutterstock::Exchange::Schema::Migrate;

use Moose;
 
extends 'DBIx::Class::Migration::Script';
 
sub defaults {
  schema_class => 'Shutterstock::Exchange::Schema',
}

__PACKAGE__->meta->make_immutable;
__PACKAGE__->run_if_script;

=head1 NAME

Shutterstock::Exchange::Schema::Migrate - 

=head1 SYNOPSIS

    TBD
    	
=head1 DESCRIPTION

    TBD

=head1 AUTHOR

See L<Shutterstock::Exchange> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Shutterstock::Exchange> for rights information.

=cut

