use v6.d;
use Test;
use lib 'lib';
use Mac::Applications::List;

plan 9;
# check OS
is 'darwin', VM.osname(), 'running macOS';

# no arg
my @apps = MacAppList.new.find_apps;
is @apps.Bool, True, 'returns a list of apps';
is ('Safari' ~~ any @apps), True, 'finds Safari';

my $app_list = MacAppList.new();
$app_list.find_apps;
is True, $app_list.exists('Safari'), 'exists method works';


is apps.Bool, True, 'functional interface works';

# with args
my @path = < /Applications >;
@apps = MacAppList.new.find_apps(@path);
is @apps.Bool, True, 'returns a list of apps';

is apps(@path).Bool, True, 'returns a list of apps with functional interface';

@apps = MacAppList.new.find_apps(< /Applications >);
is @apps.Bool, True, 'returns a list with list argument';


@apps = MacAppList.new.find_apps('/Applications');
is @apps.Bool, True, 'returns a list of apps';

done-testing;
