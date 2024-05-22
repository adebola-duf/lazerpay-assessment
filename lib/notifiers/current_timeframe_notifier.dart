import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentTimeframeNotifier extends StateNotifier<String> {
  CurrentTimeframeNotifier() : super('1H');

  void updateCurrentTimeFrame(String newTimeFrame){
    state = newTimeFrame; 
  }

}

final currentTimeframeNotifier =
    StateNotifierProvider<CurrentTimeframeNotifier, String>(
  (ref) => CurrentTimeframeNotifier(),
);