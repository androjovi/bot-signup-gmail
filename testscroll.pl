#!/usr/bin/perl 

# Wed  2 Oct 09:50:32 WIB 2019
# sutedja@wahana.com
# sendwa.pl

use strict;
use Data::Dumper;
use Try::Tiny;
use Getopt::Std;

use Appium;
use Selenium::ActionChains;
use Selenium::Remote::Driver;
use Appium::TouchActions;


my $srun = time();

my %options = ();
getopts("p:m:f:l:u:a:y:",\%options);
print $options{p};
print $options{m};

my $phone = $options{p};
my $avd = '07a8b8ea0704';
#my $avd = 'J9AXGF03C6972TN';

my $capsChrome = {
		platformName =>  'Android',
		platformVersion =>  '8.0',
		deviceName =>  'Android Emulator',
		noReset =>  'true',
		fullRest =>  'false',
		automationName =>  'UiAutomator2',
		udid => $avd,
		appPackage =>  'com.android.chrome',
		appActivity =>  'com.google.android.apps.chrome.Main'
};

my $capsWhatsApp = {
		platformName =>  'Android',
		platformVersion =>  '8.0',
		deviceName =>  'Android Emulator',
		noReset =>  'true',
		fullRest =>  'false',
		automationName =>  'UiAutomator2',
		appPackage =>  'com.whatsapp.w4b',
		appActivity =>  'com.whatsapp.w4b.HomeActivity'
};

my $appium = Appium->new(
	caps => $capsChrome
);

try {
my $msg = $options{m};
$msg =~ s/ /%20/g;

my $firstName = $options{f};
my $lastName = $options{l};
my $username = $options{u};
my $passwd = $options{a};
my $vertelp = $options{y};

my $velem = undef;
my $vemsg = undef;

my %keycodedroid = (
"A" => 29,
"B" => 30,
"C" => 31,
"D" => 32,
"E" => 33,
"F" => 34,
"G" => 35,
"H" => 36,
"I" => 37,
"J" => 38,
"K" => 39,
"L" => 40,
"M" => 41,
"N" => 42,
"O" => 43,
"P" => 44,
"Q" => 45,
"R" => 46,
"S" => 47,
"T" => 48,
"U" => 49,
"V" => 50,
"W" => 51,
"X" => 52,
"Y" => 53,
"0" => 7,
"1" => 8,
"2" => 9,
"3" => 10,
"4" => 11,
"5" => 12,
"6" => 13,
"7" => 14,
"8" => 15,
"9" => 16,
);


#my $velem = $appium->find_element('//*[@resource-id="com.android.chrome:id/url_bar"]', 'xpath');
#$velem->click;

#$velem->send_keys("https://www.google.com/search?q=dropdown+selected+value&oq=dropdown&aqs=chrome.1.69i57j35i39l2j69i60l3.2094j0j7&sourceid=chrome&ie=UTF-8");
#$appium->execute_script("mobile: performEditorAction", {action => "search"});
#my $script = q{window.scrollTo(0,document.body.scrollHeight);};
#     my $elem = $appium->execute_script($script);

$appium->execute_script(
    'mobile: scroll',
    { strategy => 'accessibility id', selector => undef }
);



# tap in the center of the screen
#$appium->scrollTo( "Tabs" );


sleep(20);
    } catch {
	print $_;
};

#$appium->quit;
my $erun = time();
my $rrun = $erun - $srun;
print "$rrun Seconds\n";

sleep(5);
1;

