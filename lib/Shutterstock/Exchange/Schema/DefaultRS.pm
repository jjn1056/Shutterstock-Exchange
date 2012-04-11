package Shutterstock::Exchange::Schema::DefaultRS;

use Modern::Perl; 
use parent 'Shutterstock::Exchange::Schema::ResultSet';

1;

=head1 NAME

Shutterstock::Exchange::Schema::DefaultRS - Use this as the default ResultSet.

=head1 DESCRIPTION

L<DBIx::Class> will use a resultset class which shares a name with the Result
class.  If one does not exist, use this class as the default.  Both custom and
default Resultsets share L<Shutterstock::Exchange::Schema::ResultSet> as a
common base class.

If you are thinking of adding methods here, they probably belong in the true
base parent L<Shutterstock::Exchange::Schema::ResultSet>.

=head1 AUTHOR

See L<Shutterstock::Exchange> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<Shutterstock::Exchange> for rights information.

=cut

