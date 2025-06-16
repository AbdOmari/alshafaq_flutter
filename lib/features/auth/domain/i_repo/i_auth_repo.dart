abstract interface class IAuthRepo {
  Future register({
    required String email,
    required String name,
    required String phoneNumber,
    double? referCode,
  });
  Future login(String phoneNumber,String otp);

  
  Future requestOtp(String phone);
  Future resendOtp(String phone);
  Future verifyOtp(String phone,String otp);
}
