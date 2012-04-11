package Shutterstock::Exchange::Web;

our $VERSION = '0.01';

use Moose;
use Catalyst qw/
  ConfigLoader
  URLMap
  EnableMiddleware
  Session
  Session::Store::TestMemcached
  Session::State::Cookie
/;

extends 'Catalyst';

__PACKAGE__->config(
  'Plugin::ConfigLoader' => {
    file => __PACKAGE__->path_to('share', 'etc')});

__PACKAGE__->setup;
__PACKAGE__->meta->make_immutable;

