## Name

Mac::Applications::List - get a list of applications on your macOS machine

## Synopsis

### Functional programming style:

```
use Mac::Applications::List;
my @apps = apps;
my @apps = apps '/some/path';
my @apps = apps < /path/to/dir1 /path/to/dir2 >;
say @apps;
```

### OO programming interface:

```
use Mac::Applications::List;

my $my_apps = MacAppList.new();    # create a MacAppList object
$my_apps.find_apps('/some/dir');   # populate object
$my_apps.exists('Safari');         # test to see if an app exists
$my_apps.print;                    # print out a list of apps
$my_apps.list;                     # return an array of apps
```

## Description

This module finds and generates a list of applications found in the standard locations
on macOS.

In the simplest usage, an automatically exported function, `apps`, returns
a List of the apps found.

An OO interface is also provided which provides convenient methods for
determining if an app exists, printing the list of apps, and returning the list
of apps found.

Be default, the module searches `/System/Applications`, `/Applications`, and
`~/Applications` directories. Additional directories can be searched by passing string
arguments, representing the paths of directories to be searched.

## Functions

### sub apps( [  < dir1 dir2 ... >, Bool :$full-path = False  ] )

### sub apps( [  'dir', Bool :$full-path = False ] )

Returns a unique List of application names found in standard
application installation directories on macOS. A string or array of strings of
paths to other directories can be included to search additional directories.

Set the `:full-path` options to have paths to the apps included. Otherwise,
the List contains only the names of the apps.

If the directory does not exist, the module generates a warning. The function
will still return a list of applications found in other directories.

## Methods

### new( [  < dir1 dir2 ... > ] )

### new( [ 'dir' ] )

Creates a new MacAppList object, optionally initialized with directories to
search which will be searched in addition to standard app directory locations.

Initialization also initiates a search for new apps in standard locations,
plus any directories the object was initialized with plus any optional directories
provided.

Returns the `<Mac::Applications::List>` object.

### app-list()

Returns an List of all apps names found.

### app-path-list()

Returns a List of all paths to the apps found.

### exists( Str )

Determines if an app exists. Returns a boolean value.

### print()

Prints out a comma-separated, alphabetical listing of apps to the command line

## INSTALLATION

Assuming Raku and zef is already installed, install the module with:

`zef install Mac::Applications::List`

If you don't have Raku with zef installed yet, it's easiest to install them both with homebrew if you already have brew
installed:

`brew install rakudo-star`

If you don't have brew installed, install it with:

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`

Note, however, that the homebrew install may be months out of date.

To ensure you get the absolute latest version of Raku, [see this
page](https://course.raku.org/essentials/how-to-install-rakudo/) for other
installation options. Whatever method you choose to install Raku, just be sure
the `zef` command gets installed and is working on your machine as well.

## Bugs and Limitations

This app will not find apps that have been "localized," i.e. apps contained in
a directory with a ".localized" extension. A future release will address this
issue.

## Author

Steve Dondley

## Copyright and License

©2022 – Cosmic heat death under the [Artistic License, v2.0](https://opensource.org/licenses/Artistic-2.0)

