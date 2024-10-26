#!/bin/bash

as -arch arm64 -o printing.o printing.s
ld -o printing printing.o -lSystem -syslibroot `xcrun -sdk macosx --show-sdk-path` -e _start -arch arm64
./printing
