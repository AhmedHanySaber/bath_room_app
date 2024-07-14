String? validateEmail(String? email) {
  if (email == null || email.trim().isEmpty) {
    return 'Please enter a valid email';
  }

  RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
  final isEmailValid = emailRegex.hasMatch(email.trim());

  if (!isEmailValid) {
    return 'Your email should be like this: user@test.com';
  }

  return null;
}

String? validatePassword(String? password) {
  if (password == null) {
    return 'Please type a password';
  }
  if (password.length < 6) {
    return 'Your password should be at least 6 characters';
  }
  return null;
}

String? validateRating(String? index) {
  if (index == null) {
    return 'Please enter a rating';
  }
  if (index.length > 5) {
    return 'Your rating should be below 5 characters';
  }
  return null;
}

String? validateConfirmPassword(String? password, String? confirm) {
  if (confirm == null) {
    return 'Please type a password';
  }
  if (confirm.length < 6) {
    return 'Your password should be at least 6 characters';
  }
  if (confirm != password) {
    return "Your password doesn't match";
  }
  return null;
}

String? validateVerification(String? verification) {
  if (verification == null) {
    return 'Please type a code';
  }
  if (verification.length < 6) {
    return 'Your code should be at least 6 characters';
  }
  return null;
}

String? validateName(String? name) {
  final nameRegex = RegExp(r'^[a-zA-Z\s]{1,50}$');
  if (name == null) {
    return 'Name cannot be null';
  } else if (name.isEmpty || name.length < 3) {
    return 'Name should be at least 3 characters';
  } else if (!nameRegex.hasMatch(name)) {
    return 'Please enter a valid name';
  } else {
    return null;
  }
}
