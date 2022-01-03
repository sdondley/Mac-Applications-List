use Test;
use lib 'lib';
use Mac::Applications::List;

plan 2;

my @apps = apps;
is @apps.Bool, True, 'returns a list of apps';
is ('Safari' ~~ any @apps), True, 'finds Safari';

done-testing;
