#!/usr/bin/env perl

use Mojolicious::Lite;

use Cwd;
app->static->paths->[0] = getcwd;

any '/' => sub {
  shift->reply->static('google1eb121720d825b8d.html');
};

app->start;