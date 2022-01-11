# Mac::Applications::List

This module finds and returns a list of applications in the standard locations
on macOS and other directories passed to the to `apps()` function.

## Synopsis

```
use Mac::Applications::List;
my @apps = apps;
my @apps = apps '/some/path';
my @apps = apps < /path/to/dir1 /path/to/dir2 >;
```

## Description

This module provides a single function, `apps`, which takes an optional
argument of an array of strings or a string scalar. The function is
automatically exported.

The module searches `/System/Applications`, `/Applications`, and
`~/Applications` directories and their subdirectories as well as the
directories and subdirectories of the directory paths passed to the function.

The optional argument to the `apps` is a string or array of strings
representing paths to additional directories to be searched for applications.

## Functions

### multi apps( $dirs = [] )
### multi apps( Str $dir )

Generates and returns unique array of application names found in standard
application installation directories on macOS. A string or array of strings of
paths to other directories can be included to search additional directories.

Returns an array of strings of the names of the applications found. The strings
do not include the path to the applications, just the application name.

If the directory does not exist, the module generates a warning. The function
will still return a list of applications found in other direcgtories.

## Bugs and Limitations
This app will not find apps that have been "localized," i.e. apps contained in a diectory with a ".localized" extension. A future release will address this issue.

## Author
Steve Dondley

## Copyright and License

©2022 – Cosmic heat death under the [Artistic License, v2.0](https://opensource.org/licenses/Artistic-2.0)

