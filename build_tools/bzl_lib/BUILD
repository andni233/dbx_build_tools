# @generated: This file was generated by bzl. Do not modify!
# Argument overrides and custom targets should be specified in BUILD.in.

package(default_visibility = ["//visibility:public"])

load("//build_tools/py:py.bzl", "dbx_py_library")

dbx_py_library(
    name = "commands",
    srcs = ["commands.py"],
    validate = "strict",
    deps = [
        ":exec_wrapper",
        "//build_tools:bazel_utils",
    ],
)

dbx_py_library(
    name = "gazel_lib",
    srcs = [
        "gazel.py",
        "gen_build_go.py",
        "gen_build_pip.py",
        "gen_build_py.py",
        "gen_commands.py",
    ],
    data = [
        "//build_tools:buildfmt",
        "//go/src/dropbox/build_tools/gen-build-go",
    ],
    python2_compatible = False,
    validate = "allow-unused",
    deps = [
        ":build_merge_lib",
        ":metrics",
        ":parse_py_imports_lib",
        ":run",
        "//build_tools:bazel_utils",
        "//build_tools:build_parser_lib",
        "//build_tools/py:vinst_lib",
        "//dropbox:runfiles",
        "//pip/typing",
    ],
)

dbx_py_library(
    name = "parse_py_imports_lib",
    srcs = [
        "parse_py_imports.py",
    ],
    python2_compatible = False,
    validate = "strict",
    deps = [
        "//build_tools/py:python_encoding",
        "//pip/typed-ast",
        "//pip/typing",
    ],
)

dbx_py_library(
    name = "build_merge_lib",
    srcs = [
        "build_merge.py",
    ],
    data = ["//go/src/dropbox/build_tools/build-merge"],
    validate = "strict",
    deps = [
        "//dropbox:runfiles",
        "//pip/typing",
    ],
)

dbx_py_library(
    name = "exec_wrapper",
    srcs = ["exec_wrapper.py"],
    validate = "strict",
    deps = [
        ":metrics",
        "//pip/typing",
    ],
)

dbx_py_library(
    name = "metrics",
    srcs = ["metrics.py"],
    validate = "strict",
    deps = [
        "//pip/typing",
    ],
)

dbx_py_library(
    name = "run",
    srcs = ["run.py"],
    validate = "strict",
    deps = [
        "//build_tools/go:env",
        "//pip/typing",
    ],
)

dbx_py_library(
    name = "core",
    srcs = ["core.py"],
    python2_compatible = False,
    validate = "strict",
    deps = [
        ":commands",
        ":exec_wrapper",
        ":metrics",
        "//build_tools:bazel_utils",
        "//build_tools/bzl_lib/itest",
        "//pip/typing",
    ],
)
