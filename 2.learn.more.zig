const std = @import("std");


pub fn main() !void {
    var stdout_buffer: [1024]u8 = undefined;
    var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
    const stdout = &stdout_writer.interface;

    const Role = enum { SE, DPE, DE, DA, PM, PO, KS };

    var area: []const u8 = undefined;
    const role = Role.SE;

    switch (role) {
        .PM, .SE, .DPE, .PO => {
            area = "Platform";
        },
        .DE, .DA => { area = "Data & Analytics"; },
        .KS => {
        	area = "Sales";
        }
    }

    try stdout.print("{s}\n", .{area});
    try stdout.flush();
}
