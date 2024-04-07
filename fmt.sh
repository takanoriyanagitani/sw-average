#!/bin/sh

find \
	./Sources \
	./Benchmarks \
	./Examples \
	./Tests \
	./Package.swift \
	-type f \
	-name '*.swift' |
	sed \
		-n \
		-e '/\.build/d' \
		-e /./p |
	xargs \
		swift-format \
		format \
		--in-place \
		--ignore-unparsable-files \
		--parallel \
		--color-diagnostics
