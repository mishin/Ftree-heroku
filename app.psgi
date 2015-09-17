#!/usr/bin/env perl

use Plack::Runner;

my $app    = Plack::App::IndexFile->new({ root => shift })->to_app;
my $runner = Plack::Runner->new;
$runner->parse_options( '--access-log' => '/dev/null', @ARGV );
$runner->run( $app );

package Plack::App::IndexFile;

use parent 'Plack::App::File';

sub locate_file
{
    my ($self, $env) = @_;
    my $path         = $env->{PATH_INFO} || '';

    return $self->SUPER::locate_file( $env ) unless $path && $path =~ m{/$};
    $env->{PATH_INFO} .= 'google1eb121720d825b8d.html';
    return $self->SUPER::locate_file( $env );
}