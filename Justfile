set positional-arguments

container file='home-org':
    guix home container example/{{file}}.scm -L src --share=$XDG_RUNTIME_DIR -- env WAYLAND_DISPLAY=$WAYLAND_DISPLAY emacs
