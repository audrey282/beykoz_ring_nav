import 'package:flutter/material.dart';

class BusList extends StatefulWidget {
  const BusList({super.key});

  @override
  _BusListState createState() => _BusListState();
}

class _BusListState extends State<BusList> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, String>> allBuses = [
    {'number': '15ŞN', 'place': 'Şehit İsmail Kefal -Üsküdar Camii Önü'},
    {'number': '15M', 'place': 'Yeni Camii -Mahur Sokak'},
    {'number': '135A', 'place': 'Kavacik Aktarma-Acarkent E Kapis'},
    {'number': '135K', 'place': 'Korubaşi Camii -Yeni Camii'},
    {'number': '14M', 'place': 'Yeni Camii -Kadiköy'},
    {'number': '15A', 'place': 'Anadolu Kavaği -Kavacik Aktarma'},
    {'number': '15BK', 'place': 'Sultaniye -Kadiköy'},
    {'number': '15E', 'place': 'Siteler -Üsküdar Camii Önü'},
    {'number': '15KÇ', 'place': 'Üsküdar Camii Önü-Fazilet Camii'},
    {'number': '15SD', 'place': 'Bayraktar Bulvari -Şahinkaya Garaji'},
    {'number': '15TY', 'place': 'Ümraniye Eğitim Ve Araştirma Hastanesi -Tokatköy'},
    {'number': '20', 'place': 'Dereseki -Ümraniye Eğitim Ve Araştirma Hastanesi'},
    {'number': '121A', 'place': ' Mecidiyeköy Mezarlik -Türk Alman Üniversitesi'},
    {'number': '121B', 'place': 'Kavacik Aktarma-Dutdere'},
    {'number': '135T', 'place': 'Gölbahçe -Tokatköy'},
    {'number': '11ÇB', 'place': 'Kavacik Aktarma-Elmalikent'},
    {'number': '15TA', 'place': 'Kavacik Aktarma-Türk Alman Üniversitesi'},
    {'number': '15ÇB', 'place': 'Kavacik Aktarma-Kavacik Aktarma'},
    {'number': 'GÖKSU MAHALLESI', 'place': 'Tokatköy - Göksu Mahallesi'},
    {'number': 'HEKIMBAŞI ', 'place': 'Çavuşbaşı - Hekimbaşı'},
  ];

  List<Map<String, String>> filteredBuses = [];

  @override
  void initState() {
    super.initState();
    filteredBuses = allBuses;
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      filteredBuses = allBuses.where((bus) {
        final number = bus['number']!.toLowerCase();
        final place = bus['place']!.toLowerCase();
        return number.contains(query) || place.contains(query);
      }).toList();
    });
  }


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bus Route List')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                  fillColor: Colors.grey,
                  hintText: "Search...",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Colors.black26,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    size: 30,
                    color: Colors.black26,
                  )),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredBuses.length,
              itemBuilder: (context, index) {
                final bus = filteredBuses[index];
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  color: Color.fromARGB(255, 74, 13, 13),
                  child: ListTile(
                    title: Text(
                      bus['number']!,
                      style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white) ,
                    ),
                    subtitle: Text(bus['place']!,
                    style: TextStyle(color: Colors.white),),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
