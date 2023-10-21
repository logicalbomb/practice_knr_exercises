const std = @import("std");

const chapter_01_exercises = struct {
    pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

pub fn main() !void {
    var bw = std.io.bufferedWriter(std.io.getStdOut().writer());
    const stdout = bw.writer();

    try stdout.print("Trying to run an exercise dynamically!\n", .{});
    try bw.flush(); // don't forget to flush!

    try chapter_01_exercises.exercise_01.main();

    try stdout.print("Dynamic run complete!\n", .{});
    try bw.flush(); // don't forget to flush!
}
