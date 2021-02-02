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


my $srun = time();

my %options = ();
getopts("p:m:f:l:u:a:y:q:",\%options);
print $options{p};
print $options{m};

my $phone = $options{p};
my $avd = '07a8b8ea0704';
#my $avd = '13d32f2d';
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


my $firstNamex = $options{f};
my $lastNamex = $options{l};
my $usernamex = $options{u};
my $passwdx = $options{a};
my $vertelpx = $options{y};
my $urutanx = $options{q};

try {
my $msg = $options{m};
$msg =~ s/ /%20/g;

my $firstName = $options{f};
my $lastName = $options{l};
my $username = $options{u};
my $passwd = $options{a};
my $vertelp = $options{y};
my $urutan = $options{q};

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

#$velem->send_keys("https://www.google.com/url?sa=t&source=web&rct=j&url=https://accounts.google.com/signup%3Fhl%3Den&ved=2ahUKEwjgsavXs53uAhVdxosBHV4YBeMQFjANegQIDBAC&usg=AOvVaw3FJJxI-qjWUb2bq_B0_q6t");
#$appium->execute_script("mobile: performEditorAction", {action => "search"});

sleep(5);
print "Searching done\n";

$velem = $appium->find_element('/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.FrameLayout/androidx.recyclerview.widget.RecyclerView/android.widget.LinearLayout['.$urutan.']', 'xpath');
$velem->click;


print "Click Add Account Done\n";

sleep(10);

my $velem = $appium->find_element('//*[@resource-id="ow312"]', 'xpath');
$velem->click;


sleep(1);

$velem = $appium->find_element('/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[2]/android.view.View/android.view.MenuItem[1]', 'xpath');
$velem->click;

print "Create Account Done\n";

sleep(2);
$velem = $appium->find_element('//*[@resource-id="firstName"]', 'xpath')->send_keys($firstName);
$velem = $appium->find_element('//*[@resource-id="lastName"]', 'xpath')->send_keys($lastName);

$velem = $appium->find_element('//*[@resource-id="collectNameNext"]', 'xpath');
$velem->click;

print "Collect Name Done\n";

sleep(2);
$velem = $appium->find_element('//*[@resource-id="month"]', 'xpath');
$velem->click;

sleep(1);
$velem = $appium->find_element('//*[@resource-id="android:id/text1"]', 'xpath');
$velem->click;

$velem = $appium->find_element('//*[@resource-id="day"]')->send_keys(12);
$velem = $appium->find_element('//*[@resource-id="year"]', 'xpath')->send_keys(1999);

$velem = $appium->find_element_by_xpath('//*[@resource-id="gender"]');
$velem->click;


sleep(1);
$velem = $appium->find_element('//*[@resource-id="android:id/text1"]', 'xpath');
$velem->click;

$velem = $appium->find_element('//*[@resource-id="birthdaygenderNext"]', 'xpath');
$velem->click;

print "Birthday gender Done\n";

sleep(3);
$velem = $appium->find_element('/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[3]/android.view.View/android.view.View/android.view.View[3]', 'xpath');
$velem->click;


sleep(3);
$velem = $appium->find_element('/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[3]/android.view.View/android.view.View[2]/android.view.View[3]/android.view.View', 'xpath');
$velem->click;
my $strusername = $username;
my @strusernametoarr = split("",$strusername);
foreach my $x(@strusernametoarr){
    $appium->press_keycode( $keycodedroid{$x});
    sleep(1);
}

print "Write Email Done\n";

$velem = $appium->find_element('//*[@resource-id="next"]', 'xpath');
$velem->click;

sleep(2);
$velem = $appium->find_element('//*[@resource-id="passwd"]', 'xpath');
if (!$velem){
$velem->click;
my $strpassword = $passwd;
my @strpasswordtoarr = split("",$strpassword);
foreach my $x(@strpasswordtoarr){
    $appium->press_keycode( $keycodedroid{$x});
    sleep(1);
}
}else{
# show password
#$velem = $appium->find_element('//*[@resource-id="selectionc15"]', 'xpath');
#$velem->click;

$velem = $appium->find_element('//*[@resource-id="passwd"]', 'xpath');
$velem->click;
my $strpasswd = $passwd;
my @strpasswdtoarr = split("",$strpasswd);
foreach my $x(@strpasswdtoarr){
    $appium->press_keycode( $keycodedroid{$x});
    print $keycodedroid{$x}."\n";
    sleep(1);
}

#confirm password
$velem = $appium->find_element('//*[@resource-id="confirm-passwd"]', 'xpath');
$velem->click;
foreach my $z(@strpasswdtoarr){
    $appium->press_keycode( $keycodedroid{$z});
    sleep(1);
}     
}

print "Write Password Done\n";

sleep(3);
$velem = $appium->find_element('/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[4]/android.view.View', 'xpath');
$velem->click;

#$appium->execute_script("mobile: scroll", {strategy => "accessibility id", selector => '//*[@resource-id="next"]'});
#$appium->tap( 0.5, 0.5 );

sleep(5);
$velem = $appium->find_element('/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View[4]/android.view.View','xpath');
$velem->click;


sleep(5);
$velem = $appium->find_element('//*[@resource-id="next"]', 'xpath');
$velem->click;

sleep(5);
$velem = $appium->find_element('//*[@resource-id="termsofserviceNext"]', 'xpath');
$velem->click;


print "Regulations Done\n";


sleep(10);
    } catch {
	print $_;
};

#$appium->quit;
my $erun = time();
my $rrun = $erun - $srun;
print "$rrun Seconds\n";
print "Detail agen $firstNamex $lastNamex $usernamex $passwdx $urutanx\n------\n";
sleep(5);
1;

