import 'package:time2Travel/core/core.dart';
import 'package:time2Travel/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:list_country_picker/list_country_picker.dart';
import 'package:phone_text_field/phone_text_field.dart';
import '../../domain/domain.dart';

class TravelerInfoCard extends StatefulWidget {
  final String title;
  final ValueChanged<PassengerInfo> onPassengerInfoChanged;
  const TravelerInfoCard(
      {super.key, required this.onPassengerInfoChanged, required this.title});
  @override
  State<TravelerInfoCard> createState() => _TravelerInfoCardState();
}

class _TravelerInfoCardState extends State<TravelerInfoCard> {
  DateTime? dateOfBirth;
  DateTime? passportExpiryDate;
  String? gender;
  String? nationality;
  String? phone;

  /// Controller
  final _conFirstName = TextEditingController();
  final _conLastName = TextEditingController();
  final _conEmail = TextEditingController();
  final _conPassportNumber = TextEditingController();

  /// Focus Node
  final _fnFirstName = FocusNode();
  final _fnLastName = FocusNode();
  final _fnEmail = FocusNode();
  final _fnPassportNumber = FocusNode();

  Country? country;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: Dimens.space8,
            vertical: Dimens.space12,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
                child: Text(
                  widget.title,
                  textScaleFactor: 1.25,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.space12, vertical: Dimens.space8),
                child: const Divider(
                  color: Palette.primary,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextF(
                      isOutlineInputBorder: false,
                      key: const Key("first_name"),
                      curFocusNode: _fnFirstName,
                      nextFocusNode: _fnLastName,
                      textInputAction: TextInputAction.done,
                      controller: _conFirstName,
                      keyboardType: TextInputType.text,
                      hintText: 'Mohamed',
                      maxLine: 1,
                      hint: "First Name",
                      validator: (String? value) => value != null
                          ? (value.length < 3
                              ? "Name must be at least 3 characters"
                              : null)
                          : null,
                      onChanged: (p0) {
                        refrechObject();
                      },
                    ),
                  ),
                  Expanded(
                    child: TextF(
                      isOutlineInputBorder: false,
                      key: const Key("last_name"),
                      curFocusNode: _fnLastName,
                      nextFocusNode: _fnEmail,
                      textInputAction: TextInputAction.done,
                      controller: _conLastName,
                      keyboardType: TextInputType.text,
                      hintText: 'Abdo',
                      maxLine: 1,
                      hint: "Last Name",
                      validator: (String? value) => value != null
                          ? (value.length < 3
                              ? "Name must be at least 3 characters"
                              : null)
                          : null,
                      onChanged: (p0) {
                        refrechObject();
                      },
                    ),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: SelectPiker(
                      title: "Gender",
                      hintText: "Select Gender",
                      onSelect: (value) {
                        setState(() => gender = value.name);
                        refrechObject();
                      },
                      items: [
                        KeyPares(name: "Male", id: "M"),
                        KeyPares(name: "Female", id: "F"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SelectDate(
                      title: "Date of Birth",
                      hintText: "DD/MM/YYYY",
                      onSelect: (value) {
                        setState(() => dateOfBirth = value);
                        refrechObject();
                      },
                    ),
                  ),
                ],
              ),
              ListCountryPiker(
                initialCountryCode: "+971",
                child: ListTile(
                  title: const Text("Nationality"),
                  subtitle: country != null
                      ? Text("${country!.flag} ${country!.name}")
                      : null,
                  trailing: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Palette.primary,
                  ),
                ),
                onCountryChanged: (value) {
                  setState(() => country = value);
                  refrechObject();
                },
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimens.space12),
                child: const Divider(
                  color: Palette.primary,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: Dimens.space12, vertical: Dimens.space8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Mobile",
                      textScaleFactor: 1.1,
                    ),
                    PhoneTextField(
                      onChanged: (value) {
                        setState(() => phone = value.completeNumber);
                        refrechObject();
                      },
                      initialCountryCode: '+971',
                      showCountryCodeAsIcon: true,
                      countryViewOptions:
                          CountryViewOptions.countryCodeWithFlag,
                      decoration: InputDecoration(
                        //labelText: 'Phone Number',
                        hintText: '556074080',
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Palette.primaryWithOpacity,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              TextF(
                isOutlineInputBorder: false,
                key: const Key("email"),
                curFocusNode: _fnEmail,
                nextFocusNode: _fnPassportNumber,
                textInputAction: TextInputAction.done,
                controller: _conEmail,
                keyboardType: TextInputType.emailAddress,
                maxLine: 1,
                hintText: "username@domain.com",
                hint: "Email",
                validator: (String? value) => value != null
                    ? (!value.isValidEmail() ? "Invalid email format" : null)
                    : null,
                onChanged: (p0) {
                  refrechObject();
                },
              ),
              const ListTile(
                subtitle: Text(
                  "Booking confirmation will be sent to this email address.",
                ),
              ),
              const ListTile(
                title: Text(
                  "Passpost Details",
                  style: TextStyle(color: Palette.primary),
                ),
                subtitle: Text(
                  "Please enter details exactly as they appear on your passport/travel document.",
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextF(
                        isOutlineInputBorder: false,
                        key: const Key("passport_number"),
                        curFocusNode: _fnPassportNumber,
                        controller: _conPassportNumber,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        maxLine: 1,
                        hintText: "Your Passport Number",
                        hint: "Passport Number",
                        validator: (String? value) => value != null
                            ? (value.isEmpty
                                ? "Please enter a valid passport number"
                                : null)
                            : null,
                        onChanged: (p0) {
                          refrechObject();
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: SelectDate(
                      title: "Date of Expiry",
                      hintText: "DD/MM/YYYY",
                      onSelect: (value) {
                        setState(() => passportExpiryDate = value);
                        refrechObject();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  refrechObject() {
    widget.onPassengerInfoChanged(PassengerInfo(
      firstName: _conFirstName.text,
      lastName: _conLastName.text,
      gender: gender,
      dateOfBirth: dateOfBirth,
      nationality: country?.name,
      mobile: phone,
      email: _conEmail.text,
      passportNumber: _conPassportNumber.text,
      passportExpiryDate: passportExpiryDate,
    ));
  }
}
