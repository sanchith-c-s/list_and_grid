import 'package:flutter/material.dart';

void main() {
  runApp(const ListDemo());
}

class ListDemo extends StatelessWidget {
  const ListDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blue,
              title: Text(
                'List and Grid',
                style: TextStyle(color: Colors.white),
              ),
              bottom: TabBar(
                tabs: const [
                  Tab(
                    text: 'Vertical',
                  ),
                  Tab(
                    text: 'Horizontal',
                  ),
                  Tab(
                    text: 'Grid',
                  ),
                  Tab(
                    text: 'Mix',
                  ),
                ],
              ),
            ),
            body: TabBarView(
              children:  [
                Center(
                  child: ListVertical(),
                ),
                Center(
                  child: Horizontal(),
                ),
                Center(
                  child: Grid(),
                ),
                Center(
                  child: MixList(getListItems(20)),
                ),
              ],
            )),
      ),
    );
  }
}

class ListVertical extends StatelessWidget {
  const ListVertical({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.map),
          title: Text('Map'),
          onTap: () {},
        ),
        ListTile(
          leading: Icon(Icons.photo_album),
          title: Text('Album'),
          subtitle: Text('new album'),
          onTap: () {},
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 40,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.amber,
            ),
            child: Center(
              child: Text(
                'Container',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Horizontal extends StatelessWidget {
  
List<Color>color=[
  Colors.black,
   Color.fromARGB(255, 220, 39, 39),
  Color.fromARGB(255, 32, 172, 69),
  Color.fromARGB(255, 71, 15, 213),
  Colors.amber,

];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 100),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
        for (int i = 0; i < 18; i++)
          Container(
            color: color[i%5],
            height: 100,
            width: 100,
            margin: EdgeInsets.all(10),
          ),
      ],
      ),
    );
  }
}

class Grid extends StatelessWidget {

List<Color>color=[
  Colors.black,
   Color.fromARGB(255, 220, 39, 39),
  Color.fromARGB(255, 32, 172, 69),
  Color.fromARGB(255, 71, 15, 213),
  Colors.amber

];

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      scrollDirection: Axis.vertical,
      children: [
        for (int i = 0; i < 18; i++)
          Container(
            color: color[i%5],
            height: 100,
            width: 100,
            margin: EdgeInsets.all(10),
            child: Text('Item $i',
            style: TextStyle(color: Colors.white),),
          ),
      ],
    );
  }
}

abstract class ListItem{}

class HeadingItem extends ListItem{
  final String heading;
  HeadingItem(this.heading);
}

class MessageItem extends ListItem{
  final String sender;
  final String body;

  MessageItem(this.sender,this.body);
}

List<ListItem>getListItems(int length){
  return List<ListItem>.generate(length,(i){
    return i%6 == 0
    ?HeadingItem('Heading $i')
    :MessageItem('Sender $i','Meassage Body $i');
  });
}
class MixList extends StatelessWidget {
  final List<ListItem>items;
  MixList(this.items);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemCount: items.length, itemBuilder: (context, index){
      final item=items[index];
      if(item is HeadingItem){
        return ListTile(
          title: Text(
            item.heading,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        );
      }
      else if(item is MessageItem){
        return ListTile(
          title: Text(item.sender),
          subtitle: Text(item.body),
        );
      }
    });
  }
}