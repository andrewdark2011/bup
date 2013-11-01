#!/usr/bin/env bash
. ./wvtest-bup.sh

WVSTART 'all'

top="$(WVPASS pwd)" || exit $?
tmpdir="$(WVPASS wvmktempdir)" || exit $?

export BUP_DIR="$tmpdir/bup"

bup() { "$top/bup" "$@"; }

WVPASS mkdir "$tmpdir/foo"

bup index "$tmpdir/foo" &> /dev/null
index_rc=$?
WVPASSEQ "$index_rc" "15"

WVPASS rm -rf "$tmpdir"
