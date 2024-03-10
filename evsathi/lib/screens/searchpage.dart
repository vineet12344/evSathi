import 'package:ev_sarthi/screens/evstationsdata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  late List<EvStationData> evStationsList;
  late List<EvStationData> displayList;

  @override
  void initState() {
    super.initState();

    // Initialize evStationsList here
    evStationsList = [
      EvStationData("Station A", 8.5, 10.2, 4.3, "lib/assets/evstation.jpeg"),
      EvStationData("Station B", 7.9, 15.8, 4.1, "lib/assets/evstation.jpeg"),
      EvStationData("Station C", 9.2, 5.6, 4.5, "lib/assets/evstation.jpeg"),
      EvStationData("Station D", 6.8, 20.1, 3.9, "lib/assets/evstation.jpeg"),
      EvStationData("Station E", 8.1, 12.3, 4.0, "lib/assets/evstation.jpeg"),
      EvStationData("Station F", 7.5, 18.7, 4.2, "lib/assets/evstation.jpeg"),
      EvStationData("Station G", 9.0, 8.9, 4.4, "lib/assets/evstation.jpeg"),
      EvStationData("Station H", 8.3, 14.5, 4.6, "lib/assets/evstation.jpeg"),
      EvStationData("Station I", 7.2, 22.0, 3.7, "lib/assets/evstation.jpeg"),
      EvStationData("Station J", 9.5, 3.4, 4.8, "lib/assets/evstation.jpeg"),
      EvStationData("Station K", 8.7, 17.6, 4.4, "lib/assets/evstation.jpeg"),
      EvStationData("Station L", 7.4, 21.3, 4.1, "lib/assets/evstation.jpeg"),
      EvStationData("Station M", 9.1, 9.8, 4.5, "lib/assets/evstation.jpeg"),
      EvStationData("Station N", 6.9, 19.5, 3.8, "lib/assets/evstation.jpeg"),
      EvStationData("Station O", 8.0, 13.2, 4.2, "lib/assets/evstation.jpeg"),
      EvStationData("Station P", 7.6, 16.9, 4.0, "lib/assets/evstation.jpeg"),
      EvStationData("Station Q", 8.9, 11.1, 4.3, "lib/assets/evstation.jpeg"),
      EvStationData("Station R", 8.2, 18.3, 4.6, "lib/assets/evstation.jpeg"),
      EvStationData("Station S", 7.3, 23.4, 3.6, "lib/assets/evstation.jpeg"),
      EvStationData("Station T", 9.3, 6.7, 4.7, "lib/assets/evstation.jpeg"),
    ];
    // Initialize displayList here
    displayList = List.from(evStationsList);
  }

  void updateList(String value) {
    setState(() {
      displayList = evStationsList
          .where((element) =>
              element.StationName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0.0,
      ),
      body: Padding(
        padding: EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Search for EV-Stations ",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.green,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: BorderSide.none,
                ),
                hintText: "Ex: Tata charging station",
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: displayList.length,
              itemBuilder: (context, index) => ListTile(
                  title: Text(
                    displayList[index].StationName!,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  subtitle: Text(
                    '${displayList[index].StationDistance!} km',
                    style: TextStyle(),
                  ),
                  trailing: Text(
                    "${displayList[index].StationPrice}rs/15min",
                    style: TextStyle(
                      color: Colors.amber,
                      fontSize: 18.0,
                    ),
                  ),
                  leading: Image.network(
                    displayList[index].image!,
                    fit: BoxFit.cover,
                    width: 50.0,
                    height: 50.0,
                  )),
            ))
          ],
        ),
      ),
    );
  }
}
