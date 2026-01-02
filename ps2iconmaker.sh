#!/usr/bin/env bash

# v3.0.0
clear
echo "=============== HDD-OSD Icon Generator ===============
"

menu="
Type of icon to generate:
1 - PS2 DVD NTSC case
2 - PS2 DVD PAL case
3 - PS1 CD USA case
4 - PS1 CD USA Greatest Hits case
5 - PS1 JPN case
6 - PS1 PAL case
7 - PS1 multi-disc case
8 - PS1 virtual memory card
"

template_path="./Icon-templates"
image_path="./image"

read -rp "Enter game ID: " input
echo "$menu"
read -rp "Enter icon type (1-8) [default 1]: " type
# Default to 1 if empty
type=${type:-1}

case $type in
  1)
    icon="${template_path}/ps2dvdicon.icn"
    template="${template_path}/PS2-NTSC.bmp"
    ;;
  2)
    icon="${template_path}/ps2dvdicon.icn"
    template="${template_path}/PS2-PAL.bmp"
    ;;
  3)
    icon="${template_path}/ps1cdusicon.icn"
    template="${template_path}/PS1-USA.bmp"
    ;;
  4)
    icon="${template_path}/ps1cdusicon.icn"
    template="${template_path}/PS1-USA-GH.bmp"
    ;;
  5)
    icon="${template_path}/ps1cdpaljpicon.icn"
    template="${template_path}/PS1-JPN.bmp"
    ;;
  6)
    icon="${template_path}/ps1cdpaljpicon.icn"
    template="${template_path}/PS1-PAL.bmp"
    ;;
  7)
    icon="${template_path}/ps1multidiscicon.icn"
    template="${template_path}/PS1-MULTI.bmp"
    ;;
  8)
    icon="${template_path}/VMC.icn"
    template="${template_path}/VMC.png"
    ;;
  *)
    type="1"
    icon="${template_path}/ps2dvdicon.icn"
    template="${template_path}/PS2-NTSC.bmp"
    ;;
esac

if ! command -v convert > /dev/null 2>&1 ; then
  echo "ImageMagick convert not found."
  exit 1
fi

echo
echo "Generating icon..."
if [ "$type" -eq 1 ] || [ "$type" -eq 2 ]; then
  convert $template \
    \( "${image_path}/${input}_COV."* -resize 63x90\! \) -geometry +0+2 -composite \
    \( "${image_path}/${input}_COV2."* -resize 63x90\! \) -geometry +65+2 -composite \
    \( "${image_path}/${input}_LAB."* -resize 7x90 -rotate 90 \) -geometry +20+98 -composite \
    "${image_path}/temp.bmp" > /dev/null 2>&1
elif [ "$type" -eq 3 ] || [ "$type" -eq 4 ]; then
  convert $template \
    \( "${image_path}/${input}_COV."* -resize 62x62\! \) -geometry +8+1 -composite \
    \( "${image_path}/${input}_COV2."* -resize 69x63\! \) -geometry +1+64 -composite \
    \( "${image_path}/${input}_LAB."* -resize 4x63\! \) -geometry +93+58 -composite \
    "${image_path}/temp.bmp" > /dev/null 2>&1
elif [ "$type" -eq 5 ] || [ "$type" -eq 6 ]; then
  convert $template \
    \( "${image_path}/${input}_COV."* -resize 62x62\! \) -geometry +8+1 -composite \
    \( "${image_path}/${input}_COV2."* -resize 69x63\! \) -geometry +1+64 -composite \
    \( "${image_path}/${input}_LAB."* -resize 6x63\! \) -geometry +93+58 -composite \
    "${image_path}/temp.bmp" > /dev/null 2>&1
elif [ "$type" -eq 7 ]; then
  convert $template \
    \( "${image_path}/${input}_COV."* -resize 69x62\! \) -geometry +1+1 -composite \
    \( "${image_path}/${input}_COV2."* -resize 69x62\! \) -geometry +1+64 -composite \
    \( "${image_path}/${input}_LAB."* -resize 4x62\! \) -geometry +71+1 -composite \
    \( "${image_path}/${input}_LAB."* -resize 4x62\! \) -geometry +78+1 -composite \
    \( "${image_path}/${input}_LAB."* -resize 4x62\! \) -geometry +71+64 -composite \
    \( "${image_path}/${input}_LAB."* -resize 4x62\! \) -geometry +79+64 -composite \
    "${image_path}/temp.bmp" > /dev/null 2>&1
elif [ "$type" -eq 8 ]; then
    convert $template \
    \( "${image_path}/${input}_LGO."* -resize 300x125\! \) -geometry +169+283 -composite \
    "${image_path}/temp.png" > /dev/null 2>&1
    convert "${image_path}/temp.png" -resize 128x128 -rotate 180 "${image_path}/temp.bmp" > /dev/null 2>&1
fi

convert "${image_path}/temp.bmp" \
  -flip \
  -separate +channel \
  -swap 0,2 \
  -combine \
  -alpha off \
  -define bmp:format=bmp4 \
  -define bmp:subtype=RGB555 \
  "${image_path}/temp.bmp" > /dev/null 2>&1

dd bs=1 if="${image_path}/temp.bmp" of="${image_path}/temp.tex" skip=138 count=32768 iflag=skip_bytes,count_bytes > /dev/null 2>&1 &&

if [ "$type" -eq 8 ]; then
  cat "$icon" "${image_path}/temp.tex" > "./icon/vmc/$input.ico"
else
  cat "$icon" "${image_path}/temp.tex" > "./icon/game/$input.ico"
fi

if [ -s "./icon/game/$input.ico" ] || [ -s "./icon/vmc/$input.ico" ]; then
  rm "${image_path}/temp.bmp" "${image_path}/temp.png" "${image_path}/temp.tex" > /dev/null 2>&1 &&
  echo
  echo "Icon created sucessfully!"
  exit 0
else
  echo
  echo "Error: failed to create icon for $input."
  exit 1
fi