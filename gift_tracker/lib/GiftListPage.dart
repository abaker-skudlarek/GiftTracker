import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'NavDrawer.dart';
import 'Gift.dart';
import 'AddGiftPage.dart';

class GiftListPage extends StatefulWidget
{
  @override
  _GiftListPage createState() => _GiftListPage();
}

class _GiftListPage extends State<GiftListPage>
{
  // -- Variables -- //

  List<Gift> gifts = []; //TODO this should be somewhere else. own class maybe?

  // -- Functions -- //
  _goToAddGiftPage()
  {
    Navigator.push(context, MaterialPageRoute(
      builder: (context) => new AddGiftPage()));
  }

  _buildGiftsList(index)
  {
    return new GestureDetector(
      onTap: ()
       {
         // TODO later on, ONLY the giftee should be able to tap the gift
         // TODO   and make updates it
         print("gift tapped");
       },
      child: Container(
        padding: EdgeInsets.only(left: 10.0, top: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    gifts[index].giftName,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                    gifts[index].giftDescription,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontStyle: FontStyle.italic
                    )
                  )
                ],
              )
            )
          ],
        )
      )
    );
  }

  // -- Main Widget Builder --//

  @override
  Widget build(BuildContext context) {
    // forces portrait usage of this page/widget
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => new AddGiftPage()))
        }
      ),

      appBar: AppBar(
        title: Text("Gift List") //TODO this should later be the name of the list
      ),

      drawer: NavDrawer(),

      body: Container(
        child: ListView.builder(
          itemBuilder: (context, index) => _buildGiftsList(index),
          itemCount: gifts.length,
        )
      )
    );
  }
}

