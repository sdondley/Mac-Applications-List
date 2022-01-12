use v6;
unit module Mac::Applications::List;

class MacAppList is export(:MANDATORY) {
    has @.app_list;
    has @!app_dirs;

    submethod BUILD() {
      # prime directory list with common dirs to look for apps
      @!app_dirs = '/System/Applications',
                   '/Applications',
                   %*ENV<HOME> ~ '/Applications';
      @!app_dirs = grep { .IO.d }, @!app_dirs;
    }

    method exists(Str:D $app) {
        return $app ~~ any @!app_list 
    }

    method print() {
        put @!app_list.sort.join(", ");
    }

    #TODO: get real name of localized apps
    method find_apps(*@dirs where .all ~~ Str:D) {
        @!app_dirs.append(@dirs) if @dirs;
        @!app_dirs = @!app_dirs.unique;
        while @!app_dirs {
            for @!app_dirs.pop.IO -> $dir {
                if !$dir.IO.d {
                    warn "$dir is not a directory";
                    next;
                }
                for dir($dir, test => { "$dir/$_".IO.d && "$dir/$_".IO.basename !~~ /^\.**1..2$/  } ) -> $file {
                    if $file.extension eq 'app' {
                        my $macOS_dir = $file.Str ~ '/Contents/MacOS';
                        if $macOS_dir.IO.d {
                            @!app_list.push($file.extension('').basename);
                        }
                    } else {
                        @!app_dirs.push($file.Str);
                    }
                }
            }
        }
        @!app_list.push('Finder');
        return @!app_list.unique;
    }
}

sub apps(|c) is export(:MANDATORY) {
    return MacAppList.new.find_apps(|c);
}

