const std = @import("std");

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    var sum_list = std.ArrayList(usize).init(gpa.allocator());
    defer sum_list.deinit();
    const in_file = try std.fs.cwd().openFile("d1", .{});
    defer in_file.close();
    var sum: usize = 0;
    var in = in_file.reader();
    var buf: [32]u8 = undefined;
    while (try in.readUntilDelimiterOrEof(&buf, '\n')) |line| {
        if (line.len == 0) {
            try sum_list.append(sum);
            sum = 0;
        }
        else {
            sum += try std.fmt.parseUnsigned(usize, line, 10);
        }
    }
    try sum_list.append(sum);
    std.sort.sort(usize, sum_list.items, {}, (struct {
        fn f(_: void, a: usize, b: usize) bool {
            return a > b;
        }
    }).f);
    std.log.info("part1: {d}", .{sum_list.items[0]});
    std.log.info("part2: {d}", .{sum_list.items[0] + sum_list.items[1] + sum_list.items[2]});
}