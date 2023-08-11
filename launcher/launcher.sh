FLAGS='--enable-gpu-rasterization --enable-zero-copy --enable-gpu-compositing --enable-native-gpu-memory-buffers --enable-oop-rasterization --enable-features=UseSkiaRenderer --use-tray-icon'

if [[ ! -n "$DISABLE_WAYLAND" && -n "$WAYLAND_DISPLAY" ]]; then
  FLAGS="$FLAGS --enable-features=WaylandWindowDecorations,WebRTCPipeWireCapturer --ozone-platform-hint=auto"
    if [ -c /dev/nvidia0 ]; then
      FLAGS="$FLAGS --disable-gpu-sandbox"
    fi
fi


exec "$SNAP/usr/bin/webcord" $FLAGS "$@"