#!/bin/sh
TEXMFLOCAL="$(kpsewhich -var-value TEXMFLOCAL)"
PACKAGE="$TEXMFLOCAL/tex/latex/beamerx/"
FONTS="$TEXMFLOCAL/fonts/truetype/"
mkdir -p "$PACKAGE" "$FONTS"
rsync --recursive --exclude-from=install/.exclude --delete-excluded --chmod=444 source/ $PACKAGE/
rsync --recursive --update --chmod=444 fonts/ $FONTS/
texhash || mktexlsr
