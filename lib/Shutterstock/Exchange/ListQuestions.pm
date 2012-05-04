package Shutterstock::Exchange::ListQuestions;

use Moose;
use HTML::Zoom::CodeStream;

has 'question_rs' => (is=>'ro', required=>1);

sub render {
  my ($self, $zoom) = @_;
  my $rs = $self->question_rs
    ->search({},{prefetch=>'person_asked_by'});

  $zoom->repeat('#questions' => sub {
    HTML::Zoom::CodeStream->new({
      code => sub {
        while (my $row = $rs->next) {
          return sub {
            $_->replace_content('.title' => $row->title)
              ->replace_content('.asked_by' => $row->person_asked_by->handle)
              ->replace_content('.asked_on' => $row->asked_on->dmy .' '. $row->asked_on->hms)
          }
        }
        return
      },
    })
  })->to_html;

}

__PACKAGE__->meta->make_immutable;
