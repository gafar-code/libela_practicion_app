enum VerifyFor {
  register,
  forget;

  bool get isRegister => this == VerifyFor.register;
}