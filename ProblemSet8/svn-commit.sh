#!/bin/bash
echo "==="
echo "Note : if svn hung up, type ctrl-z and kill -9 %"
echo "Note : please do not contain space in your commit message, if so, please ctrl-c"
echo "svn info | grep URL"
svn info | grep URL
echo "Note : important : please make sure the repo URL is as intended(not the original template URL)"
echo "if ok, press anykey..."
echo "==="
read rub

if [[ $# -ne 1 ]]; then
	echo please svn update before you do editing
	echo "Usage : $0 commit-message(don't contain space in the message)"
	exit
fi

message=$1
svn cleanup
echo "rm *-blx.bib"
rm *-blx.bib
echo "svn add possible new files"
svn add README
svn add *.sh
svn add --non-recursive figures
rm figures/.*
svn add figures/*
svn add *.tex
svn add *.bib

echo "svn commit to server"
svn commit -m \"$message\"
