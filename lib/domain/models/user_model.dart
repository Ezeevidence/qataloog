// class UserModel {
//   final int id;
//   final String uuid;
//   final String name;
//   final String email;
//   final String occupation;
//   final int occupationId;
//   final String profilePic;
//   final DateTime createdAt;
//   final String language;
//   final String platform;
//   final int subscriptionStatus;
//   final bool hasUsedTrial;
//   final int onTrial;
//   final int hasCardDetail;
//   final String? country;
//   final String? phoneNumber;
//   final String? gender;
//   final bool isDisabled;
//   final String? disabilityDescription;
//   final String? role;
//   final List<String> roles;
//   final List<String?> interests;
//
//   UserModel({
//     required this.id,
//     required this.uuid,
//     required this.name,
//     required this.email,
//     required this.occupation,
//     required this.occupationId,
//     required this.profilePic,
//     required this.createdAt,
//     required this.language,
//     required this.platform,
//     required this.subscriptionStatus,
//     required this.hasUsedTrial,
//     required this.onTrial,
//     required this.hasCardDetail,
//     this.country,
//     this.phoneNumber,
//     this.gender,
//     required this.isDisabled,
//     this.disabilityDescription,
//     this.role,
//     required this.roles,
//     required this.interests,
//   });
//
//   factory UserModel.fromJson(Map<String, dynamic> json) {
//     return UserModel(
//       id: json['id'],
//       uuid: json['uuid'],
//       name: json['name'],
//       email: json['email'],
//       occupation: json['occupation'],
//       occupationId: json['occupation_id'],
//       profilePic: json['profile_pic'],
//       createdAt: DateTime.parse(json['created_at']),
//       language: json['language'],
//       platform: json['platform'],
//       subscriptionStatus: json['subscription_status'],
//       hasUsedTrial: json['has_used_trial'],
//       onTrial: json['on_trial'],
//       hasCardDetail: json['has_card_detail'],
//       country: json['country'],
//       phoneNumber: json['phone_number'],
//       gender: json['gender'],
//       isDisabled: json['is_disabled'],
//       disabilityDescription: json['disability_description'],
//       role: json['role'],
//       roles: List<String>.from(json['roles']),
//       interests: List<String?>.from(json['interests']),
//     );
//   }
// }

class UserModel {
  int? id;
  String? uuid;
  String? name;
  String? email;
  String? occupation;
  int? occupationId;
  String? profilePic;
  DateTime? createdAt;
  String? language;
  String? platform;
  int? subscriptionStatus;
  bool? hasUsedTrial;
  int? onTrial;
  int? hasCardDetail;
  String? country;
  String? phoneNumber;
  String? gender;
  bool? isDisabled;
  String? disabilityDescription;
  String? role;
  List<String>? roles;
  List<String?>? interests;

  UserModel({
    this.id,
    this.uuid,
    this.name,
    this.email,
    this.occupation,
    this.occupationId,
    this.profilePic,
    this.createdAt,
    this.language,
    this.platform,
    this.subscriptionStatus,
    this.hasUsedTrial,
    this.onTrial,
    this.hasCardDetail,
    this.country,
    this.phoneNumber,
    this.gender,
    this.isDisabled,
    this.disabilityDescription,
    this.role,
    this.roles,
    this.interests,
  });

  UserModel.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        uuid = json['uuid'],
        name = json['name'],
        email = json['email'],
        occupation = json['occupation'],
        occupationId = json['occupation_id'],
        profilePic = json['profile_pic'],
        createdAt = DateTime.parse(json['created_at']),
        language = json['language'],
        platform = json['platform'],
        subscriptionStatus = json['subscription_statuss'],
        hasUsedTrial = json['has_used_trial'],
        onTrial = json['on_trial'],
        hasCardDetail = json['has_card_detail'],
        country = json['country'],
        phoneNumber = json['phone_number'],
        gender = json['gender'],
        isDisabled = json['is_disabled'],
        disabilityDescription = json['disability_description'],
        role = json['role'],
        roles = List<String>.from(json['roles']),
        interests = List<String?>.from(json['interests']);

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'uuid': uuid,
      'name': name,
      'email': email,
      'occupation': occupation,
      'occupation_id': occupationId,
      'profile_pic': profilePic,
      'created_at': createdAt?.toIso8601String(),
      'language': language,
      'platform': platform,
      'subscription_statuss': subscriptionStatus,
      'has_used_trial': hasUsedTrial,
      'on_trial': onTrial,
      'has_card_detail': hasCardDetail,
      'country': country,
      'phone_number': phoneNumber,
      'gender': gender,
      'is_disabled': isDisabled,
      'disability_description': disabilityDescription,
      'role': role,
      'roles': roles,
      'interests': interests,
    };
  }
}
