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

_string_srcs = select({
    "//build_config:windows_x86_64": [],
    "//conditions:default": ["string16.cc"],
})

_string_hdrs = select({
    "//build_config:windows_x86_64": ["string_util_win.h"],
    "//conditions:default": ["string_util_posix.h"],
})

_url_linkopts = select({
    "//build_config:with_system_icu": ["-licuuc"],
    "//conditions:default": [],
})

_icuuc_deps = select({
    "//build_config:with_system_icu": [],

    # If we don't link against system ICU library, we must provide "@org_unicode_icuuc//:common".
    "//conditions:default": ["@org_unicode_icuuc//:common"],
})

build_config = struct(
    default_copts = _default_copts,
    url_linkopts = _url_linkopts,
    string_srcs = _string_srcs,
    string_hdrs = _string_hdrs,
    icuuc_deps = _icuuc_deps,
)
