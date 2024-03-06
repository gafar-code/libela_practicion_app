String? validateEmail(String? value) {
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  if (value?.isEmpty ?? true) {
    return 'Email tidak boleh kosong';
  } else {
    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Email tidak valid'
        : null;
  }
}

String? validatePassword(String? value) {
  if (value?.isEmpty ?? true) {
    return 'Password tidak boleh kosong !';
  } else if ((value?.length ?? 0) < 8) {
    return 'Password minimal harus 8 karakter !';
  } else {
    return null;
  }
}

String? validatePhone(String? value) {
  /* String regexPattern = r'^(?:[+0][1-9])?[0-9]{10,12}$';
  var regExp = RegExp(regexPattern);

  if (value?.isEmpty ?? true) {
    return 'Nomor HP tidak boleh kosong';
  } else if (regExp.hasMatch(value ?? '')) {
    return null;
  }
  return 'Nomor HP tidak valid !';*/

  String cleanPhoneNumber = (value ?? '').replaceAll(RegExp(r'\D'), '');

  if (value?.isEmpty ?? true) {
    return 'Nomor HP tidak boleh kosong !';
  } else if (cleanPhoneNumber.length < 8) {
    return 'Nomor HP harus memiliki minimal 8 karakter !';
  } else if (!cleanPhoneNumber.startsWith('62')) {
    return 'Nomor HP harus diawali dengan kode negara 62 !';
  } else {
    return null;
  }
}

String? validatorText(String? value, String label, {double minChar = 0}) {
  if (value?.isEmpty ?? true) {
    return '$label tidak boleh kosong !';
  } else if (minChar > 0 && (value?.isNotEmpty ?? false)) {
    return '$label minimal harus $minChar karakter !';
  } else {
    return null;
  }
}
