import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int teamA = 0;
  int teamB = 0;
  int lastPoint = 0;
  int lastTeamPoint = 0;
  bool btnDisabled = false;

  void _undoPoint() {
      setState(() {
        if (lastTeamPoint == 1) {
          teamA -= lastPoint;
        }
        if (lastTeamPoint == 2) {
          teamB -= lastPoint;
        }
        btnDisabled = true;
      });
  }

  void _pointTeamA(int points) {
    setState(() {
      teamA += points;
      lastTeamPoint = 1;
      lastPoint = points;
      btnDisabled = false;
    });
  }

  void _pointTeamB({required int points}) {
    setState(() {
      teamB += points;
      lastTeamPoint = 2;
      lastPoint = points;
      btnDisabled = false;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '$teamA',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  ' x ',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  '$teamB',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('CASA'),
                    FilledButton(onPressed: () => _pointTeamA(1), child: const Text('+1')),
                    FilledButton(onPressed: () => _pointTeamA(2), child: const Text('+2')),
                    FilledButton(onPressed: () => _pointTeamA(3), child: const Text('+3'))
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('VISITANTES'),
                    FilledButton(onPressed: () => _pointTeamB(points: 1), child: const Text('+1')),
                    FilledButton(onPressed: () => _pointTeamB(points: 2), child: const Text('+2')),
                    FilledButton(onPressed: () => _pointTeamB(points: 3), child: const Text('+3'))
                  ],
                )
              ],
            ),
            FilledButton(onPressed: btnDisabled ? null : _undoPoint,  child: const Text('Voltar ponto'))
          ],
        ),
      ),
    );
  }
}
