const std = @import("std");

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
            2 => { try chapter_02(stdout, &bw, &input_buf); },
            3 => { try chapter_03(stdout, &bw, &input_buf); },
            4 => { try chapter_04(stdout, &bw, &input_buf); },
            5 => { try chapter_05(stdout, &bw, &input_buf); },
            6 => { try chapter_06(stdout, &bw, &input_buf); },
            7 => { try chapter_07(stdout, &bw, &input_buf); },
            8 => { try chapter_08(stdout, &bw, &input_buf); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
    try stdout.print("Thank you for playing!\n", .{});
    try bw.flush(); // don't forget to flush!
}

// TODO: I don't fully get why the std.io.Writer type errors out, so... anytype
fn print_main_menu(out: anytype, bw: anytype) !void {
    try out.print("----------------------------------------\n", .{});
    try out.print("The C Programming Language (In Zig)\n\n", .{});
    try out.print("\t1. A Tutorial Introduction\n", .{});
    try out.print("\t2. Types, Operators and Expressions\n", .{});
    try out.print("\t3. Control Flow\n", .{});
    try out.print("\t4. Functions and Program Structures\n", .{});
    try out.print("\t5. Pointers and Arrays\n", .{});
    try out.print("\t6. Structures\n", .{});
    try out.print("\t7. Input and Output\n", .{});
    try out.print("\t8. The UNIX System Interface\n", .{});
    try out.print("\t0. Exit\n", .{});
    try out.print("----------------------------------------\n\n", .{});

    try out.print("Choose a chapter: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

const chapter_01_exercises = struct {
    pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

fn chapter_01(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_01_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            // TODO: add some visual delimiters around an exercise run to make it easier to see
            1 => { try chapter_01_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_01_menu(out: anytype, bw: anytype) !void {
    try out.print("--------------------------------------\n", .{});
    try out.print("Chapter 1 - A Tutorial Introduction\n\n", .{});
    try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try out.print("--------------------------------------\n\n", .{});

    try out.print("Choose an exercise: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

const chapter_02_exercises = struct {
    //pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

fn chapter_02(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_02_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            //1 => { try chapter_02_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_02_menu(out: anytype, bw: anytype) !void {
    try out.print("------------------------------------------------\n", .{});
    try out.print("Chapter 2 - Types, Operators and Expressions\n\n", .{});
    //try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try out.print("------------------------------------------------\n\n", .{});

    try out.print("Choose an exercise: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

const chapter_03_exercises = struct {
    //pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

fn chapter_03(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_03_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            //1 => { try chapter_03_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_03_menu(out: anytype, bw: anytype) !void {
    try out.print("------------------------------\n", .{});
    try out.print("Chapter 3 - Control Flow\n\n", .{});
    //try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try out.print("------------------------------\n\n", .{});

    try out.print("Choose an exercise: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

const chapter_04_exercises = struct {
    //pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

fn chapter_04(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_04_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            //1 => { try chapter_04_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_04_menu(out: anytype, bw: anytype) !void {
    try out.print("-----------------------------------------------\n", .{});
    try out.print("Chapter 4 - Functions and Program Structures\n\n", .{});
    //try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try out.print("-----------------------------------------------\n\n", .{});

    try out.print("Choose an exercise: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

const chapter_05_exercises = struct {
    //pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

fn chapter_05(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_05_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            //1 => { try chapter_05_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_05_menu(out: anytype, bw: anytype) !void {
    try out.print("-----------------------------------\n", .{});
    try out.print("Chapter 5 - Pointers and Arrays\n\n", .{});
    //try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try out.print("-----------------------------------\n\n", .{});

    try out.print("Choose an exercise: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

const chapter_06_exercises = struct {
    //pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

fn chapter_06(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_06_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            //1 => { try chapter_06_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_06_menu(out: anytype, bw: anytype) !void {
    try out.print("------------------------------\n", .{});
    try out.print("Chapter 6 - Structures\n\n", .{});
    //try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try out.print("------------------------------\n\n", .{});

    try out.print("Choose an exercise: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

const chapter_07_exercises = struct {
    //pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

fn chapter_07(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_07_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            //1 => { try chapter_07_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_07_menu(out: anytype, bw: anytype) !void {
    try out.print("------------------------------\n", .{});
    try out.print("Chapter 7 - Input and Output\n\n", .{});
    //try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try out.print("------------------------------\n\n", .{});

    try out.print("Choose an exercise: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

const chapter_08_exercises = struct {
    //pub const exercise_01 = @import("1. A Tutorial Introduction/1. Hello, World.zig");
};

fn chapter_08(out: anytype, bw: anytype, buf: *[100]u8) !void {
    var choice: i8 = -1;

    while (choice != 0) {
        try print_chapter_08_menu(out, bw);

        const line = (try std.io.getStdIn().reader().readUntilDelimiterOrEof(buf, '\n')) orelse null;
        choice = std.fmt.parseInt(i8, line.?, 10) catch 0;

        switch (choice) {
            //1 => { try chapter_08_exercises.exercise_01.main(); },
            else => {
                choice = 0;
                continue;
            },
        }
    }
}

fn print_chapter_08_menu(out: anytype, bw: anytype) !void {
    try out.print("----------------------------------------\n", .{});
    try out.print("Chapter 8 - The UNIX System Interface\n\n", .{});
    //try out.print("\t1. Hello World\n", .{});
    try out.print("\t0. Choose another chapter\n", .{});
    try out.print("----------------------------------------\n\n", .{});

    try out.print("Choose an exercise: ", .{});
    try bw.*.flush(); // don't forget to flush!
}

// TODO: add some testing around the parse failures being set to 0
// TODO: add some testing around blowing out the buffersize and update the code in 9 places
// TODO: learn more about the language to remove some goofy copy/paste stuff
// TODO: the menus can be more data-driven easily, the switch case matching... not so much, the imports not gonna happen
