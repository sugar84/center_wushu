#!/usr/bin/env /usr/bin/perl
use strict;
use warnings;

use FindBin::libs;
use Mojolicious::Command::Fastcgi;

$ENV{MOJO_APP} = 'Wushu';
Mojolicious::Command::Fastcgi->new->run;
