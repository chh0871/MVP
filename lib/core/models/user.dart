class User {
  final String name;
  final String email;
  final String phoneNumber;

  User({required this.name, required this.email, required this.phoneNumber});
}

class UserCredentials {
  final String? uid;
  final String? email;

  UserCredentials({
    required this.uid,
    required this.email,
    r,
  });
}

class UserCredentialsGoogleSignIn {
  final String? uid;
  final String? email;
  final String? firstname;
  final String? photoUrl;
  final String? phonenumber;
  UserCredentialsGoogleSignIn({
    required this.uid,
    required this.email,
    required this.firstname,
    required this.photoUrl,
    required this.phonenumber,
  });
}
