function compress-pdf-gs
    if test (count $argv) -lt 2
        echo "Usage: compress-pdf input.pdf output.pdf"
        return 1
    end

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
       -sOutputFile=$argv[2] $argv[1]
end
