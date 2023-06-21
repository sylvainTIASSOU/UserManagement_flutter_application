import 'package:crud/views/pages/Notification.dart';
import 'package:crud/views/pages/UserList.dart';
import 'package:crud/views/widgets/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../my_flutter_app_icons.dart';
import '../../viewModels/providers/providers.dart';

class PageHome extends ConsumerStatefulWidget {
  const PageHome({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends ConsumerState<PageHome> {
  bool isVisited = true;
  int _selectedIndex = 0;
  late PageController _pageController;
  @override
  void initState() {
    super.initState();

    _pageController = PageController();
    ref.read(Providers.isVisibleProvider);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onItemTaped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    //final bool isVisible = ref.watch(Providers.isVisibleProvider);
    return showicon(Widgets.isVisible);
    // Scaffold(
    //     //la bar du pied de la page
    //     bottomNavigationBar:
    //     BottomNavigationBar(
    //       showSelectedLabels: false,
    //       showUnselectedLabels: false,
    //       items: const [
    //         BottomNavigationBarItem(
    //             icon: Icon(
    //               Icons.home,
    //             ),
    //             label: 'home'),
    //         BottomNavigationBarItem(
    //             icon: Row(
    //               mainAxisAlignment: MainAxisAlignment.center,
    //               children: [
    //                 Icon(
    //                   Icons.notifications,
    //                 ),
    //                 //showicon(isVisited)
    //                 Visibility(
    //                     child: Padding(
    //                       padding: EdgeInsets.only(bottom: 20),
    //                       child: Icon(
    //                         Icons.circle,
    //                         size: 10,
    //                         color: Colors.red,
    //                       ),
    //                     ),
    //                     visible: true)
    //               ],
    //             ),
    //
    //             //activeIcon: Icon(Icons.noise_control_off),
    //             label: 'notification'),
    //       ],
    //       currentIndex: _selectedIndex,
    //       selectedItemColor: Colors.black,
    //       onTap: (index) {
    //         setState(() {
    //           _pageController.jumpToPage(index);
    //         });
    //       },
    //     ),
    //     body: SizedBox.expand(
    //       child: PageView(
    //         controller: _pageController,
    //         onPageChanged: (index) {
    //           setState(() {
    //             _selectedIndex = index;
    //           });
    //         },
    //         children: [
    //           UserList(),
    //           //UserProfilPage(),
    //
    //           NotificationPage(),
    //         ],
    //       ),
    //     ));
  }



  Widget showicon(bool visite) {
    if (visite) {
      return Scaffold(
        //la bar du pied de la page
          bottomNavigationBar:
          BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 35,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        MyFlutterApp.notif,
                        size: 35,
                      ),
                      //showicon(isVisited)
                      Visibility(
                          visible: true,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Icon(
                              Icons.circle,
                              size: 8,
                              color: Color.fromARGB(255, 195, 6, 38),
                            ),
                          ))
                    ],
                  ),

                  //activeIcon: Icon(Icons.noise_control_off),
                  label: 'notification'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: (index) {
              setState(() {
                _pageController.jumpToPage(index);
              });
            },
          ),
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                UserList(),
                //UserProfilPage(),

                NotificationPage(),
              ],
            ),
          ));

    } else {
      return Scaffold(
        //la bar du pied de la page
          bottomNavigationBar:
          BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    MyFlutterApp.solid__1_,
                    size: 35,
                  ),
                  label: 'home'),
              BottomNavigationBarItem(
                  icon: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        MyFlutterApp.notif,
                       size: 35,

                      ),
                      //showicon(isVisited)
                      Visibility(
                          visible: false,
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 20),
                            child: Icon(
                              Icons.circle,
                              size: 8,
                              color: Color.fromARGB(255, 195, 6, 38),
                            ),
                          ))
                    ],
                  ),

                  //activeIcon: Icon(Icons.noise_control_off),
                  label: 'notification'),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.black,
            onTap: (index) {
              setState(() {
                _pageController.jumpToPage(index);
                if(index != 0)
                  {
                    Widgets.isVisible = false;
                  }
              });
            },
          ),
          body: SizedBox.expand(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              children: [
                UserList(),
                //UserProfilPage(),

                NotificationPage(),
              ],
            ),
          ));
    }
  }
}
