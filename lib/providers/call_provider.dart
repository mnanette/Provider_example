import 'package:flutter/material.dart';
import 'package:flutter_application_1/repoistory/call_repository.dart';

class CallProvider with ChangeNotifier {
  final CallRepository callRepository;
  List<String> _calls = [];

  CallProvider({required this.callRepository});

  List<String> get calls => _calls;

  Future<void> fetchCalls() async {
    _calls = await callRepository.getCalls();
    notifyListeners();
  }
}
