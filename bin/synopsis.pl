#!perl

use strict;
use warnings;
use v5.16;
use utf8;

use FindBin qw/$Bin/;
use lib $Bin . '/../lib';

use Data::Dumper qw/Dumper/;
use Tk;
use Tk::Button;
use Tk::Font;
use Tk::HyperlinkButton;

binmode STDOUT, ":utf8";

my $mw = MainWindow->new();

my $link_text = 'metacpan.org';
my $link_target = 'http://www.metacpan.org';
my $link_callback = sub{ print "your callback here\n"; };

my $hyperlink_widget = $mw->HyperlinkButton(
    -text => $link_text,
    -target => $link_target,
    -command => $link_callback,
);

$hyperlink_widget->pack;

$mw->MainLoop;
