Future<void> delay(bool addDelay, [int milliseconds = 5000]) {
  if (addDelay) {
    return Future.delayed(Duration(microseconds: milliseconds));
  } else {
    return Future.value();
  }
}
