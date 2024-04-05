#!/bin/sh

numcpus=23
jobs=$(( ${numcpus} - 1 ))

swift \
    test \
    --quiet \
    --parallel \
    --enable-code-coverage \
    --jobs ${jobs} \
    || echo NG

llvm-cov \
    export \
    -format=lcov \
    ./.build/debug/sw-averagePackageTests.xctest \
    -instr-profile ./.build/debug/codecov/default.profdata |
    cat > ./cov.lcov

llvm-cov \
    report \
    --ignore-filename-regex=.build \
    --summary-only \
    ./.build/debug/sw-averagePackageTests.xctest \
    -instr-profile ./.build/debug/codecov/default.profdata
