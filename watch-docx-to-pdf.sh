#!/bin/zsh

DOCX_FILE="Saif_Abdelkefi_Resume.docx"
PDF_FILE="Saif_Abdelkefi_Resume.pdf"

fswatch -o "$DOCX_FILE" | while read; do
  echo "---- Detected change in $DOCX_FILE. Converting to PDF..."
  /Applications/LibreOffice.app/Contents/MacOS/soffice --headless --convert-to pdf "$DOCX_FILE" --outdir .
  echo "Updated $PDF_FILE"
  echo "---- pushing change"
  git add . && git commit -m "CV change" && git push && echo "new CV live"
done