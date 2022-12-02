const std = @import("std");

const in = @embedFile("d2");

pub fn main() !void {
    p1();
    p2();
}

fn p1() void {
    var iter = std.mem.split(u8, in, "\n");
    var total: u32 = 0;
    while (iter.next()) |line| {
        switch (line[0]) {
            'A' => switch (line[2]) {
                'X' => total += 1 + 3,
                'Y' => total += 2 + 6,
                'Z' => total += 3 + 0,
                else => unreachable,
            },
            'B' => switch (line[2]) {
                'X' => total += 1 + 0,
                'Y' => total += 2 + 3,
                'Z' => total += 3 + 6,
                else => unreachable,
            },
            'C' => switch (line[2]) {
                'X' => total += 1 + 6,
                'Y' => total += 2 + 0,
                'Z' => total += 3 + 3,
                else => unreachable,
            },
            else => unreachable,
        }
    }
    std.log.info("part1: {d}", .{total});
}

fn p2() void {
    var iter = std.mem.split(u8, in, "\n");
    var total: u32 = 0;
    while (iter.next()) |line| {
        switch (line[0]) {
            'A' => switch (line[2]) {
                'X' => total += 0 + 3,
                'Y' => total += 3 + 1,
                'Z' => total += 6 + 2,
                else => unreachable,
            },
            'B' => switch (line[2]) {
                'X' => total += 0 + 1,
                'Y' => total += 3 + 2,
                'Z' => total += 6 + 3,
                else => unreachable,
            },
            'C' => switch (line[2]) {
                'X' => total += 0 + 2,
                'Y' => total += 3 + 3,
                'Z' => total += 6 + 1,
                else => unreachable,
            },
            else => unreachable,
        }
    }
    std.log.info("part2: {d}", .{total});
}