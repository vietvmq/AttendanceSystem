import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:matrix_gesture_detector/matrix_gesture_detector.dart';
// import 'package:zoom_widget/zoom_widget.dart';



class SeatScreen extends StatefulWidget {
  @override
  _SeatScreenState createState() => _SeatScreenState();
}

class _SeatScreenState extends State<SeatScreen> {
  final rowController = TextEditingController();
  final colController = TextEditingController();
  bool isLoaded = false;
  int rowNum = 4, colNum = 4;

  List<List<Seat>> diagram = [];

  @override
  initState() {
    super.initState();
    rowController.text = "4";
    colController.text = "4";
  }
  @override
  void dispose() {
    super.dispose();
    rowController.dispose();
    colController.dispose();
  }

  Widget generateRowWidget(int iRow, int col) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(col, (iCol){
        return seatContainer(Seat(colPos: iCol, rowPos: iRow));
      }),
    );
  }

  Widget generateDiagramWidget(int row, int col) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List<Widget>.generate(row, (iRow){
        return generateRowWidget(iRow, col);
      }),
    );
  }


  void generateDiagram(int row, int col) {
    // must initialize size of 2D array before add value
    diagram = List.generate(rowNum, (iRow) => new List(colNum));
    for (int iRow = 0; iRow < row; iRow++) {
      for (int iCol = 0; iCol < col; iCol++) {
        diagram[iRow][iCol] = new Seat(rowPos: iRow, colPos: iCol);
      }
    }
  }

  Widget seatContainer(Seat seat) {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 50,
        margin: const EdgeInsets.all(0.5),
//        alignment: Alignment.center,
//        child: Text("$index"),
        decoration: BoxDecoration(
          color: !seat.status ? Colors.grey[300] : Colors.redAccent,
        ),
      ),
      onTap: () {
        setState(() {
          seat.status = !seat.status;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 125,
            margin: const EdgeInsets.only(bottom: 5.0),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 5,
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: rowController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Row",
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 2 - 5,
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: colController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Col",
                        ),
                      ),
                    ),
                  ],
                ),
                RaisedButton(
                  child: Text(
                    "Generate",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.blue.shade900,
                  onPressed: () {
                    setState(() {
                      isLoaded = true;
                      diagram.clear();
                      rowNum = int.tryParse(rowController.text) ?? 4;
                      colNum = int.tryParse(colController.text) ?? 4;
                      generateDiagram(rowNum, colNum);
                    });
                  },
                ),
              ],
            ),
          ),

//          Flexible(
//            child: ClipRect(
//              child: PhotoView.customChild(
//                minScale: 0.25,
//                maxScale: 10.0,
//                customSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height - 281),
//                childSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height - 281),
//                backgroundDecoration: BoxDecoration(color: Colors.transparent),
//                child: generateDiagramWidget(rowNum, colNum)),
//            ),
//          ),

          Flexible(
            child: ClipRect(
              child: PhotoView.customChild(
                minScale: 0.25,
                maxScale: 20.0,
                customSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height - 281),
                childSize: Size(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height - 281),
                backgroundDecoration: BoxDecoration(color: Colors.white),
                child: GridView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: ClampingScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: colNum,
                    childAspectRatio: 1,
                  ),
                  itemCount: rowNum * colNum,
                  itemBuilder: (context, index) {
                    if (isLoaded && index <= (rowNum * colNum)) {
                      int x = ((index) ~/ colNum);
                      int y = ((index) % colNum);
                      return seatContainer(diagram[x][y]);
                    } else {
                      isLoaded = false;
                      return null;
                    }
                  },
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}

class Seat {
  int rowPos;
  int colPos;
  bool status; // true: used // false: empty

  Seat({this.rowPos, this.colPos, this.status = false});
}
