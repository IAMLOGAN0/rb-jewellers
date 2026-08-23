import 'package:dartz/dartz.dart';

import 'failures.dart';

Either<ValueFailure<String>, String> validateMaxStringLength(
  String input,
  int maxLength,
) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(
      failedValue: input,
      max: maxLength,
    ));
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isEmpty) {
    return left(ValueFailure.empty(failedValue: input));
  } else {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateSingleLine(String input) {
  if (input.contains('\n')) {
    return left(ValueFailure.multiline(failedValue: input));
  } else if (input.isEmpty || input == '') {
    return left(ValueFailure.empty(failedValue: input));
  }
  {
    return right(input);
  }
}

Either<ValueFailure<String>, String> validateName(String input) {
  // Custom name validation logic
  // const nameRegex = r"^[A-Za-z]+( [A-Za-z]+)?$";
  // const nameRegex = r"^[A-Za-z]+(?:\s+[A-Za-z]+)*$";
  //    const nameRegex = r"^[A-Za-z]+(?:[\s\-'\.][A-Za-z]+)*$";
  //  const nameRegex = r"^[A-Za-z]+(?:[\s\-'\.][A-Za-z]+)*\s*$";
  const nameRegex = r"^[A-Za-z]+(?:[\s\-'\.]+[A-Za-z]+)*\s*$";

  if (RegExp(nameRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidName(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  // Maybe not the most robust way of email validation but it's good enough
  const emailRegex =
      r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input));
  }
}

Either<ValueFailure<int>, int> validateAge(int input) {
  const ageRegex = r"^\d+$";
  if (RegExp(ageRegex).hasMatch(input.toString())) {
    final age = input;
    return right(age);
  }
  return left(ValueFailure.invalidAge(failedValue: input));
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  // You can also add some advanced password checks (uppercase/lowercase, at least 1 number, ...)
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input));
  }
}

Either<ValueFailure<String>, String> validatePhoneNumber(String? input) {
  if (input != null && input.length >= 10 && input.length <= 15) {
    return right(input);
  } else {
    return left(ValueFailure.invalidPhoneNumber(failedValue: input ?? ""));
  }
}
