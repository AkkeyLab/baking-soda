#!/bin/bash

as -arch arm64 -o calculate.o calculate.s
ld -o calculate calculate.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./calculate
