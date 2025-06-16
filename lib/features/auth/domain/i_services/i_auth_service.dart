abstract interface class IAuthService {
  Future login(String phoneNumber,String otp);
  Future register({
    required String email,
    required String name,
    required String phoneNumber,
  });

  Future requestOtp(String phone);
  Future resendOtp(String phone);

  Future verifyOtp(String phone,String otp);
}
