const std = @import("std");

pub fn main() !void {
    const limit: f16 = 300.0;
    const step: f16 = 20.0;
    var cels:f16 = 0.0;
    
    std.debug.print("Celsius\t\tFahrenheit\n", .{});
    while (cels <= limit) {
        std.debug.print("{d:.2}\t\t{d:.2}\n", .{ cels, (cels * 9.0 / 5.0 + 32.0) });
        cels += step;
    }
}
