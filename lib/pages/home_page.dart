import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_flutter_app/style/theme.dart' as MyTheme;
import './tabs/home.dart' as _homeTab;
import './tabs/dashboard.dart' as _dashboardTab;
import './tabs/settings.dart' as _settingsTab;
import './tabs/chats.dart' as _chatsTab;

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  PageController _tabController;

  var _title_app = null;
  int _tab = 0;

  @override
  void initState() {
    super.initState();
    _tabController = new PageController();
    this._title_app = TabItems[0].title;
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) => new Scaffold(

      //App Bar
      appBar: new AppBar(
        title: new Text(
          _title_app,
          style: new TextStyle(
            fontSize:
                Theme.of(context).platform == TargetPlatform.iOS ? 17.0 : 20.0,
          ),
        ),
        elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
        backgroundColor: MyTheme.Colors.loginGradientStart,
      ),

      //Content of tabs
      body: new PageView(
        controller: _tabController,
        onPageChanged: onTabChanged,
        children: <Widget>[
          new _homeTab.Home(),
          new _dashboardTab.Dashboard(),
          new _chatsTab.Chat(),
          new _settingsTab.Settings()
        ],
      ),

      //Tabs
      bottomNavigationBar: Theme.of(context).platform == TargetPlatform.iOS
          ? new CupertinoTabBar(
              activeColor: Colors.white,
              currentIndex: _tab,
              backgroundColor: MyTheme.Colors.loginGradientStart,
              onTap: onTap,
              items: TabItems.map((TabItem) {
                return new BottomNavigationBarItem(
                  title: new Text(TabItem.title),
                  icon: new Icon(TabItem.icon),
                );
              }).toList(),
            )
          : new Theme(
              data: Theme.of(context).copyWith(
                  // sets the background color of the `BottomNavigationBar`
                  canvasColor: MyTheme.Colors.loginGradientStart,
                  // sets the active color of the `BottomNavigationBar` if `Brightness` is light
                  primaryColor: Colors.white ),
              child: new BottomNavigationBar(
                currentIndex: _tab,
                onTap: onTap,
                items: TabItems.map((TabItem) {
                  return new BottomNavigationBarItem(
                    title: new Text(TabItem.title),
                    icon: new Icon(TabItem.icon),
                  );
                }).toList(),
              )),

      //Drawer
      drawer: new Drawer(
          child: new ListView(
        children: <Widget>[
          new Container(
            height: 120.0,
            child: new DrawerHeader(
              padding: new EdgeInsets.all(0.0),
              decoration: new BoxDecoration(
                color: new Color(0xFFECEFF1),
              ),
              child: new Center(
                child: new FlutterLogo(
                  colors: Colors.blueGrey,
                  size: 54.0,
                ),
              ),
            ),
          ),
          new ListTile(
              leading: new Icon(Icons.chat),
              title: new Text('Support'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/support');
              }),
          new ListTile(
              leading: new Icon(Icons.info),
              title: new Text('About'),
              onTap: () {
                Navigator.pop(context);
                Navigator.of(context).pushNamed('/about');
              }),
          new Divider(),
          new ListTile(
              leading: new Icon(Icons.exit_to_app),
              title: new Text('Sign Out'),
              onTap: () {
                Navigator.pop(context);
              }),
        ],
      )));

  void onTap(int tab) {
    _tabController.jumpToPage(tab);
  }

  void onTabChanged(int tab) {
    setState(() {
      this._tab = tab;
    });

    switch (tab) {
      case 0:
        this._title_app = TabItems[0].title;
        break;

      case 1:
        this._title_app = TabItems[1].title;
        break;

      case 2:
        this._title_app = TabItems[2].title;
        break;
    }
  }
}

class TabItem {
  const TabItem({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<TabItem> TabItems = const <TabItem>[
  const TabItem(title: 'Home', icon: Icons.home),
  const TabItem(title: 'Dashboard', icon: Icons.dashboard),
  const TabItem(title: 'Chats', icon: Icons.chat),
  const TabItem(title: 'Settings', icon: Icons.settings),
];
