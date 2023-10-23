const std = @import("std");

pub fn main() !void {
    const fahr_vals = [16]f16{ 0, 20, 40, 60, 80, 100, 120, 140, 160, 180, 200, 220, 240, 260, 280, 300 };
    
    std.debug.print("Fahrenheit\tCelsius\n", .{});
    for (fahr_vals) |fahr| {
        std.debug.print("{d:.2}\t\t{d:.2}\n", .{ fahr, ((5.0/9.0) * (fahr-32.0)) });
    }
}
