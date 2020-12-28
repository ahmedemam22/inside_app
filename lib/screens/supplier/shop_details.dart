import 'package:flutter/material.dart';
import 'package:insideapp/models/Item.dart';
import 'package:insideapp/models/login_supplier_response.dart';
import 'package:insideapp/models/shop.dart';

class ShopDetails extends StatefulWidget {
  final LoginSupplierResponse currentShop;

  ShopDetails({Key key, @required this.currentShop}) : super(key: key);

  @override
  _ShopDetailsState createState() => _ShopDetailsState();
}

class _ShopDetailsState extends State<ShopDetails> {
  List<Item> fetchedItems = [];
  List<Widget> itemList = [];

  Future fetchItems() async {
    String name = "Item Name";
    String desc = "This is a great item , and you can use it anywhere any time";
    String estimatedPrice = '40';
    String image = 'assets/sofa3.jpg';

    for (var i = 0; i < 4; i++) {
      Item instance = Item(
          name: name, desc: desc, estimatedPrice: estimatedPrice, image: image);
      fetchedItems.add(instance);
    }
  }

  itemListBuilder(BuildContext context) {
    fetchedItems.forEach((element) {
      Widget shopWidget = Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset('${element.image}'),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      '${element.name}',
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.edit,
                      color: Colors.grey,
                      size: 15,
                    ),
                    Icon(
                      Icons.delete,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ],
                ),
                Divider()
              ],
            ),
            isThreeLine: true,
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${element.desc}',
                  style: TextStyle(fontSize: 12),
                ),
                Divider(
                  color: Colors.orangeAccent,
                  thickness: 2,
                ),
                Row(
                  children: [
                    Icon(Icons.attach_money),
                    Text(
                      '${element.estimatedPrice} EGP',
                      style: TextStyle(fontSize: 12),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );
      itemList.add(shopWidget);
    });
  }

  @override
  void initState() {
    fetchItems();
    itemListBuilder(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orangeAccent,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('${widget.currentShop.name}'),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage('assets/mock/decor.png'),
                  radius: 30,
                ),
                Text(
                  '${widget.currentShop.name}',
                  style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.09),
                ),
                SizedBox(width: 50),
                Icon(
                  Icons.edit,
                  color: Colors.black,
                )
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.orangeAccent,
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.store_outlined,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('${widget.currentShop.bio}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.phone,
                          color: Colors.orangeAccent,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text('${widget.currentShop.mobile}'),
                      ],
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'Published',
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: MediaQuery.of(context).size.width * 0.03),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: Text(
                        'Click to un-publish',
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.02),
                      ),
                    )
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 2,
              color: Colors.orangeAccent.withOpacity(0.3),
              height: 20,
            ),
            Flexible(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: itemList,
              ),
            ))
          ],
        ),
      ),
    );
  }
}
