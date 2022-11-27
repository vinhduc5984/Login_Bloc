import 'dart:convert';

class AccountModel {
  final String accessToken;
  final String refreshToken;
  final String username;
  final String userId;
  final String partnerId;
  AccountModel({
    required this.accessToken,
    required this.refreshToken,
    required this.username,
    required this.userId,
    required this.partnerId,
  });

  AccountModel copyWith({
    String? accessToken,
    String? refreshToken,
    String? username,
    String? userId,
    String? partnerId,
  }) {
    return AccountModel(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      username: username ?? this.username,
      userId: userId ?? this.userId,
      partnerId: partnerId ?? this.partnerId,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'accessToken': accessToken,
      'refreshToken': refreshToken,
      'username': username,
      'userId': userId,
      'partnerId': partnerId,
    };
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      accessToken: map['accessToken'] ?? '',
      refreshToken: map['refreshToken'] ?? '',
      username: map['username'] ?? '',
      userId: map['userId'] ?? '',
      partnerId: map['partnerId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AccountModel(accessToken: $accessToken, refreshToken: $refreshToken, username: $username, userId: $userId, partnerId: $partnerId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountModel &&
        other.accessToken == accessToken &&
        other.refreshToken == refreshToken &&
        other.username == username &&
        other.userId == userId &&
        other.partnerId == partnerId;
  }

  @override
  int get hashCode {
    return accessToken.hashCode ^
        refreshToken.hashCode ^
        username.hashCode ^
        userId.hashCode ^
        partnerId.hashCode;
  }
}
