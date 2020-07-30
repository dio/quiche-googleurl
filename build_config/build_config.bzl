"""This module provides ..."""

_default_copts = select({
    "//build_config:windows_x86_64": [
        "/std:c++17",
    ],
    "//conditions:default": [
        "-std=c++17",
        "-fno-strict-aliasing",
    ],
})

build_config = struct(
    default_copts = _default_copts,
)
