#!/bin/sh

. ../../dttools/src/test_runner.common.sh

out_dir="linker_dirs_out"

prepare() {
    if [ -d "$out_dir" ]; then
        exit 1
    fi
    cd ../src/; make
    exit 0
}

run() {
    cd linker
    ../../src/makeflow -b "$out_dir" directories.mf &> tmp
	`diff tmp expected/directories.mf`
    exit $?
}

clean() {
    cd linker
    rm -r "$out_dir"
	rm tmp
    exit 0
}

dispatch $@
