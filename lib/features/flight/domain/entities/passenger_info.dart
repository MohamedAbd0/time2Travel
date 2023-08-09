class PassengerInfo {
  String? firstName;
  String? lastName;
  String? gender;
  DateTime? dateOfBirth;
  String? nationality;
  String? mobile;
  String? email;
  String? passportNumber;
  DateTime? passportExpiryDate;

  PassengerInfo({
    this.firstName,
    this.lastName,
    this.gender,
    this.dateOfBirth,
    this.nationality,
    this.mobile,
    this.email,
    this.passportNumber,
    this.passportExpiryDate,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["firstName"] = firstName;
    json["lastName"] = lastName;
    json["gender"] = gender;
    json["dateOfBirth"] = dateOfBirth;
    json["nationality"] = nationality;
    json["mobile"] = mobile;
    json["email"] = email;
    json["passportNumber"] = passportNumber;
    json["passportExpiryDate"] = passportExpiryDate;

    return json;
  }
}
