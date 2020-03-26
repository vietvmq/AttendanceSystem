import 'package:flutter/material.dart';


class CustomTab extends StatefulWidget {

  final Function(int) tabSelected;
  final List<String> items;

  const CustomTab({Key key, this.tabSelected, this.items}) : super(key: key);

  @override
  _CustomTabState createState() => _CustomTabState();
}

class _CustomTabState extends State<CustomTab> {
  var categorySelected = 0;

  @override
  Widget build(BuildContext context) {
    return _getListCategory();
  }

  Widget _getListCategory(){

    ListView listCategory = new ListView.builder(
        itemCount: widget.items.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index){
          return _buildCategoryItem(index);
        }
    );

    return new Container(
      height: 50.0,
      child: listCategory,
      color: Colors.grey[200].withAlpha(200),
    );

  }

  Widget _buildCategoryItem(index){

    return new InkWell(
      onTap: (){
        setSelectedItem(index);
        print("click");
      },
      child: new Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Container(
            margin: new EdgeInsets.only(left: 10.0),
            child: new Material(
              elevation: 2.0,
              color: categorySelected == index ? Colors.black : Colors.grey,
              borderRadius: const BorderRadius.all(const Radius.circular(25.0)),
              child:  new Container(
                padding: new EdgeInsets.only(left: 12.0,top: 7.0,bottom: 7.0,right: 12.0),
                child: new Text(widget.items[index],
                  style: new TextStyle(
                      color: categorySelected == index ? Colors.white : Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );

  }

  void setSelectedItem(index) {

    if(index != categorySelected) {
      widget.tabSelected(index);
      setState(() {
        categorySelected = index;
      });
    }
  }
}