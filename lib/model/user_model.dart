class UserModel {
  final String userName;
  final String userEmail;
  final String userGender;
  final String userPhoneNumber;
  final String userImage;
  final String userAddress;

  UserModel(
      {required this.userName,
      required this.userEmail,
      required this.userGender,
      required this.userPhoneNumber,
      required this.userImage,
      required this.userAddress});
}
