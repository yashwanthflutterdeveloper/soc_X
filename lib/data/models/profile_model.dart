class ProfileModel {
  final int id;
  final String name;
  final String username;
  final String bio;
  final int posts;
  final int followers;
  final int following;

  ProfileModel({
    required this.id,
    required this.name,
    required this.username,
    required this.bio,
    required this.posts,
    required this.followers,
    required this.following,
  });

  ProfileModel copyWith({
    int? posts,
    int? followers,
    int? following,
  }) {
    return ProfileModel(
      id: id,
      name: name,
      username: username,
      bio: bio,
      posts: posts ?? this.posts,
      followers: followers ?? this.followers,
      following: following ?? this.following,
    );
  }
}
