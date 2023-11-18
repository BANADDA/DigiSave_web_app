class User {
  String uniqueCode;
  String fname;
  String lname;
  String email;
  String phone;
  String sex;
  String country;
  String dateOfBirth;
  String image;
  String district;
  String subCounty;
  String village;
  String numberOfDependents;
  String familyInformation;
  String nextOfKinName;
  int nextOfKinHasPhoneNumber;
  String nextOfKinPhoneNumber;
  String pwdType;
  bool isStaff;
  bool isActive;

  User({
    required this.uniqueCode,
    required this.fname,
    required this.lname,
    required this.email,
    required this.phone,
    required this.sex,
    required this.country,
    required this.dateOfBirth,
    required this.image,
    required this.district,
    required this.subCounty,
    required this.village,
    required this.numberOfDependents,
    required this.familyInformation,
    required this.nextOfKinName,
    required this.nextOfKinHasPhoneNumber,
    required this.nextOfKinPhoneNumber,
    required this.pwdType,
    required this.isStaff,
    required this.isActive,
  });

  // Function to convert JSON object to User object
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uniqueCode: json['unique_code'],
      fname: json['fname'],
      lname: json['lname'],
      email: json['email'],
      phone: json['phone'],
      sex: json['sex'],
      country: json['country'],
      dateOfBirth: json['date_of_birth'],
      image: json['image'],
      district: json['district'],
      subCounty: json['subCounty'],
      village: json['village'],
      numberOfDependents: json['number_of_dependents'],
      familyInformation: json['family_information'],
      nextOfKinName: json['next_of_kin_name'],
      nextOfKinHasPhoneNumber: json['next_of_kin_has_phone_number'],
      nextOfKinPhoneNumber: json['next_of_kin_phone_number'],
      pwdType: json['pwd_type'],
      isStaff: json['is_staff'],
      isActive: json['is_active'],
    );
  }

  // Function to convert User object to a Map
  Map<String, dynamic> toJson() {
    return {
      'unique_code': uniqueCode,
      'fname': fname,
      'lname': lname,
      'email': email,
      'phone': phone,
      'sex': sex,
      'country': country,
      'date_of_birth': dateOfBirth,
      'image': image,
      'district': district,
      'subCounty': subCounty,
      'village': village,
      'number_of_dependents': numberOfDependents,
      'family_information': familyInformation,
      'next_of_kin_name': nextOfKinName,
      'next_of_kin_has_phone_number': nextOfKinHasPhoneNumber,
      'next_of_kin_phone_number': nextOfKinPhoneNumber,
      'pwd_type': pwdType,
      'is_staff': isStaff,
      'is_active': isActive,
    };
  }
}
