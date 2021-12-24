import 'package:flutter/material.dart';
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Glasmorphic Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('img/bg.jpg'),
                fit: BoxFit.cover,
              ),
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
                  onPressed: () {
                    showGlassBottomSheet(
                        context: context,
                        child: Center(
                            child: GlassText("Hello World", fontSize: 20)));
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
          bottomNavigationBar: Container(
            //color: Colors.white,
            child: GlassBottomBar(
              items: [
                GlassBottomBarItem(
                  icon: Icon(Icons.home),
                  title: GlassText("Home"),
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
          ),
        )
      ],
    );
  }
}
