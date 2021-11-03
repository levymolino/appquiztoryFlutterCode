import 'package:appquiztory/pages/addquiz.dart';
import 'package:appquiztory/pages/search.dart';
import 'package:appquiztory/pages/webviewpage.dart';
import 'package:appquiztory/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DevHomePage extends StatefulWidget {
  const DevHomePage({Key? key}) : super(key: key);

  @override
  _DevHomePageState createState() => _DevHomePageState();
}

class _DevHomePageState extends State<DevHomePage> {
  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightGreen.shade600,
          centerTitle: true,
          title: const Text('Developers Mode'),
          leading: IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchEnginepage());
                    // Navigator.push(
                    // context,
                    // MaterialPageRoute(
                    //     builder: (context) => const Searcherpage()));
            },
            icon: const Icon(Icons.search),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WebViewExample()));
              },
              icon: const Icon(Icons.web_asset),
            ),
            PopupMenuButton(
              icon: const Icon(Icons.more_vert),
              itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.add),
                    title: Text('Add Quiz'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.people),
                    title: Text('Users'),
                  ),
                ),
                const PopupMenuItem(
                  child: ListTile(
                    leading: Icon(Icons.search),
                    title: Text('Search'),
                  ),
                ),
                const PopupMenuDivider(),
                const PopupMenuItem(child: Text('Settings')),
                PopupMenuItem(
                    child: const Text('Log Out'),
                    onTap: () async {
                      await authService.signOut();
                      Navigator.of(context).pushNamedAndRemoveUntil(
                          '/SplashScreen', (Route<dynamic> route) => false);
                    }),
              ],
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightGreen.shade600,
            child: const Icon(Icons.add),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Addquiz()));
            }));
  }
}
