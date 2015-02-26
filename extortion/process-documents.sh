#!/bin/bash

SRC_DIR="../documents"

unprocessed_file() {
    echo './txt-unprocessed/'`basename -s .pdf "$1"`'.txt'
}

utf8_file() {
    echo './txt-utf8/'`basename -s .pdf "$1"`'.utf8.txt'
}

# Resist looping. Files need individual treatment.

file="$SRC_DIR/2002-12-17 Bhikkhu Manual Essential Chants.pdf"
echo "$file"
pdftotext -nopgbrk -f 7 -r 72 -x 179 -y 255 -W 234 -H 342 "$file" - |\
    tee "$(unprocessed_file "$file")" |\
    sed -f './sed/sed-utf8-bhikkhu-manual' > "$(utf8_file "$file")"

file="$SRC_DIR/2007-05-31 ABM Chanting Book Proof6.pdf"
echo "$file"
pdftotext -nopgbrk -f 8 -r 72 -x 38 -y 21 -W 434 -H 545 "$file" - > "$(unprocessed_file "$file")"

file="$SRC_DIR/2010-11-16 ABM Chanting Book rev2010.pdf"
echo "$file"
pdftotext -nopgbrk -f 8 -r 72 -x 64 -y 46 -W 457 -H 695 "$file" - > "$(unprocessed_file "$file")"

file="$SRC_DIR/2012-04-15 Amaravati Three Suttas Chanting b.pdf"
echo "$file"
pdftotext -nopgbrk -f 2 -r 72 -x 8 -y 38 -W 829 -H 524 "$file" - |\
    tee "$(unprocessed_file "$file")" |\
    sed -f './sed/sed-utf8-bhikkhu-manual' > "$(utf8_file "$file")"

file="$SRC_DIR/2013-02-18 Dhammayut Chanting Guide With Index.pdf"
echo "$file"
pdftotext -nopgbrk -f 10 -r 72 -x 56 -y 75 -W 508 -H 700 "$file" - > "$(unprocessed_file "$file")"

file="$SRC_DIR/2013-07-23 Dhammayut Chanting Guide.pdf"
echo "$file"
pdftotext -nopgbrk -f 9 -r 72 -x 56 -y 75 -W 508 -H 700 "$file" - > "$(unprocessed_file "$file")"

file="$SRC_DIR/2013-08-19 WPN New Chants.pdf"
echo "$file"
pdftotext -nopgbrk -f 8 -r 72 -x 5 -y 30 -W 406 -H 536 "$file" - > "$(unprocessed_file "$file")"

file="$SRC_DIR/2014-10-04 WPN Buddhist Chanting Pali English with cover.pdf"
echo "$file"
pdftotext -nopgbrk -f 9 -r 72 -x 5 -y 30 -W 406 -H 536 "$file" - > "$(unprocessed_file "$file")"

file="$SRC_DIR/2015-02-26 Community Chanting Book Vol1 EN.pdf"
echo "$file"
pdftotext -nopgbrk -f 8 -r 72 -x 11 -y 54 -W 488 -H 631 "$file" - |\
    tee "$(unprocessed_file "$file")" |\
    sed -f 'sed/sed-no-cantillation-community' > "$(utf8_file "$file")"

file="$SRC_DIR/2014-05-30 Community Chanting Book Vol1 Text Draft.pdf"
echo "$file"
pdftotext -nopgbrk -f 8 -r 72 -x 5 -y 5 -W 485 -H 600 "$file" - > "$(unprocessed_file "$file")"

file="$SRC_DIR/2014-05-30 Community Chanting Book Vol1 Text Draft DOCX.docx"
echo "$file"
unprocessed_file='./txt-unprocessed/2014-05-30 Community Chanting Book Vol1 Text Draft DOCX.txt'
echo 'DEDICATION OF OFFERINGS' > "$unprocessed_file"
pandoc -f docx -t plain "$file" | sed '0,/^DEDICATION OF OFFERINGS/d' >> "$unprocessed_file"

