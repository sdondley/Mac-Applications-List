# Mac::Applications::List

This module lists applications installed in the standard locations on macOS plus
any other directories passed to the to `apps()` function.

## Synopsis

```
use Mac::Applications::List;
my @apps = apps;

# OR

my @apps = apps [ '/paths/to/a/directory', '/and/another/directory' >;
```

## Description

This module provides a single function, `apps`, which takes an optional array as
an argument. The function is automatically exported.

This function searches for apps in the `/System/Applications`, `/Applications`,
`~/Applications` directories and their subdirectories as well as the the
directories and subdirectories of the directory paths passed to the function.

The optional array argument to the `apps` functions should be an array of
strings representing paths to additional directories that will be searched for
applications.

## Functions

`apps( $dirs = [] )`

Generates and returns unique array of application names found in standard
application installation directories on macOS. Accepts an optional array of
strings of paths to other directories.

Returns an array of strings of the names of the applications found without the
path.

## Author

Steve Dondley

## Copyright and License

©2022 – Cosmic heat death under the (Artistic License, v2.0)[https://opensource.org/licenses/Artistic-2.0]

