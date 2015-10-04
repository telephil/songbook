#!/usr/bin/env sh

TABDIR="~/Guitar/Tablatures/Text/"

sbcl --noinform --load daemon.lisp "$TABDIR"
