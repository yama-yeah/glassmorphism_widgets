import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlassApp(
      theme: GlassThemeData(
        blur: 10,
        linearGradient: LinearGradient(
          colors: [
            Colors.yellowAccent.withOpacity(0.4),
            Colors.yellow.withOpacity(0.2),
          ],
        ),
      ),
      home: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: GlassAppBar(
        title: const GlassText(
          'Glassmorphic Golden Test',
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        actions: [
          IconButton(
            icon: const GlassIcon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const GlassIcon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GlassListTile(
            leading: const GlassIcon(Icons.search),
            title: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                hintStyle: glassTextStyle,
              ),
              style: glassTextStyle,
            ),
            onTap: () {},
          ),
          const GlassIcon(Icons.add),
          const Center(
            child: Center(
              child: GlassContainer(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: GlassText("Hello World"),
                ),
              ),
            ),
          ),
          const GlassIcon(Icons.add),
          GlassButton(
              blur: 10,
              linearGradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.5),
                  Colors.blue.withOpacity(0.4),
                ],
              ),
              onPressed: () {
                showGlassBottomSheet(
                  blur: 2,
                  context: context,
                  child: const Center(
                    child: GlassText("Hello World", fontSize: 20),
                  ),
                );
              },
              child: const GlassText("Button")),
        ],
      ),
      floatingActionButton: GlassFloatingActionButton(
        onPressed: () {
          setState(() {
            index++;
          });
        },
        child: GlassText("$index"),
      ),
      bottomNavigationBar: GlassBottomBar(
        items: [
          GlassBottomBarItem(
            icon: const Icon(Icons.home),
            title: const GlassText("Home"),
            selectedGradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.5),
                Colors.yellow.withOpacity(0.5),
                Colors.red.withOpacity(0.5),
              ],
            ),
          ),
          GlassBottomBarItem(
            icon: const Icon(Icons.security),
            title: const GlassText("Search"),
          ),
          GlassBottomBarItem(
            icon: const Icon(Icons.settings),
            title: const GlassText("Settings"),
          ),
        ],
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        currentIndex: index,
      ),
    );
  }
}

void main() {
  const targetWidget = MyApp();

  testGoldens(
    'basic golden test',
    (WidgetTester tester) async {
      await loadAppFonts();
      await tester.pumpWidgetBuilder(targetWidget);
      await multiScreenGolden(tester, 'my_app_screen_test', devices: [
        Device.iphone11,
        Device.phone,
      ]);
    },
  );
  testGoldens('bottom sheet golden test', (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidgetBuilder(targetWidget);
    await tester.tap(find.text('Button'));
    await tester.pumpAndSettle();
    await multiScreenGolden(tester, 'my_app_screen_test_bottom_sheet',
        devices: [
          Device.iphone11,
          Device.phone,
        ]);
  });

  testGoldens('text field golden test', (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidgetBuilder(targetWidget);
    await tester.enterText(find.byType(TextField), 'Hello World');
    await tester.pumpAndSettle();
    await multiScreenGolden(tester, 'my_app_screen_test_text_field', devices: [
      Device.iphone11,
      Device.phone,
    ]);
  });

  testGoldens('bottom bar golden test', (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidgetBuilder(targetWidget);
    await tester.tap(find.byIcon(Icons.security));
    await tester.pumpAndSettle();
    await multiScreenGolden(tester, 'my_app_screen_test_bottom_bar_security',
        devices: [
          Device.iphone11,
          Device.phone,
        ]);
    await tester.tap(find.byIcon(Icons.settings));
    await tester.pumpAndSettle();
    await multiScreenGolden(tester, 'my_app_screen_test_bottom_bar_settings',
        devices: [
          Device.iphone11,
          Device.phone,
        ]);
  });

  testGoldens('floating action button golden test',
      (WidgetTester tester) async {
    await loadAppFonts();
    await tester.pumpWidgetBuilder(targetWidget);
    await tester.tap(find.byType(GlassFloatingActionButton));
    await tester.pumpAndSettle();
    await multiScreenGolden(tester, 'my_app_screen_test_floating_action_button',
        devices: [
          Device.iphone11,
          Device.phone,
        ]);
  });
}
