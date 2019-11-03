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

binmode STDOUT, ":utf8";

my $mw = tkinit(-background => 'white');
$mw->geometry('640x480');

my $link_text = 'http://www.metacpan.org';

my $reference_hl = $mw->Label(
    -text => $link_text,
    -foreground => 'blue',
    -background => 'white',
)->pack;

my $section_frame = $mw->Frame()->pack(-fill => 'x');

my $left_text_label = $section_frame->Label(-text => 'For more information, have a look at the website ')->pack(-side => 'left',);
my $hl = $section_frame->Button(
    -text => $link_text,
    -relief => 'flat',
    -overrelief => 'raised',
    -foreground => 'blue',
    -activeforeground => 'blue',
    -command => sub{ say "callback here"; },
);

# issue with fonts: I do not know how to get the default font properly
# just adding underline changes the font
#my $current_font = $hl->Font;
#$current_font->configure(-underline => 1,);
#print Dumper $current_font;
#$hl->configure(-font => $current_font);

$hl->pack(-side => 'left',);

my $right_text_label = $section_frame->Label(-text => 'For more information, have a look at the website ')->pack(-side => 'left',);


# bindings
# a) hover over link
# b) leave link hover
# c) click link
# d) click release link

$hl->bind('<Any-Enter>', sub{
    highlight_link($hl, 'raised', 'hand2');
});

$hl->bind('<Any-Leave>', sub{
    highlight_link($hl, 'flat', 'xterm');
});

#$hl->bind('<Button-1>', sub{
#    highlight_link($hl, 'sunken', undef);
#});
#
#$hl->bind('<ButtonRelease-1>', sub{
#    highlight_link($hl, 'raised', undef, sub{ say "callback here"; });
#});



$mw->MainLoop;


sub highlight_link {
    my ($calling_widget)      = shift;
    my ($relief) = shift;
    my ($cursor) = shift;
    my ($callback)  = shift;
    
    # by configuring the relief (to simulate a button press)
    $calling_widget->configure( -relief => $relief, -borderwidth => 1 );

    # by changing the cursor between hand and xterm
    $calling_widget->configure( -cursor => $cursor ) if ($cursor);

    # and by scheduling the specified action to run "soon"
    if ($callback) {
        my $hyperlink = 'TODO: get property from megawidget';
        
        # The method $w->MainWindow applied to any widget will return the MainWindow to which the widget belongs (the MainWindow belongs to itself).
        my $mainwindow = $calling_widget->MainWindow;
        $mainwindow->after( 200, [ $callback, $calling_widget, $hyperlink, @_ ] );
    }
    
} # /highlight_link