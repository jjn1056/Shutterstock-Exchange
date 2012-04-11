use Modern::Perl;
use Digest;
use DateTime;
use DBIx::Class::Migration::RunScript;

migrate {

  return unless $ENV{SEED_SHUTTERSTOCK_EXCHANGE};

  my $encoder = sub {
    my $digester = Digest->new('SHA-256');
    my ($plain_text) = @_;
    $digester->add($plain_text);
    return $digester->b64digest;
  };

  my $person_rs = (my $self = shift)
    ->schema->resultset('Person');

  my ($john, $logan) = map { $person_rs
     ->create($_) } (
    { handle => 'John', email => 'johnn@shutterstock.com', password => $encoder->('abc123') },
    { handle => 'Logan', email => 'lbell@shutterstock.com', password => $encoder->('abc123') },
  );

  my $why_chicken = $john->create_related(questions =>
    { title => "Why did the chicken cross the road?",
      details => "I saw this chicken one day",
        asked_on => DateTime->now});

  my $answer = $logan->create_related(answers =>
    { content => "To get to the other side!", question_id => $why_chicken->id });

}

