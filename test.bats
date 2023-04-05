#!/usr/bin/env bats

@test "Jotai" {
	 diff <(cat test/t1-s.txt|dist/cli.js -j) <(cat test/t2-s.txt)
}

@test "Keitai" {
	 diff <(cat test/t2-s.txt|dist/cli.js -k) <(cat test/t2-r.txt)
}

@test "Jotai-n" {
	 diff <(cat test/t1-s.txt|dist/cli.js -n) <(cat test/t3-r.txt)
}

@test "Jotai-N" {
	 diff <(cat test/t1-s.txt|dist/cli.js -N) <(cat test/t4-r.txt)
}

