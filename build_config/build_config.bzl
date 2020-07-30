_url_copts = select({
    "@com_google_googleurl//build_config:windows_x86_64": [
        "/std:c++17",
    ],
    "//conditions:default": [
        "-std=c++17",
        "-fno-strict-aliasing",
    ],
})

build_config = struct(
    _url_copts = _url_copts,
)
