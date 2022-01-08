import 'package:flutter/material.dart';

class NavigationDrawerScreen extends StatefulWidget {
  const NavigationDrawerScreen({Key? key}) : super(key: key);

  @override
  _NavigationDrawerScreenState createState() => _NavigationDrawerScreenState();
}

class _NavigationDrawerScreenState extends State<NavigationDrawerScreen> {
  final _messengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: _messengerKey,
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                  decoration: const BoxDecoration(color: Colors.blue),
                  child: Container(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 100,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50.0))),
                          child: Image.network(
                              "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/440px-Google-flutter-logo.svg.png"),
                        ),
                        const Text("Навигация во Flutter"),
                      ],
                    ),
                  )),
              ListTile(
                leading: const Icon(Icons.one_k),
                title: const Text("Каталог"),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход в Каталог")));
                },
              ),
              ListTile(
                leading: const Icon(Icons.two_k),
                title: const Text("Корзина"),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход в Корзина")));
                },
              ),
              const Divider(),
              const Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Text("Профиль"),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Настройки"),
                onTap: () {
                  _messengerKey.currentState!.showSnackBar(
                      const SnackBar(content: Text("Переход в Настройки")));
                },
              ),
            ],
          ),
        ),
        body: Center(child: Text("Содержимое экрана")),
      ),
    );
  }
}
