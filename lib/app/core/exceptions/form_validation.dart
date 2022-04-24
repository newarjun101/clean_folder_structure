String? checkValidPhone(phone) {
  if (phone.isEmpty ||
      !RegExp(r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$')
          .hasMatch(phone)) {
    //  r'^[0-9]{10}$' pattern plain match number with length 10
    return "Enter Correct Phone Number";
  } else if (phone.toString().length < 5 || phone.toString().length > 12) {
    return "Enter Valid Phone Number";
  } else {
    return null;
  }
}

String? checkIsEmpty(password) {
  if (password.isEmpty) {
    return "Please fill the valid info";
  } else {
    return null;
  }
}

String? checkByLength(value) {
  if (value.isEmpty) {
    return "This field can't be empty";
  } else if (value.lenth < 4) {
    return "Too Short";
  } else {
    return null;
  }
}
