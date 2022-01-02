<!-- 
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages). 

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages). 
-->

## Glassmorphism Widgets 
<img src="https://user-images.githubusercontent.com/82094614/147371522-76db6662-3945-4470-bad3-1dfec306ccd1.png"></img>

## About
This package allows you to easily create a Glassmorphism UI.<br>
The AppBar, ListTile, and even the BottomNavigationBar work like Material Design widgets.<br>
The color, shape, and size of the glass are all up to you.<br>
Create your ideal Glassmorphism App!<br>
This package currently supports only stable channel.


## Getting started

You should add the following to the `pubspec.yaml` file:

```yaml
dependencies:
  glassmorphism_widgets:
```

You should then run `flutter packages get` in your terminal so as to get the package.<br>

Now import the package in the dart file:

```dart
import 'package:glassmorphism_widgets/glassmorphism_widgets.dart';
```

## Usage
Here is an example of how to use Glassmorphism Widgets.<br>
Many of the parameters are based on the original Material Design widget.<br>
If you want to know glass specific parameter.<br>
You should look [here](#a-specific-Glass-widget-parameter).

### GlassContainer<br>
a simple glass container.
```dart
GlassContainer(
    child: Padding(
      padding: EdgeInsets.all(8),
      child: GlassText("Hello World"),
    ),
),
```

### GlassFlexContainer<br>
```dart
Container(
    height:200,
    width:200,
    GlassFlexContainer(
        child: Padding(
        padding: EdgeInsets.all(8),
        child: GlassText("Hello World"),
        ),
    ),
),
```
### GlassApp & GlassThemeData
If you want to change glass widgets look all together.<br>
You should use GlassApp and GlassThemeData.
```dart
GlassApp(
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
)
```

### GlassTheme
If you want to access GlassThemeData.<br>
You should use GlassTheme.
```dart
GlassThemeData data = GlassTheme.of(context);
```

### GlassText
It is a thin white text.
```dart
GlassText("Hello World"),
```

### GlassAppBar
a simple glass app bar.
```dart
appBar: GlassAppBar(
    title: GlassText(
        'Glass Morphic Demo',
        fontWeight: FontWeight.bold,
        color: Colors.white,
    ),
),
```
### GlassListTile
a simple glass list tile
```dart
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
```
### GlassButton
a simple glass button
```dart
GlassButton(
    onPressed: () {
    showGlassBottomSheet(
        context: context,
        child: Center(
            child: GlassText("Hello World", fontSize: 20)));
    },
    child: GlassText("Button"),
),
```
### showGlassBottomSheet
Display bottom sheet like glass
```dart
showGlassBottomSheet(
    context: context,
    child: Center(
        child: GlassText("Hello World", fontSize: 20)));
```
### GlassFloatingActionButton
```dart
floatingActionButton: GlassFloatingActionButton(
    onPressed: () {
        setState(() {
            index++;
        });
    },
    child: GlassText("$index"),
),
```
### GlassBottomBar
```dart
bottomNavigationBar: GlassBottomBar(
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
```
### GlassIcon
```dart
IconButton(
    icon: GlassIcon(Icons.search),
    onPressed: () {},
),
```
## a specific Glass widget parameter
### How to change widgets gradient?
You should add parameter linearGradient.

### How to change widgets shape?
You should add parameter radius or borderRadius.<br>
borderRadius takes precedence over radius.

### I want to create more clear glass or more frosted glass
You should add parameter blur.<br>
If you set blur lower value. GlassWidgets will become clear.
## Problem
Master Channel cannot use GlassFloatingActionButton.

## Contact
If you have anything you want to inform me ([@yama-yeah](https://github.com/yama-yeah)), such as suggestions to enhance this package or functionalities you want etc, feel free to make [issues on GitHub](https://github.com/yama-yeah/glassmorphism_widgets/issues)
