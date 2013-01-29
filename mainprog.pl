#!/usr/bin/perl -w
use strict;
use warnings;

my $num;
my $fh;

foreach $fh (@ARGV) {
        system(blastn -query $fh -db est_db -out est_matches -outfmt \"6 std qlen slen\");
        open(FILE, "<est_matches($fh)") or die "Something is wrong. Look at this: $!";
        open(NFILE, ">est_matches($fh).tex") or die "This couldn't be opened. Here's why: $!";
         print NFILE "\\documentclass{report} \n";
                print NFILE "\\usepackage{graphicx} \n";
                print NFILE "\\usepackage{pslatex} \n";
                print NFILE "\\usepackage{setspace} \n";
                print NFILE "\\usepackage{amsmath} \n";
                print NFILE "\\usepackage{amsthm} \n";
                print NFILE "\\usepackage{amssymb} \n";
                print NFILE "\\usepackage[top=1.5in,bottom=1.5in]{geometry} \n";
                print NFILE "\\title{miRNA BLAST results: $fh \n";
                print NFILE "\\date{\today} \n";
        while(<FILE>){
                $num=0;
                my ($queryid, $subjectid, $pctidentity, $alignment_length, $mismatches, $gap_opens, $query_start, $query_end, $subject_start, $subject_end, $evalue, $bit_score, $qlen, $slen) = split;
                print NFILE "\\section*{$subjectid Results} \n";
                print NFILE "\\maketitle \n" if $num ==0;
                print NFILE "miRNA query id: $queryid \n";
                print NFILE "miRNA subject id: $subjectid\n";
                print NFILE " \n";
                print NFILE " \n";
                print NFILE " \n";
                print NFILE "E-score for $subjectid: $evalue \n";
                print NFILE "Bit score for $subjectid: $bit_score \n";
                print NFILE " \n";
                print NFILE " \n";
                print NFILE " \n";
                print NFILE " \n";
                print NFILE " \n";
                $num++;
        }
        close(FILE, ">est_matches($fh)");
        close(NFILE, "<est_matches($fh).tex");
}
