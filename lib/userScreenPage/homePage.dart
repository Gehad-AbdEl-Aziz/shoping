import 'package:flutter/material.dart';
import 'package:project_srca/tools/store.dart';
import 'package:project_srca/userScreenPage/about.dart';
import 'package:project_srca/userScreenPage/cart.dart';
import 'package:project_srca/userScreenPage/delivery.dart';
import 'package:project_srca/userScreenPage/favorites.dart';
import 'package:project_srca/userScreenPage/history.dart';
import 'package:project_srca/userScreenPage/item_details.dart';
import 'package:project_srca/userScreenPage/login_logout.dart';
import 'package:project_srca/userScreenPage/message.dart';
import 'package:project_srca/userScreenPage/notifacation.dart';
import 'package:project_srca/userScreenPage/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // add this line
  BuildContext context;
  @override
  Widget build(BuildContext context) {
    // and add this line also
    this.context = context;

    return Scaffold(
      appBar: AppBar(
        title: new Text('Majer'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => FavoritePage()),
                );
              }),
          Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              IconButton(
                  icon: Icon(Icons.chat),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MessagePage()),
                    );
                  }),
              CircleAvatar(
                radius: 11.0,
                backgroundColor: Colors.red,
                child: Text(
                  '0',
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
              ),
            ],
          )
        ],
      ),
      //=============
      // ====== Body
      body: Center(
          child: new Column(
        children: <Widget>[
          Flexible(
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: storeItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemDetails(
                       //====== de 3l4an ttnkl same image anther pages
                          itemImage: storeItems[index].itemImage,
                          itemName: storeItems[index].itemName,
                          itemPrice: storeItems[index].itemPrice,
                          itemRating: storeItems[index].itemRating,
                        )));
                      },
                      child: Card(
                        child: Stack(
                          alignment: FractionalOffset.topLeft,
                          children: <Widget>[
                            Stack(
                              alignment: FractionalOffset.bottomCenter,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                            ("${storeItems[index].itemImage}")),
                                        fit: BoxFit.cover),
                                  ),
                                ),
                                Container(
                                  height: 35.0,
                                  color: Colors.black.withAlpha(100),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Text(
                                          "${storeItems[index].itemName.substring(0, 7)}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 16.0,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          "${storeItems[index].itemPrice}",
                                          style: TextStyle(
                                              color: Colors.red[500],
                                              fontWeight: FontWeight.w700),
                                        ),
                                        Text('${storeItems[index].itemRating}'),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  height: 30.0,
                                  width: 60.0,
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(5.0),
                                          bottomRight: Radius.circular(5.0))),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 20.0,
                                      ),
                                      Text(
                                        "${storeItems[index].itemRating}",
                                        style: TextStyle(color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                IconButton(
                                    icon: Icon(
                                      Icons.favorite_border,
                                      color: Colors.yellow,
                                    ),
                                    onPressed: (){

                                    })
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  })),
        ],
      )),
      // ======= Button in buttom
      floatingActionButton: Stack(children: <Widget>[
        new FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
            child: Icon(Icons.shopping_cart)),
        CircleAvatar(
          backgroundColor: Colors.red,
          radius: 11.0,
          child: Text(
            '0',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
        )
      ]),
      //========= drawer => show the information to user
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            // this is the information about the user him name & him email & him image
            UserAccountsDrawerHeader(
              accountName: Text('Gehad Adelaziz'),
              accountEmail: Text(
                'gehadzezo25@gmail.com',
              ),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  size: 40.0,
                ),
              ),
            ),

            // this is the list show about function can user ued it
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => NotifacationPage()));
              },
              leading: CircleAvatar(
                child: Icon(
                  Icons.notifications,
                  size: 20,
                ),
              ),
              title: Text('Order notifications'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
              leading: CircleAvatar(
                child: Icon(
                  Icons.history,
                  size: 20,
                ),
              ),
              title: Text('Order history'),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfilePage()));
              },
              leading: CircleAvatar(
                child: Icon(
                  Icons.person,
                  size: 20,
                ),
              ),
              title: Text('Profile settings'),
            ),
            ListTile(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => DeliveryPage()));
              },
              leading: CircleAvatar(
                child: Icon(
                  Icons.home,
                  size: 20,
                ),
              ),
              title: Text('Delivery Address'),
            ),
            Divider(),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutPage()));
                },
                title: Text('About'),
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.help,
                    size: 20,
                  ),
                )),
            ListTile(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login_Logout()));
                },
                title: Text('Login'),
                trailing: CircleAvatar(
                  child: Icon(
                    Icons.exit_to_app,
                    size: 20,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
