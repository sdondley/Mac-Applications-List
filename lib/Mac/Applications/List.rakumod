use v6;
unit module Mac::Applications::List;

my @app_list;
my @app_dirs = < /System/Applications /Applications >;

# add home directory
@app_dirs.push(%*ENV<HOME> ~ '/Applications');

#TODO: get real name of localized apps
sub apps(*@dirs where .all ~~ Str:D) is export(:MANDATORY) {
    @app_dirs.append(@dirs) if @dirs;
    while @app_dirs.unique {
        for @app_dirs.pop.IO -> $dir {
            if !$dir.IO.d {
                warn "$dir is not a directory";
                next;
            }
            for dir($dir, test => { "$dir/$_".IO.d && "$dir/$_".IO.basename !~~ /^\.**1..2$/  } ) -> $file {
                if $file.extension eq 'app' {
                    my $macOS_dir = $file.Str ~ '/Contents/MacOS';
                    if $macOS_dir.IO.d {
                        @app_list.push($file.extension('').basename);
                    }
                } else {
                    @app_dirs.push($file.Str);
                }
            }
        }
    }
    return @app_list.unique;
}
