use Test;
use lib 'lib';
use Mac::Applications::List;

plan 3;

my @apps = apps;
is 'darwin', VM.osname(), 'running macOS';
is @apps.Bool, True, 'returns a list of apps';
is ('Safari' ~~ any @apps), True, 'finds Safari';

done-testing;
