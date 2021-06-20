import 'package:flutter/material.dart';
import 'package:organic_basket/constant.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kPrimaryColor,
        title: Text('Cart'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              height: mq.height * 0.6,
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (ctx, index) => Container(
                    margin: EdgeInsets.all(5),
                    child: ListTile(
                      leading: Container(
                        color: Colors.grey,
                        height: 200,
                        width: 100,
                        child: Image.network(
                          'https://static.libertyprim.com/files/familles/fraise-large.jpg?1569271765',
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text('Strawberry'),
                      subtitle: Text('\$17.00/kg'),
                      trailing: Column(
                        children: [
                          Icon(Icons.add),
                          Icon(Icons.add),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: mq.height * 0.15,
              // color: Colors.redAccent,
              color: kPrimaryColor.withOpacity(0.2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Total: \$28.60',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(primary: kPrimaryColor),
                      onPressed: () {},
                      child: Text(
                        'Checkout >',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
