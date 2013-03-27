#!/usr/bin/perl
use strict;
use warnings;

#######################################################
# generate a list of abbreviated journal names
# based on your Mendeley library .bib file(s)
#
# created
# [2012-02-09]	Alex M. Chubaty (alex.chubaty@gmail.com)
#				Charles Stevens
# updated
# [2013-02-27]	Filipe G. Vieira
#
# updated for max osx (chaning instrcutions too)
# [2013-04-01] wouter van den bos
#######################################################


# usage: masterlist.txt *.bib
if($#ARGV <= 0) {
    print("ERROR: No files provided!\nUsage:\n\t./script.pl master_abb.txt lib1.bib lib2.bib ... libN.bib\n");
    exit(1);
}

my $master_abbrev = shift(@ARGV);

# read all files and store them
my @allJournals;
while(<>){
    my $line = substr($_, 0, 7);
    if ($line eq 'journal') {
	chomp;
	$_ = substr($_, 11, -2);
	push(@allJournals, $_);
    }
}

# remove duplicate journal entries and sort alphabetically
@allJournals = sort { $a cmp $b } unique(@allJournals);

# Create journal abbrev output file in directory that script is started.
#This circumvents path issues cross platform but means you need to make sure you put the new default.txt in the right place afterwards.
open OUTFILE, ">", "default.txt" or die "$!";

# read in the master list of journals
#	(this was taken from the ISI journal list at:
#	http://images.webofknowledge.com/WOK46/help/WOS/A_abrvjt.html
#	accessed Feb 8, 2012)
open (INFILE, "<".$master_abbrev) || die "$!";
while (<INFILE>) {
	chomp;
	my ($jfull, $jabbrev) = split("\t", $_);

	foreach my $jtitle (@allJournals) {
	    if (lc($jtitle) eq lc($jfull)) {
		print(OUTFILE $jtitle, "\t", title_case($jabbrev), "\n");
	    }
	}
}
close(INFILE);
close(OUTFILE);
exit(0);



# subroutines
sub title_case {
    my @title;

    foreach my $word (split(/ /,shift)) {
	$word = lc($word);

	if($word eq '&') {
	    $word = '\&';
	} elsif(
	    $word eq 'i' ||
	    $word eq 'ii' ||
	    $word eq 'iii' ||
	    $word eq 'iv' ||
	    $word eq 'v' ||
	    $word eq 'vi' ||
	    $word eq 'vii' ||
	    $word eq 'viii' ||
	    $word eq 'ix' ||
	    $word eq 'x' ||
	    $word eq 'xi' ||
	    $word eq 'xii' ||
	    $word eq 'xiii' ||
	    $word eq 'xiv' ||
	    $word eq 'xv' ||
	    $word eq 'xvi' ||
	    $word eq 'xvii' ||
	    $word eq 'xviii' ||
	    $word eq 'xix' ||
	    $word eq 'xx' ||
	    $word eq 'xxi' ||
	    $word eq 'xxii' ||
	    $word eq 'xxiii' ||
	    $word eq 'xxiv' ||
	    $word eq 'xxv' ||
	    $word eq 'xxvi' ||
	    $word eq 'xxvii' ||
	    $word eq 'xxviii' ||
	    $word eq 'xxix' ||
	    $word eq 'xxx' ||
	    $word eq 'ieee' ||
	    $word eq 'bmc'
	    ) {
	    $word = uc($word);
	} elsif (
	    $word eq 'and' ||
	    $word eq 'in' ||
	    $word eq 'of' ||
	    $word eq 'on' ||
	    $word eq 'the' ||
	    $word eq 'to'
	    ) {
	    $word = lc($word);
	} else {
	    $word =~ s/(\w+)/\u\L$1/g;
	}
	push(@title,$word);
    }
    return join(" ", @title);
}

sub unique {
    return keys %{{ map { $_ => 1 } @_ }};
}
