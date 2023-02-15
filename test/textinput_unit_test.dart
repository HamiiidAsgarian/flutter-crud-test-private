import 'package:flutter_test/flutter_test.dart';
import 'package:mc_crud_test/features/core/validator.dart';

void main() {
  setUp(() => null);
  tearDown(() => null);
  group("First name and Lastname input validation tests", () {
    test("only words in name and family", () {
      var input = "name";
      var result = Validators.stringInputsValidator(input);
      expect(result, null);
    });
    test("multi part name and falimy name and family", () {
      var input = "da vinci chi";
      var result = Validators.stringInputsValidator(input);
      expect(result, null);
    });

    test("only words in name and family", () {
      var input = "1name";
      var result = Validators.stringInputsValidator(input);
      expect(result, 'Please enter a valid value');
    });
  });

  group("birthday input validation tests", () {
    test("dd/mm/yyyy numbers in birthday input", () {
      var input = "30/11/2033";
      var result = Validators.birthDayValidator(input);
      expect(result, null);
    });
    test("d/m/yy numbers in birthday input", () {
      var input = "1/1/33";
      var result = Validators.birthDayValidator(input);
      expect(result, null);
    });
    test("d-m-yy numbers in birthday input", () {
      var input = "1-1-33";
      var result = Validators.birthDayValidator(input);
      expect(result, null);
    });
    test("out of limit range is denied in birthday input", () {
      var input = "15-15-2033";
      var result = Validators.birthDayValidator(input);
      expect(result, 'Please enter your birthday currectly');
    });
    test("dd-mm-yyyy numbers in birthday input", () {
      var input = "30-11-2033";
      var result = Validators.birthDayValidator(input);
      expect(result, null);
    });
    test("dd.mm.yyyy numbers in birthday input", () {
      var input = "30.11.2033";
      var result = Validators.birthDayValidator(input);
      expect(result, null);
    });

    test("no word in birthday input", () {
      var input = "a111";
      var result = Validators.birthDayValidator(input);
      expect(result, "Please enter your birthday currectly");
    });
  });

  group("Phone input validation tests", () {
    test("only numbers with + and in fixed length in Phone input", () {
      var input = "+989369790967";
      var result = Validators.phoneNumberValidator(input);
      expect(result, null);
    });
    test("no word or over extended in Phone input", () {
      var input = "989369790967";
      var result = Validators.phoneNumberValidator(input);
      expect(result, "Please enter your phone number currectly");
    });
  });

  group("email input validation tests", () {
    test("*@*.com format in email input", () {
      var input = "te2st@test.com";
      var result = Validators.emailValidator(input);
      expect(result, null);
    });
    test("@ and .com requirement in email input", () {
      var input = "test-test.co";
      var result = Validators.emailValidator(input);
      expect(result, "Email is invalid");
    });
  });

  group("Bank account input validation tests", () {
    test("only numbers in Phone input", () {
      var input = "1111";
      var result = Validators.bankAccountValidator(input);
      expect(result, null);
    });
    test("no word in Phone input", () {
      var input = "a111";
      var result = Validators.bankAccountValidator(input);
      expect(result, "Please enter a valid bank account number");
    });
  });
}
