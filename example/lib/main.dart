import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GlassApp(
      theme: GlassThemeData(
        blur: 10,
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

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(

              image: DecorationImage(
                image: Image.network("https://picsum.photos/" +
                        "${MediaQuery.of(context).size.width.toInt()}/" +
                        "${MediaQuery.of(context).size.height.toInt()}")
                    .image,

                fit: BoxFit.cover,
              ),*/
              gradient: LinearGradient(colors: [
                Colors.blue,
                Colors.yellow,
                Colors.red,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: GlassAppBar(
            title: GlassText(
              'Glass Morphic Demo',
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            actions: [
              IconButton(
                icon: GlassIcon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: GlassIcon(Icons.more_vert),
                onPressed: () {},
              ),
            ],
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GlassListTile(
                leading: GlassIcon(Icons.search),
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
              GlassIcon(Icons.add),
              Container(
                child: Center(
                  child: Center(
                    child: GlassContainer(
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: GlassText("Hello World"),
                      ),
                    ),
                  ),
                ),
              ),
              GlassIcon(Icons.add),
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
                      child: Center(
                        child: GlassText("Hello World", fontSize: 20),
                      ),
                    );
                  },
                  child: GlassText("Button")),
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
                icon: Icon(Icons.home),
                title: GlassText("Home"),
                selectedGradient: LinearGradient(
                  colors: [
                    Colors.blue.withOpacity(0.5),
                    Colors.yellow.withOpacity(0.5),
                    Colors.red.withOpacity(0.5),
                  ],
                ),
              ),
              GlassBottomBarItem(
                icon: Icon(Icons.search),
                title: GlassText("Search"),
              ),
              GlassBottomBarItem(
                icon: Icon(Icons.settings),
                title: GlassText("Settings"),
              ),
            ],
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            currentIndex: index,
          ),
        )
      ],
    );
  }
}
