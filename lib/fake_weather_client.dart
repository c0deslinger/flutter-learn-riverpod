class FakeWeaterClient {
  Future<int> get(String cityName) async {
    await Future.delayed(const Duration(seconds: 5));
    return cityName == "Jakarta" ? 28 : 20;
  }
}
