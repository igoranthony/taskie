class UserSummary {
  final int id;
  final String username;
  final String displayName;

  const UserSummary({
    required this.id,
    required this.username,
    required this.displayName,
  });

  factory UserSummary.fromJson(Map<String, dynamic> json) {
    final firstName = json['first_name'] as String? ?? '';
    final lastName = json['last_name'] as String? ?? '';
    final fullName = '$firstName $lastName'.trim();

    return UserSummary(
      id: json['id'] as int,
      username: json['username'] as String,
      displayName: fullName.isNotEmpty ? fullName : json['username'] as String,
    );
  }

  @override
  String toString() => displayName;
}
