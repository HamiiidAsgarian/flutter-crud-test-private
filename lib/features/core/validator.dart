class Validators {
  static stringInputsValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r"^([a-z]+[,.]?[ ]?|[a-z]+['-]?)+$").hasMatch(value.trim())) {
      return 'Please enter a valid value';
    }
    return null;
  }

  static birthDayValidator(value) {
    ///dd/mm/yyyy
    if (value == null ||
        value == "" ||
        !RegExp(r"^(?:(?:31(\/|-|\.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(\/|-|\.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(\/|-|\.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(\/|-|\.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$")
            .hasMatch(value.trim())) {
      return 'Please enter your birthday currectly';
    }
    return null;
  }

  static phoneNumberValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r"^(\+\d{1,3}[- ]?)?\d{10}$").hasMatch(value.trim())) {
      return 'Please enter your phone number currectly';
    }
    return null;
  }

  static emailValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
            .hasMatch(value.trim())) {
      return "Email is invalid";
    } else {
      return null;
    }
  }

  static bankAccountValidator(value) {
    if (value == null ||
        value == "" ||
        !RegExp(r"^[0-9]*$").hasMatch(value.trim())) {
      return 'Please enter a valid bank account number';
    }
    return null;
  }
}
