use v6;
unit module Mac::Applications::List;

class MacAppList is export(:MANDATORY) {
    has @.app-path-list;
    has @.app-list;
    has @!app-dirs;

    submethod BUILD(Str:D @init-dirs?) {
      # prime directory list with common dirs to look for apps
      @!app-dirs = '/System/Applications',
                   '/Applications',
                   %*ENV<HOME> ~ '/Applications';
      push @!app-dirs, @init-dirs if @init-dirs;
      @!app-dirs = grep { .IO.d }, @!app-dirs;
      self!find_apps;
    }

    method app-list {
        return @!app-list.sort.unique.List;
    }

    method app-path-list {
        return @!app-path-list.sort.unique.List;
    }

    method new(*@init-dirs) {
        self.bless(init-dirs => @init-dirs);
    }

    method exists(Str:D $app) {
        return $app ~~ any @!app-list;
    }

    method print() {
        put @!app-list.sort.join(", ");
    }

    # TODO: get real name of localized apps
    method !find_apps(*@dirs where .all ~~ Str:D,) {
        @!app-dirs.append(@dirs) if @dirs;
        @!app-dirs = @!app-dirs.unique;
        while @!app-dirs {
            for @!app-dirs.pop.IO -> $dir {
                if !$dir.IO.d {
                    warn "$dir is not a directory";
                    next;
                }
                for dir($dir, test => { "$dir/$_".IO.d && "$dir/$_".IO.basename !~~ /^\.**1..2$/  } ) -> $file {
                    if $file.extension eq 'app' {
                        my $macOS_dir = $file.Str ~ '/Contents/MacOS';
                        if $macOS_dir.IO.d {
                            @!app-path-list.push($file.Str);
                            @!app-list.push($file.extension('').basename);
                        }
                    } else {
                        @!app-dirs.push($file.Str);
                    }
                }
            }
        }
        return self;
    }
}

sub apps(*@c, Bool :$full-path;) is export(:MANDATORY) {
    my $app-list = MacAppList.new(@c);
    return $full-path ?? $app-list.app-path-list !! $app-list.app-list;
}

