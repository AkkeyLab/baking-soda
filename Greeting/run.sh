#!/bin/bash

as -arch arm64 -o greeting.o greeting.s
ld -o greeting greeting.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./greeting
