#!/bin/sh

numcpus=23
jobs=$((${numcpus} - 1))

covLinux() {
	swift \
		test \
		--quiet \
		--parallel \
		--enable-code-coverage \
		--jobs ${jobs} ||
		exec sh -c 'echo TEST FAILURE; exit 1'

	llvm-cov \
		export \
		-format=lcov \
		./.build/debug/sw-averagePackageTests.xctest \
		-instr-profile ./.build/debug/codecov/default.profdata |
		cat >./cov.lcov

	llvm-cov \
		report \
		--ignore-filename-regex=.build \
		--summary-only \
		./.build/debug/sw-averagePackageTests.xctest \
		-instr-profile ./.build/debug/codecov/default.profdata

	exit $?
}

covDarwin() {
	swift \
		test \
		--quiet \
		--parallel \
		--enable-code-coverage \
		--jobs ${jobs} ||
		exec sh -c 'echo TEST FAILURE; exit 1'

	xcrun llvm-cov \
		export \
		-format=lcov \
		./.build/debug/sw-averagePackageTests.xctest/Contents/MacOS/sw-averagePackageTests \
		-instr-profile ./.build/debug/codecov/default.profdata |
		cat >./cov.lcov

	xcrun llvm-cov \
		report \
		--ignore-filename-regex=.build \
		--summary-only \
		./.build/debug/sw-averagePackageTests.xctest/Contents/MacOS/sw-averagePackageTests \
		-instr-profile ./.build/debug/codecov/default.profdata

	exit $?
}

case $(uname -o) in
Darwin)
	covDarwin
	;;
GNU/Linux)
	covLinux
	;;
*)
	echo unknown os: $(uname -o)
	;;
esac
