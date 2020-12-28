import 'package:flutter/material.dart';
import 'package:insideapp/models/shop.dart';
import 'package:insideapp/providers/supplier_provider.dart';
import 'package:provider/provider.dart';
import 'package:insideapp/screens/supplier/shop_details.dart';

class SupplierShopsWidget extends StatefulWidget {
  const SupplierShopsWidget({
    Key key,
  }) : super(key: key);

  @override
  _SupplierShopsWidgetState createState() => _SupplierShopsWidgetState();
}

class _SupplierShopsWidgetState extends State<SupplierShopsWidget> {
  List<Shop> fetchedShops = [];
  List<Widget> shopList = [];

  Future shopListFetched() async {
    String name = "shop name";
    String phone = "011111111";
    String address = "28 masjed el salam street";

    for (var i = 0; i < 4; i++) {
      Shop instance = Shop(name: name, address: address, mobile: phone);
      fetchedShops.add(instance);
    }
  }

  /*shopListBuilder() {
    fetchedShops.forEach((element) {
      Widget shopWidget = GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return ShopDetails(
                  currentShop: element,
                );
              },
            ),
          );
        },
        child: ListTile(
          title: Text('${element.name}'),
          leading: Icon(Icons.store),
          subtitle: Text('${element.address} , ${element.mobile}'),
        ),
      );
      shopList.add(shopWidget);
      shopList.add(Divider(
        thickness: 3,
      ));
    });
  }*/

  @override
  void initState() {
    //shopListFetched();
    //shopListBuilder();
    Provider.of<SupplierProvider>(context,listen: false).get_suppliers().then((value) => null);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Consumer<SupplierProvider>(
          builder: (ctx, data, child) =>
         data.wait_get_suppliers?Center(child: CircularProgressIndicator(backgroundColor: Colors.blue,),): Padding(
            padding: const EdgeInsets.only(bottom: 100.0),
            child: ListView.builder(
                itemCount: data.suppliers.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,

                itemBuilder: (BuildContext ctxt, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ShopDetails(
                              currentShop: data.suppliers[index],
                            );
                          },
                        ),
                      );
                    },
                    child: ListTile(
                      title: Text('${data.suppliers[index].name}'),
                      leading: Icon(Icons.store),
                      subtitle: Text('${data.suppliers[index].bio} , ${data.suppliers[index].mobile}'),
                    ),
                  );
                }







            )

/*            [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ShopDetails();
                        },
                      ),
                    );

                  },
                  child: ListTile(
                    title: Text('Shop Name'),
                    leading: Icon(Icons.store),
                    subtitle: Text('18 the great av. , 012012312424'),
                    trailing: Column(
                      children: [
                        Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        Icon(
                          Icons.edit,
                          color: Colors.blue,
                        ),
                      ],
                    ),
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('Shop Name'),
                  leading: Icon(Icons.store),
                  subtitle: Text('18 the great av. , 012012312424'),
                  trailing: Column(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('Shop Name'),
                  leading: Icon(Icons.store),
                  subtitle: Text('18 the great av. , 012012312424'),
                  trailing: Column(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('Shop Name'),
                  leading: Icon(Icons.store),
                  subtitle: Text('18 the great av. , 012012312424'),
                  trailing: Column(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('Shop Name'),
                  leading: Icon(Icons.store),
                  subtitle: Text('18 the great av. , 012012312424'),
                  trailing: Column(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('Shop Name'),
                  leading: Icon(Icons.store),
                  subtitle: Text('18 the great av. , 012012312424'),
                  trailing: Column(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10,
                ),
                ListTile(
                  title: Text('Shop Name'),
                  leading: Icon(Icons.store),
                  subtitle: Text('18 the great av. , 012012312424'),
                  trailing: Column(
                    children: [
                      Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                      Icon(
                        Icons.edit,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 3,
                ),
                SizedBox(
                  height: 10,
                ),
              ],*/
            ),
          ),


    );
  }
}
