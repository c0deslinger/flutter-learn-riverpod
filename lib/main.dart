import 'package:flutter/material.dart';
import 'package:flutter_learn_riverpod/fake_weather_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

final fakeWeaterClientProvider = Provider((ref) => FakeWeaterClient());

final responseProvider = FutureProvider<int>((ref) async {
  final weaterClient = ref.read(fakeWeaterClientProvider);
  return weaterClient.get("Malang");
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Consumer(builder: (context, watch, child) {
              final responseValue = watch(responseProvider);
              return responseValue.map(
                  data: (weater) => Text("Current weather is ${weater.value}"),
                  loading: (_) => const CircularProgressIndicator(),
                  error: (message) =>
                      Text("Error get water: ${message.error}"));
            }),
          ],
        ),
      ),
    );
  }
}
