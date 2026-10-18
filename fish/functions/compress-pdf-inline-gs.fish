function compress-pdf-inline-gs
    set input $argv[1]
    set temp (mktemp --suffix=.pdf)
    
    gs -sDEVICE=pdfwrite \
       -dCompatibilityLevel=1.4 \
       -dDownsampleColorImages=true \
       -dColorImageResolution=180 \
       -dDownsampleGrayImages=true \
       -dGrayImageResolution=180 \
       -dDownsampleMonoImages=true \
       -dMonoImageResolution=300 \
       -dColorImageDownsampleType=/Bicubic \
       -dGrayImageDownsampleType=/Bicubic \
       -dMonoImageDownsampleType=/Bicubic \
       -dJPEGQ=88 \
       -dNOPAUSE -dQUIET -dBATCH \
       -sOutputFile=$temp $input
       
    mv $temp $input
    echo "Compressed in place: $input"
end
