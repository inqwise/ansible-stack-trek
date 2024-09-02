#!/bin/bash
/data/kafka/bin/zookeeper-shell.sh localhost:2181 ls /brokers/ids 2> /dev/null | grep -o -P "\[(.*)\]" | jq '. | length' 2>/dev/null