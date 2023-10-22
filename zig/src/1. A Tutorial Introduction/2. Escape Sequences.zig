const std = @import("std");

pub fn main() !void {
    //std.debug.print("\a");
    //std.debug.print("\b");
    //std.debug.print("\c");
    //std.debug.print("\d");
    //std.debug.print("\e");
    //std.debug.print("\f");
    //std.debug.print("\g");
    //std.debug.print("\h");
    //std.debug.print("\i");
    //std.debug.print("\j");
    //std.debug.print("\k");
    //std.debug.print("\l");
    //std.debug.print("\m");
    std.debug.print("Printing \\n: \n\n", .{});
    //std.debug.print("\o");
    //std.debug.print("\p");
    //std.debug.print("\q");
    std.debug.print("Printing \\r: \r\n", .{});
    //std.debug.print("\s");
    std.debug.print("Printing \\t: \t\n", .{});
    std.debug.print("Printing \\u: \u{508}\n", .{});
    //std.debug.print("\v");
    //std.debug.print("\w");
    std.debug.print("Printing \\x: \x6F\n", .{});
    //std.debug.print("\y");
    //std.debug.print("\z");
}
