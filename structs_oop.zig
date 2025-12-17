const std = @import("std");

const User = struct {
    id: u64,
    name: []const u8,
    email: []const u8,

    pub fn init(id: u64, name: []const u8, email: []const u8) User {
        return User{ .id = id, .name = name, .email = email };
    }

    pub fn print_name(self: User) !void {
        var stdout_buffer: [1024]u8 = undefined;
        var stdout_writer = std.fs.File.stdout().writer(&stdout_buffer);
        const stdout = &stdout_writer.interface;
        try stdout.print("{s}\n", .{self.name});
        try stdout.flush();
    }
};

pub fn main() !void {
    const u = User.init(1, "Pedro", "email@gmail.com");
    try u.print_name();
}
