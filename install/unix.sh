#!/bin/sh
#cd "$(readlink -m "$0/../../")" # chdir to the root directory of the package archive
cd $(dirname $0)
cd ..

TEXMFLOCAL="$(kpsewhich -var-value TEXMFLOCAL)"
PACKAGE="$TEXMFLOCAL/tex/latex/beamerx/"
FONTS="$TEXMFLOCAL/fonts/truetype/"
PERMS="Dg+s,ug+w,o-w,+X,+r"
mkdir -p "$PACKAGE" "$FONTS"
printf "%s> Installing source files...%s\n" "$(tput setaf 2)" "$(tput sgr0)"
rsync --recursive --exclude-from=install/.exclude --delete-excluded --chmod=$PERMS source/ $PACKAGE/
printf "%s> Installing font files...%s\n" "$(tput setaf 2)" "$(tput sgr0)"
rsync --recursive --update --chmod=$PERMS fonts/ $FONTS/
printf "%s> Updating database...%s\n" "$(tput setaf 2)" "$(tput sgr0)"
{ texhash || mktexlsr; } >/dev/null
printf "%sDONE !%s\n" "$(tput setaf 2)" "$(tput sgr0)"
