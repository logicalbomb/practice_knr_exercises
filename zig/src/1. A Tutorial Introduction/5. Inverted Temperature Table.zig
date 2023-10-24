const std = @import("std");

pub fn main() !void {
    const limit: f16 = 0.0;
    const step: f16 = 20.0;
    var fahr:f16 = 300.0;
    
    std.debug.print("Fahrenheit\tCelsius\n", .{});
    while (fahr >= limit) {
        std.debug.print("{d:.2}\t\t{d:.2}\n", .{ fahr, ((5.0/9.0) * (fahr-32.0)) });
        fahr -= step;
    }
}
