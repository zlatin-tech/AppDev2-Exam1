class UserProfile {
  String? email;
  String? username;
  String? profilePictureURL;

  UserProfile.fromEmail({this.email});
  UserProfile.fromUsername({this.username});
  UserProfile.full({this.email, this.username, this.profilePictureURL});
}

void main() {
  var userByEmail = UserProfile.fromEmail(email: "email@example.com");
  var userByUsername = UserProfile.fromUsername(username: "user123");
  var fullProfile = UserProfile.full(email: "email@example.com", username: "user123", profilePictureURL: "http://example.com/picture.jpg");
}
