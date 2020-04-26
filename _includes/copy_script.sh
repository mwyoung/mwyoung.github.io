#!/bin/bash
#backup t-time r-recursive h-human readable l-links (no-links for no soft links) v-verbose
#--modify-window reduce accuracy --progress shows file transfer n=dry run
from="$HOME/path/from"
to="/path/to"
backup="rsync -avh --exclude-from=copy_exclude"

#backup
eval $backup "--recursive  --include-from=copy_include" $from $to
