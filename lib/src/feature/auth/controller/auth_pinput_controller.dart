import 'dart:async';
import 'package:flutter/widgets.dart';
import '../../../models/code_sms_token.dart';
import '../../../models/user_model.dart';
import '../../../repository/app_repository_implements.dart';

class AuthPinPutController extends ChangeNotifier {
  UserModel user = UserModel(); // Initialized here
  SmsCodeModel? smsCodeModel;
  AppRepositoryImpl appRepositoryImpl = AppRepositoryImpl();
  bool pinButtonEnable = true;
  bool _isResendVisible = false;
  int _secondsRemaining = 60;
  Timer? _timer;
  bool _timerStarted = false;

  bool get isResendVisible => _isResendVisible;
  int get secondsRemaining => _secondsRemaining;
  bool get timerStarted => _timerStarted;

  String formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void startTimer() {
    if (_timerStarted) return;
    _timerStarted = true;

    _timer?.cancel();
    _secondsRemaining = 60;
    _isResendVisible = false;
    notifyListeners();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        _secondsRemaining--;
      } else {
        _isResendVisible = true;
        timer.cancel();
      }
      notifyListeners();
    });
  }

  void resendCode() {
    startTimer();
    sendCodeForTimeOut();
  }

  void sendCodeForTimeOut() async {
    smsCodeModel = await appRepositoryImpl.registerUser(email: user.email!, password: user.password!);
    notifyListeners();
  }

  void verifyCode(String pin) {
    // Verification logic here
    notifyListeners();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}

