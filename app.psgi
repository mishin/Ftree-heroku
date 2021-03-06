#!"c:\Users\TOSH\Documents\job\perl\strawberry-perl-5.20.0.1-64bit-portable\perl\bin\perl.exe"
#!"c:\Dwimperl\perl\bin\perl.exe"

use strict;
use warnings;

use CGI::Emulate::PSGI;
use CGI::Compile;

my $cgi_script = "ftree.cgi";
my $sub = CGI::Compile->compile($cgi_script);
my $app = CGI::Emulate::PSGI->handler($sub);

# my $app = CGI::Emulate::PSGI->handler(
    # sub {
        # use CGI qw(param);
        # # use FindBin;
        # # use lib "$FindBin::Bin";
        # # use lib "$FindBin::Bin/lib";

        # my $family_tree;
        # my $type = CGI::param("type");
        # if ( defined $type && $type eq "tree" ) {
            # require FamilyTreeGraphics;
            # $family_tree = FamilyTreeGraphics->new();
        # }
        # else {
            # require FamilyTreeInfo;
            # $family_tree = FamilyTreeInfo->new();
        # }
        # $family_tree->main();

        # # exit;
        # # use My::CgiApp1;
        # # My::CgiApp1::executer->run();
    # }
# );

my $cgi_person = "person_page.cgi";
my $sub_person = CGI::Compile->compile($cgi_person);
my $app2 = CGI::Emulate::PSGI->handler($sub_person);

# my $app2 = CGI::Emulate::PSGI->handler(
    # sub {
        # use CGI qw(param);
        # # use FindBin;
        # # use lib "$FindBin::Bin";
        # # use lib "$FindBin::Bin/lib";
        # use PersonPage;

        # my $family_tree = PersonPage->new();
        # $family_tree->main();

        # # exit;
        # # use My::CgiApp1;
        # # My::CgiApp1::executer->run();
    # }
# );

use Plack::Builder;

# use Plack::App::File;
# my $html   = Plack::App::File->new(root => "/");
# builder {
# mount "/static" => Plack::App::File->new(root => "./");
# mount "/" => $app;
# };

# use Plack::Builder;
my $app3 = sub {
    return [ 200, [],
        ["google-site-verification: google1eb121720d825b8d.html"] ];
};

builder {
    enable "Plack::Middleware::Static",
      path => qr{[gif|png|jpg|swf|ico|mov|mp3|pdf|js|css]$},
      root => './';

    # $app;
    mount "/person_page"                 => $app2;
    mount "/ftree"                       => $app;
    mount "/google1eb121720d825b8d.html" => $app3;

    # enable "Static", path => qr!^/static!, root => '/';
    mount "/" => builder { $app };

    # mount "/" => $html;
};

# $app is a PSGI application
# use CGI qw(param);

#######################################################
#
# Family Tree generation program, v2.0
# Written by Ferenc Bodon and Simon Ward, March 2000 (simonward.com)
# Copyright (C) 2000 Ferenc Bodon, Simon K Ward
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# For a copy of the GNU General Public License, visit
# http://www.gnu.org or write to the Free Software Foundation, Inc.,
# 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
#
#######################################################
#
# What it does:
# * Generates a family tree from a simple underlying data file.
# * A tree can be plotted based around any person in the tree.
# * Any number of levels of ancestors/descendants can be shown,
#   using the zoom in/out buttons.
# * Additional information can be entered about each person:
#      dates, email, web-page for any further info
#
#######################################################
# * Call the script with the following parameters
#   - type (tree, email, bdays, snames, etc)
#   - name (tree will be drawn for this person)
#   - levels (tree will have this no. levels above and below)
#   - password (if a password is required, or "demo")
#   - lang (languages, i.e en, de, hu, it, fr)
# * Pass these parameters or in GET format (like
#   type=tree;name=fred;levels=1;lang=en;password=dummy)
#
#######################################################
#
# For a demonstration of this software, and details of how the
# underlying data file is formatted, visit here:
# http://www.cs.bme.hu/~bodon/Simpsons/cgi/ftree.cgi
# #

# use FindBin;
# use lib "$FindBin::Bin";
# use lib "$FindBin::Bin/lib";

# my $family_tree;
# my $type = CGI::param("type");
# if(defined $type && $type eq "tree")
# {
# require FamilyTreeGraphics;
# $family_tree = FamilyTreeGraphics->new();
# }
# else {
# require FamilyTreeInfo;
# $family_tree = FamilyTreeInfo->new();
# }
# $family_tree->main();

# exit;

