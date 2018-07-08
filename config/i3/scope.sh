# Image previews, if enabled in ranger.
if [ "$preview_images" = "True" ]; then
    case "$mimetype" in
        application/pdf)
             pdftoppm -jpeg -singlefile "$path" "${cached//.jpg}" && exit 6;;
    esac
  fi
