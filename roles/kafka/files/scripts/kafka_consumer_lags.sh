#!/bin/bash

/data/kafka/bin/./kafka-consumer-groups.sh --bootstrap-server localhost:9092 --describe --all-groups | awk '/^\s*$/ {next;} !/GROUP/ {arr[$1]+=$6} END {for (key in arr) printf("%s,%s\n", key, arr[key])}'