const std = @import("std");

const chapter_01_exercises = struct {
    pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

pub fn main() !void {
    var bw = std.io.bufferedWriter(std.io.getStdOut().writer());
    const stdout = bw.writer();

    var choice: i8 = -1;
    var input_buf: [100]u8 = undefined;

    while (choice != 0) {
        try print_main_menu(stdout, &bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(&input_buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            1 => { try chapter_01(stdout, &bw, &input_buf); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
    try stdout.print("Thank you for playing!\n", .{});
    try bw.flush(); // don't forget to flush!
}

// TODO: I don't fully get why the st.io.Writer type errors out, so... anytype
fn print_main_menu(out: anytype, bw: anytype) !void {
    try out.print("Choose a chapter:\n", .{});
    try out.print("\t1. A Tutorial Introduction\n", .{});
    try out.print("\t0. Exit\n", .{});
    try bw.*.flush(); // don't forget to flush!
}

fn chapter_01(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_01_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            1 => { try chapter_01_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_01_menu(out: anytype, bw: anytype) !void {
    try out.print("Choose an exercise:\n", .{});
    try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try bw.*.flush(); // don't forget to flush!
}
