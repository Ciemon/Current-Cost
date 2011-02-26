#!/usr/bin/perl -w

use strict;
use FileHandle;
use Switch;

my $subclient = "/usr/bin/mosquitto_sub -t sensors/cc128/raw -q 0";

open(SUB, "$subclient|");

SUB->autoflush(1);

while (my $line = <SUB>) {
    if ($line =~ m!<time>(........)</time><tmpr>*([\-\d.]+)</tmpr><sensor>(\d+)</sensor>.*<ch1><watts>0*(\d+)</watts></ch1>!) {
        my $date = $1;
        my $temp = $2;
        my $sensor = $3;
        my $watts = $4;
 
	system("rrdtool update powertemp.rrd N:$watts:$temp");
        #print "$watts, $temp\n";
    }
}
