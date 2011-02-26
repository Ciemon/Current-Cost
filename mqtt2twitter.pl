#!/usr/bin/perl
#
# mqtt2twitter.pl
#
# Subscribe to an MQTT topic and post received messages to twitter.
# The *vast* majority of this is taken from the "subscribe.pl" example
# that is part of the WebSphere::MQTT::Client cpan module.
#
# To use, install WebSphere::MQTT::Client with cpan, set the username, password
# and topic variables below and then run. The post a message to the subscribed
# topic with another client.
#
# There is a publish example in the WebSphere::MQTT::Client module.

use WebSphere::MQTT::Client;
use Data::Dumper;
use LWP::UserAgent;
use strict;

my $username = "WaitingCloud";
my $password = "lynx6686";
my $mqtt_topic = "test";

# 
my $mqtt = new WebSphere::MQTT::Client(
	Hostname => 'localhost',
	Port => 1883,
	Debug => 1,
);


# Connect to Broker
my $res = $mqtt->connect();
die "Failed to connect: $res\n" if ($res);

print Dumper( $mqtt );


sleep 1;
print "status=".$mqtt->status()."\n";
sleep 1;
print "status=".$mqtt->status()."\n";

# Subscribe to topic
my $res = $mqtt->subscribe( $mqtt_topic );
print "Subscribe result=$res\n";


sleep 2;
print "status=".$mqtt->status()."\n";
sleep 2;

# For sending twitter updates
my $ua = LWP::UserAgent->new;
my $req = HTTP::Request->new(POST => 'http://twitter.com/statuses/update.xml');
$req->content_type('application/x-www-form-urlencoded');

# Get Messages
while( 1 ) {

	my @res = $mqtt->receivePub();
	#errors can be caught by eval { }
	
	$req->content("status=".$res[1]); # set http content as twitter status.
	$req->authorization_basic($username, $password); # set http authorisation
	my $res = $ua->request($req); # send http request
	print Dumper(@res);
}



# Unsubscribe from topic
my $res = $mqtt->unsubscribe( 'twitter' );
print "Unubscribe result=$res\n";


sleep 2;

print "status=".$mqtt->status()."\n";

# Clean up
$mqtt->terminate();

print Dumper( $mqtt );

