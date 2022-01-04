# Mac::Applications::List

This module find and returns a list of applications in the standard locations
on macOS plus other directories passed to the to `apps()` function.

## Synopsis

```
use Mac::Applications::List;
my @apps = apps;
my @apps = apps '/some/path';
my @apps = apps [ '/path/to/dir1', '/path/to/dir2' ];
```

## Description

This module provides a single function, `apps`, which takes an optional array
of strings or single string argument. The function is automatically exported.

This function searches for apps in the `/System/Applications`, `/Applications`,
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
do not included the path to the applications, just the application name.

If the directory does not exist, a warning will be thrown. The function will
still return a list of applications found in other direcgtories.

## Author

Steve Dondley

## Copyright and License

©2022 – Cosmic heat death under the [Artistic License, v2.0](https://opensource.org/licenses/Artistic-2.0)

