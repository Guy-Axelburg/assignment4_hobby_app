import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const HomePage(), routes: <String, WidgetBuilder>{
    "/HomePage": (BuildContext context) => const HomePage(),
    "/createNew": (BuildContext context) => const createNew(),
    "/editExisting": (BuildContext context) => const editExisting(),
    "/repository": (BuildContext context) => const repository(),
  }));
}

//first page
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("D&D Magic Item Creator"),
            backgroundColor: Colors.red),
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("images/d20.jpg"), fit: BoxFit.contain),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: ListView(
              children: [
                Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                      const Text("\nMain Menu",
                          style: TextStyle(fontSize: 24.0)),
                      const Divider(
                          height: 20, thickness: 1, color: Colors.blue),
                      IconButton(
                          icon: const Icon(Icons.add, color: Colors.red),
                          iconSize: 70,
                          onPressed: () {
                            Navigator.of(context).pushNamed("/createNew");
                          }),
                      const Text("Create New Item"),
                      IconButton(
                          icon: const Icon(Icons.edit, color: Colors.yellow),
                          iconSize: 70,
                          onPressed: () {
                            Navigator.of(context).pushNamed("/editExisting");
                          }),
                      const Text("Edit Existing Item"),
                      IconButton(
                          icon: const Icon(Icons.folder,
                              color: Colors.orangeAccent),
                          iconSize: 70,
                          onPressed: () {
                            Navigator.of(context).pushNamed("/repository");
                          }),
                      const Text("Item Repository"),
                    ]))
              ],
            )));
  }
}

//return a widget to make formatting easier
class newItem extends State {
  String itemName = "";
  String itemRarity = "";
  String itemType = "";
  String itemAttunement = "";
  String itemCost = "";
  String itemText = "";

  newItem(this.itemName, this.itemRarity, this.itemType, this.itemAttunement,
      this.itemCost, this.itemText);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}

//2nd page
class createNew extends StatefulWidget {
  const createNew({Key? key}) : super(key: key);

  @override
  _createNew createState() => _createNew();
}

//THIS MIGHT NEED TO BE IN A DIFFERENT CLASS??
//IDK MIGHT BE BETTER OUT HERE ON IT'S OWN
class _createNew extends State<createNew> {
  static TextEditingController controller1 = TextEditingController();
  static TextEditingController controller2 = TextEditingController();
  static TextEditingController controller3 = TextEditingController();
  static TextEditingController controller4 = TextEditingController();
  static TextEditingController controller5 = TextEditingController();
  static TextEditingController controller6 = TextEditingController();

  Set<newItem> _submit() {
    newItem newSubmisson = new newItem(controller1.text, controller2.text,
        controller3.text, controller4.text, controller5.text, controller6.text);

    //FIGURE OUT HOW TO RETURN AN OBJECT HOW YOU WANT IT TO
    return {newSubmisson};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Create a new Item")),
      body: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("images/pennquill.jpg"), fit: BoxFit.cover),
          ),
          padding: EdgeInsets.all(20.0),
          child: Column(children: [
            Expanded(child: entry1),
            Expanded(child: entry2),
            Expanded(child: entry3),
            Expanded(child: entry4),
            Expanded(child: entry5),
            Expanded(child: entry6),
          ])),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(height: 50.0),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() {
          _submit();
          FocusManager.instance.primaryFocus?.unfocus();
        }),
        tooltip: 'Submit button',
        child: const Icon(Icons.subdirectory_arrow_right_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget entry1 = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Text("Item Name:"),
      Container(
          width: 150.0,
          height: 60.0,
          padding: EdgeInsets.all(5.0),
          child: TextField(
            maxLines: 8, //or null
            decoration: InputDecoration.collapsed(
                border: OutlineInputBorder(), hintText: "Enter your text here"),
            controller: controller1,
            keyboardType: TextInputType.text,
          ))
    ],
  );

//1st text entry field

  Widget entry2 = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Text("Item Rarity:"),
      Container(
          width: 150.0,
          height: 60.0,
          padding: EdgeInsets.all(5.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Rarity ",
            ),
            controller: controller2,
            keyboardType: TextInputType.text,
          ))
    ],
  );

//2nd text entry field

  Widget entry3 = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Text("Item Type:"),
      Container(
          width: 150.0,
          height: 60.0,
          padding: EdgeInsets.all(5.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Type ",
            ),
            controller: controller3,
            keyboardType: TextInputType.text,
          ))
    ],
  );

//3rd text entry field

  Widget entry4 = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Text("Item Attunement:"),
      Container(
          width: 150.0,
          height: 60.0,
          padding: EdgeInsets.all(5.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "name ",
            ),
            controller: controller4,
            keyboardType: TextInputType.text,
          ))
    ],
  );

//4ths text entry field

  Widget entry5 = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Text("Item Cost:"),
      Container(
          width: 150.0,
          height: 60.0,
          padding: EdgeInsets.all(5.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Cost ",
            ),
            controller: controller5,
            keyboardType: TextInputType.text,
          ))
    ],
  );

//5th text entry field

  Widget entry6 = Row(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      Text("Item Text:"),
      Container(
          width: 150.0,
          height: 60.0,
          padding: EdgeInsets.all(5.0),
          child: TextField(
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "rules go here ",
            ),
            controller: controller6,
            keyboardType: TextInputType.text,
          ))
    ],
  );

//6th text entry field

  void dispose() {
    controller1.dispose();
    controller2.dispose();
    controller3.dispose();
    controller4.dispose();
    controller5.dispose();
    controller6.dispose();
  }
}

//MAKE EDIT PAGE

//3rd page
class editExisting extends StatefulWidget {
  const editExisting({Key? key}) : super(key: key);

  @override
  _editExisting createState() => _editExisting();
}

//THIS MIGHT NEED TO BE IN A DIFFERENT CLASS??
//IDK MIGHT BE BETTER OUT HERE ON IT'S OWN
class _editExisting extends State<editExisting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Edit Existing Item")),
        body: ListView(
          children: [
            Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    image: DecorationImage(
                        image: AssetImage("images/construction.jpg"),
                        fit: BoxFit.fitHeight)),
                padding: EdgeInsets.all(20.0),
                child: Column(children: [
                  Text("Under Construction!"),
                ]))
          ],
        ));
  }
}

//MAKE REPOSITORY PAGE

//4th page
class repository extends StatefulWidget {
  const repository({Key? key}) : super(key: key);

  @override
  _repository createState() => _repository();
}

//THIS MIGHT NEED TO BE IN A DIFFERENT CLASS??
//IDK MIGHT BE BETTER OUT HERE ON IT'S OWN
class _repository extends State<repository> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Repository")),
        body: Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("images/scroll.jpg"),
                    fit: BoxFit.fitWidth)),
            padding: EdgeInsets.all(20.0),
            child: ListView(children: [
              Column(
                children: [const Text("Under Construction")],
              )
            ])));
  }
}
