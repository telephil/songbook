# songbook

Explorer for guitar tabs in text format

# Overview

A web UI that displays all tabs in a given directory

# Usage

To start the web application use:
```lisp
(ql:quickload :songbook)
(songbook:browse #p"path/to/tabs")
```

The default port is 40000

It also possible to start the webapp as a service using the provided `run.sh` script.
You need to change the `TABDIR` variable in this script to suit your needs.

# License

Copyright (c) 2015 Philippe Mechai

Licensed under the MIT License.
