import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:todo_ui/router.dart';
import 'package:todo_ui/ui/screens/all_tasks_screen.dart';
import 'package:todo_ui/ui/screens/complete_tasks_screen.dart';
import 'package:todo_ui/ui/screens/customer_inquiries.dart';
import 'package:todo_ui/ui/screens/inComplete_tasks_screen.dart';
import 'package:todo_ui/ui/screens/new_task_screen.dart';

class TodoMainPage extends StatefulWidget {
  @override
  State<TodoMainPage> createState() => _TodoMainPageState();
}

class _TodoMainPageState extends State<TodoMainPage>
    with SingleTickerProviderStateMixin {
  TabController tabController;
  initTabController() {
    tabController = TabController(length: 4, vsync: this);
    tabController.addListener(() {
      String message = tabController.index == 0
          ? 'you are in the all tasks tab'
          : tabController.index == 1
              ? 'you are in the completed tasks tab'
              : 'ypu are in the incomplete tasks tab';
      log(message);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTabController();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MediaQuery.of(context).orientation == Orientation.portrait
        ? Scaffold(
            floatingActionButton: FloatingActionButton(
              backgroundColor: Colors.pink,
              child: Icon(Icons.add),
              onPressed: () {
                RouterClass.routerClass
                    .pushToSpecificScreenUsingWidget(NewTaskScreen());
              },
            ),
            drawer: Drawer(
              child: Column(
                children: [
                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(
                        color: Colors.pink,
                      ),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: AssetImage('assets/images/user.jpg'),
                      ),
                      accountName: Text('Nada'),
                      accountEmail: Text('nada99@gmail.com')),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(0);
                    },
                    title: Text('All Orders'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(1);
                    },
                    title: Text('Delivered Orders'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(2);
                    },
                    title: Text('UnDelivered Orders'),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                  ListTile(
                    onTap: () {
                      tabController.animateTo(3);
                    },
                    title: Text('Information about Customer '),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Colors.pink,
              title: Text('ORDER APP'),
              bottom: TabBar(
                isScrollable: true,
                labelColor: Colors.white,
                unselectedLabelColor: Colors.pink.shade100,
                indicatorColor: Color(0xffffffff),
                controller: tabController,
                tabs: [
                  Tab(
                    icon: Icon(Icons.list),
                  ),
                  Tab(
                    icon: Icon(Icons.done),
                  ),
                  Tab(
                    icon: Icon(Icons.cancel_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.dashboard_customize_rounded),
                  ),
                ],
              ),
            ),
            // bottomNavigationBar: BottomNavigationBar(
            //   currentIndex: index,
            //   onTap: (newindex) {
            //     setState(() {
            //       this.index = newindex;
            //     });
            //   },
            //   items: [
            //     BottomNavigationBarItem(label: 'All', icon: Icon(Icons.list)),
            //     BottomNavigationBarItem(label: 'Complete', icon: Icon(Icons.done)),
            //     BottomNavigationBarItem(
            //         label: 'InComplete', icon: Icon(Icons.cancel)),
            //   ],
            // ),
            body: TabBarView(controller: tabController, children: [
              AllTasksScreen(),
              CompleteTasksScreen(),
              InCompleteTasksScreen(),
              CustomerInquiries(),
            ]))
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.pink,
              title: Text('ORDER APP'),
            ),
            body: Row(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                          decoration: BoxDecoration(
                            color: Colors.pink,
                          ),
                          currentAccountPicture: CircleAvatar(
                              backgroundColor: Colors.white,
                              //child: Text('O'),
                              backgroundImage:
                                  AssetImage('assets/images/user.jpg')),
                          accountName: Text('Nada'),
                          accountEmail: Text('nada99@gmail.com')),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(0);
                        },
                        title: Text('All Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(1);
                        },
                        title: Text('Delivered Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(2);
                        },
                        title: Text('UnDelivered Orders'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                      ListTile(
                        onTap: () {
                          tabController.animateTo(3);
                        },
                        title: Text('Information about Customer '),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(controller: tabController, children: [
                  AllTasksScreen(),
                  CompleteTasksScreen(),
                  InCompleteTasksScreen(),
                  CustomerInquiries()
                ]))
              ],
            ),
          );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Text('NadaReqeb'),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize {
    return AppBar().preferredSize;
  }
}
