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

my $mw = tkinit(-background => 'white');
$mw->geometry('640x480');

my $link_text = 'http://www.metacpan.org';
my $link_callback = sub{ say "callback here"; };
#my $link_callback = sub{ system('start', $link_text); };



my $hyperlink_sample1 = $mw->Frame()->pack(-fill => 'x');

$hyperlink_sample1->Label(-text => 'This is a hyperlink to the metacpan web site: ')->pack(-side => 'left',);
$hyperlink_sample1->HyperlinkButton(
    -text => 'http://www.metacpan.org',
)->pack(-side => 'left',);


my $hyperlink_sample2 = $mw->Frame()->pack(-fill => 'x');

$hyperlink_sample2->Label(-text => 'Additional Perl modules can found on the')->pack(-side => 'left',);
$hyperlink_sample2->HyperlinkButton(
    -text => 'http://www.metacpan.org',
)->pack(-side => 'left',);
$hyperlink_sample2->Label(-text => 'web site.')->pack(-side => 'left',);


$mw->MainLoop;
