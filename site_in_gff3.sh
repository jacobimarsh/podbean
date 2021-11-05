#!/bin/bash
SITE=${1?Error: no input site}
GFF3=${2?Error: no input GFF/GFF3}
echo ${1} | xargs -I [] awk '$4<[] && $5>[] {print $0}' ${2}
