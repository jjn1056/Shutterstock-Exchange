package Template::Plugin::IncludeUtils;

use strict;
use warnings;
use Scalar::Util 'blessed';

use base 'Template::Plugin';

sub new {
  my ($class, $context) = @_;
  bless { ctx => $context }, $class;
}

sub fill_from_hashref {
  return (shift)->{ctx}->include(@_);
}

sub fill_from_row {
  my ($self, $template, $row) = @_;
  my %stash = map { $_ => $row->$_ } (
    $row->result_source->columns,
    $row->result_source->relationships);
  return $self->{ctx}->include($template, \%stash);
}

sub fill_from_array {
  my ($self, $template, $items, $content) = @_;
  if(my $result = shift @$items) {
    $content .= $self->fill($template, $result);
    return $self->fill_from_array($template, $items, $content);
  } else {
    return $content;
  }
}

sub fill_from_resultset {
  my ($self, $template, $rs, $content) = @_;
  if(my $result = $rs->next) {
    $content .= $self->fill($template, $result);
    return $self->fill_from_resultset($template, $rs, $content);
  } else {
    return $content;
  }
}

sub fill {
  my ($self, $template, $model, $content) = @_;

  if(blessed($model) && $model->isa('DBIx::Class::ResultSet')) {
    return $self->fill_from_resultset($template, $model, $content);
  }

  elsif(blessed $model && $model->isa('DBIx::Class::Row')) {
    return $self->fill_from_row($template, $model, $content);
  }

  elsif(ref $model eq 'HASH') {
    return $self->fill_from_hashref($template, $model, $content);
  }

  elsif(ref $model eq 'ARRAY') {
    return $self->fill_from_array($template, $model, $content);
  }

  else {
    die "I don't know how to fill using the model you gave me.";
  }
}

1;
