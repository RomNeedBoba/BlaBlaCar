///
/// This model describes a  BlaBlaCar user.
///
class User {
  final String firstName;
  final String? lastName;
  final String? email;
  final String? phone;
  final String? profilePicture;

  final bool verifiedProfile;

  User(
      {required this.firstName,
      this.lastName,
      this.email,
      this.phone,
      this.profilePicture,
      this.verifiedProfile = false});
}
