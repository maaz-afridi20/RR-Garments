import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class UserModel {
  final String id;
  String firstName;
  String userName;
  String lastName;
  final String email;

  String phoneNumber;
  String profilePicture;

  UserModel(
      {required this.email,
      required this.firstName,
      required this.id,
      required this.lastName,
      required this.userName,
      required this.phoneNumber,
      required this.profilePicture});

// helper function to get the full name

  String get fullName => '$firstName $lastName';

  // helper function to get phone number

  String get formatedPhoneNumber => TFormatters.formatPhoneNumber(phoneNumber);

  // function to split full name to firstname and lastname
  static List<String> nameParts(fullName) => fullName.split(" ");

  // function to generate a user name from full name

  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split(" ");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    String camelCaseUserName =
        "$firstName$lastName"; // combile first name with last name
    String userNameWithPrefix = "cwt_$camelCaseUserName"; // Add cwt prefix to

    return userNameWithPrefix;
  }

  static UserModel empty() => UserModel(
      email: '',
      userName: '',
      firstName: "",
      id: "",
      lastName: "",
      phoneNumber: "",
      profilePicture: "");

  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture,
    };
  }

  // so jab b hm koi data ko get krtay hain firebase say
  // tu wo snapshot leta hai uss data ka matlab k return krta haii
  // so jab b hm data get karein firebase say tu wo tu json yani k (map) mein hota hai
  // tu jo data firebase say ata hai tu
  // uss ko hm iss usermodel.fromsnapsht ki help say uss data ko
  // get kr letay hain orr kahin b hm chahein use kr sktay hain...

  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data();
      return UserModel(
        email: data!['Email'] ?? '',
        firstName: data['FirstName'] ?? '',
        id: document.id,
        lastName: data['LastName'] ?? '',
        phoneNumber: data['PhoneNumber'] ?? '',
        profilePicture: data['ProfilePicture'] ?? '',
        userName: data['UserName'] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
