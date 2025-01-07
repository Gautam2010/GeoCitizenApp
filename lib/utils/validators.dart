bool isValidPhoneNumber(String phoneNumber) {
  return phoneNumber.isNotEmpty && phoneNumber.startsWith('+');
}

bool isValidOtp(String otp) {
  return otp.isNotEmpty && otp.length == 6;
}