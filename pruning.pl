#/usr/bin/perl
use Dir::Self;
use lib __DIR__ . "/src";
use lib __DIR__ . "/API";
use Getopt::Long;
use prune;

GetOptions("help!"=>\$help,"resource=s"=>\$db_file,"input=s"=>\$input,"output:s",\$output);
print "Unprocessed by Getopt::Long\n" if $ARGV[0];
foreach (@ARGV) {
	print "$_\n";
	exit(0);
}
if($help eq 1)
{
	print "PRUNE - Pruning Version 1.9\n     (14th July 2007 last modified on 15th June 2010)\n\n";
	print "usage : ./pruning.pl --resource=\"mapping file\" [--input=\"input_file\"] [--output=\"output_file\"] \n";
	print "\t --resource: Mapping file (data_bin/mapping.dat)\n";
	print "\t --input   : Input file\n";
	print "\t --output  : Output file\n";
	exit(0);
}

if($db_file eq "")
{
	print "Please Specify the Path of the dat file\n";
	exit(0);

}

if(!-e $db_file)
{
	print "The file doesn't exist\n";
	print "Please Specify the Path of the dat file properly\n";
	exit(0);
}
if ($input eq "")
{
	$input="/dev/stdin";
}

prune($db_file, $input, $output);
