#!/bin/sh

# Creates single page PDFs and converts them to simple markdown (text) for reverential usage in Knowledgespace

pdfseparate ./input/20240801-strommarktdesign-der-zukunft.pdf ./pages/page%d.pdf

for pdf_file in ./pages/page*.pdf; do
   txt_file="${pdf_file%.pdf}.txt"
   md_file="${pdf_file%.pdf}.md"
    pdftotext "$pdf_file" "$txt_file"
    echo "![$pdf_file](../assets/$pdf_file)\n\r\n\r" > "$md_file"
    sed '1!G;h;$!d' "$txt_file" >> "$md_file"
    rm "$txt_file"
    mv "$pdf_file" "./assets/pages/"
done


