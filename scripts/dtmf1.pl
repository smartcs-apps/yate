#!/usr/bin/perl
use lib 'scripts/';
use YateMessage;

sub OnDTMF($) {
  my $message = shift;
  $message->warn("GOT DTMF %s\n",$message->param("text"));
  #$message->dump();

}

sub OnNotify($) {
  my $message = shift;
  print "GOT Message.\n";
  #$message->dump();
}

my $message = new YateMessage();
$message->install("chan.dtmf",\&OnDTMF,10);
$message->install("chan.notify",\&OnNotify);

$message->listen();
