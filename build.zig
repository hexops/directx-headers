const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const lib = b.addStaticLibrary(.{
        .name = "directx-headers",
        .root_source_file = b.addWriteFiles().add("empty.c", ""),
        .target = target,
        .optimize = optimize,
    });

    inline for (.{ "directx", "dxguids", "wsl" }) |subdir| {
        lib.installHeadersDirectory(b.path("include/" ++ subdir), subdir, .{});
    }
    b.installArtifact(lib);

    // TODO: consider exposing dxguids?
    // Rewrite that portion in Zig to avoid C++ compiler?
}
