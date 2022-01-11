use Test;
use lib 'lib';
use Mac::Applications::List;

plan 6;

# check OS
is 'darwin', VM.osname(), 'running macOS';

# no arg
my @apps = apps;
is @apps.Bool, True, 'returns a list of apps';
is ('Safari' ~~ any @apps), True, 'finds Safari';

# with args
my @path = < /Applications >;
@apps = apps @path;
is @apps.Bool, True, 'returns a list of apps';

@apps = apps < /Applications >;
is @apps.Bool, True, 'returns a list with list argument';


@apps = apps '/Applications';
is @apps.Bool, True, 'returns a list of apps';


done-testing;
