#!/usr/bin/env bats


@test "post_push hook is up-to-date" {
  run sh -c "cat Makefile | grep 'TAGS ?= ' | cut -d ' ' -f 3"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  expected="$output"

  run sh -c "cat hooks/post_push | grep 'for tag in' \
                                 | cut -d '{' -f 2 \
                                 | cut -d '}' -f 1"
  [ "$status" -eq 0 ]
  [ ! "$output" = '' ]
  actual="$output"

  [ "$actual" = "$expected" ]
}


@test "mxmlc is installed" {
  run docker run --rm $IMAGE which mxmlc
  [ "$status" -eq 0 ]
}

@test "xvfb-ru is installed" {
  run docker run --rm $IMAGE which xvfb-run
  [ "$status" -eq 0 ]
}

@test "xvfb wrapper is created" {
  run docker run --rm $IMAGE which xvfb
  [ "$status" -eq 0 ]
}

@test "flashplayerdebugger is installed" {
  run docker run --rm $IMAGE which flashplayerdebugger
  [ "$status" -eq 0 ]
}

@test "gradle is installed" {
  run docker run --rm $IMAGE which gradle
  [ "$status" -eq 0 ]
}

@test "ant is installed" {
  run docker run --rm $IMAGE which ant
  [ "$status" -eq 0 ]
}

@test "mxmlc runs ok" {
  run docker run --rm $IMAGE mxmlc -version
  [ "$status" -eq 0 ]
}

@test "xvfb-run runs ok" {
  run docker run --rm $IMAGE xvfb-run -h
  [ "$status" -eq 0 ]
}

@test "gradle runs ok" {
  run docker run --rm $IMAGE gradle -h
  [ "$status" -eq 0 ]
}


@test "ant runs ok" {
  run docker run --rm $IMAGE ant -h
  [ "$status" -eq 0 ]
}

@test "flashplayerdebugger runs ok" {
  run docker run --rm -v $(pwd)/test/app:/app $IMAGE xvfb gradle buildFx
  [ "$status" -eq 0 ]
}
