#!/usr/bin/env bash

SCRIPT_DIR="$(cd `dirname $0`; pwd)"
DEST_BASE="$(cd $SCRIPT_DIR; cd ../../; pwd)/tmp"

## OTel specification

SRC=content-modules/opentelemetry-specification/specification
DEST=$DEST_BASE/otel/specification

rm -Rf $DEST
mkdir -p $DEST
cp -R $SRC/* $DEST/

find $DEST/ -name "README.md" -exec sh -c 'f="{}"; mv -- "$f" "${f%README.md}_index.md"' \;

# To exclude a file use, e.g.: -not -path '*/specification/_index.md'
FILES=$(find $DEST -name "*.md")

$SCRIPT_DIR/adjust-pages.pl $FILES

echo "OTEL SPEC pages copied and processed."

## OTLP specification

SRC=content-modules/opentelemetry-proto/specification
DEST=$DEST_BASE/otlp/specification

rm -Rf $DEST
mkdir -p $DEST
cp -R $SRC/* $DEST/

find $DEST/ -name "README.md" -exec sh -c 'f="{}"; mv -- "$f" "${f%README.md}_index.md"' \;

# To exclude a file use, e.g.: -not -path '*/specification/_index.md'
FILES=$(find $DEST -name "*.md")

$SCRIPT_DIR/adjust-pages.pl $FILES

echo "OTLP SPEC pages copied and processed."

# SRC=content-modules/opentelemetry-proto/opentelemetry
# DEST=$DEST_BASE/otlp/opentelemetry

# rm -Rf $DEST
# mkdir -p $DEST
# cp -R $SRC/* $DEST/

# echo "OTLP SPEC protos copied and processed."

## Community

SRC=content-modules/community
DEST=$DEST_BASE/community

rm -Rf $DEST
mkdir -p $DEST
cp -R $SRC/* $DEST/

find $DEST/ -name "README.md" -exec sh -c 'f="{}"; mv -- "$f" "${f%README.md}_index.md"' \;

# To exclude a file use, e.g.: -not -path '*/community/_index.md'
FILES=$(find $DEST -name mission-vision-values.md -o -name roadmap.md)

$SCRIPT_DIR/adjust-pages.pl $FILES

echo "COMMUNITY pages copied and processed."
