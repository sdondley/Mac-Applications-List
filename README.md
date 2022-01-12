## Name
Mac::Applications::List - get a list of applications on your macOS machine

## Synopsis

### Functional programming style:
```
use Mac::Applications::List;
my @apps = apps;
my @apps = apps '/some/path';
my @apps = apps < /path/to/dir1 /path/to/dir2 >;
```

### OO programming interface:
```
use Mac::Applications::List;

my $my_apps = MacAppList.new(); # create a MacAppList object
$my_apps.apps('/some/dir');     # populate object
$my_apps.exists('Safari');      # test to see if an app exists
$my_apps.print;                 # print out a list of apps
$my_apps.list;                  # return an array of apps

```

## Description
This module finds and generates a list of applications in the standard locations
on macOS. Since applications can be located anywhere and it's not practical to
search the entire drive, additional directories can be passed to the to
`apps()` function or method.

In the simplest usage, the module provides a single function, `apps`, which
takes an optional argument of an array of strings or a string scalar. The
function is automatically exported.

An OO interface is also provided which provides convenient methods for
determining if an app exists, printing the list of apps, and returning the list
of apps found.

The module searches `/System/Applications`, `/Applications`, and
`~/Applications` directories and their subdirectories as well as the
directories and subdirectories of the directory paths passed to the function.

The optional argument to `apps` is a string or array of strings representing
paths to additional directories to be searched for applications.

## Functions

### sub apps( [  < dir1 dir2 ... >  ] )
### sub apps( [  'dir'  ] )

Generates and returns unique array of application names found in standard
application installation directories on macOS. A string or array of strings of
paths to other directories can be included to search additional directories.

Returns an array of strings of the names of the applications found. The strings
do not include the path to the applications, just the application name.

If the directory does not exist, the module generates a warning. The function
will still return a list of applications found in other direcgtories.

## Methods

### new()
Creates a new MacAppList object

### find_apps( [  < dir1 dir2 ... >  ] )
### find_apps( [  'dir'  ]  )
Searches for new apps. Returns an array of apps.

### exists( Str )
Determines if an app exists. Returns boolean.

### print()
Prints out a aplphabetical list of apps to the command line

### app_list()
Returns an array of apps.

## Bugs and Limitations
This app will not find apps that have been "localized," i.e. apps contained in a diectory with a ".localized" extension. A future release will address this issue.

## Author
Steve Dondley

## Copyright and License

©2022 – Cosmic heat death under the [Artistic License, v2.0](https://opensource.org/licenses/Artistic-2.0)

