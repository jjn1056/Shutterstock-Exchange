#!/usr/bin/env plackup

use Modern::Perl;
use Shutterstock::Exchange::Web;

Shutterstock::Exchange::Web->psgi_app;
