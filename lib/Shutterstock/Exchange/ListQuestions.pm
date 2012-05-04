package Shutterstock::Exchange::ListQuestions;

use Moose;
use HTML::Zoom::CodeStream;

has 'question_rs' => (is=>'ro', required=>1);

sub render {
  my ($self, $zoom) = @_;
  my $rs = $self->question_rs
    ->search({},{prefetch=>'person_asked_by'});

  $zoom->select('#questions')->repeat(sub {
    HTML::Zoom::CodeStream->new({
      code => sub {
        while (my $row = $rs->next) {
          return sub {
            $_->select('.title')->replace_content($row->title)
              ->select('.asked_by')->replace_content($row->person_asked_by->handle)
              ->select('.asked_on')->replace_content($row->asked_on->dmy .' '. $row->asked_on->hms)
          }
        }
        return
      },
    })
  })->to_html;

}

__PACKAGE__->meta->make_immutable;

__END__



use Devel::Dwarn;
Dwarn $zoom->to_html;

