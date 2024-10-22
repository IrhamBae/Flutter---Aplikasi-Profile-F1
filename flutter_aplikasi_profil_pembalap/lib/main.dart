import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'F1 Drivers Profile',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        useMaterial3: true,
      ),
      home: DriverListPage(),
    );
  }
}

class Driver {
  final String name;
  final String team;
  final int championships;
  final String imageUrl;
  final String country;

  Driver({
    required this.name,
    required this.team,
    required this.championships,
    required this.imageUrl,
    required this.country,
  });
}

class DriverListPage extends StatelessWidget {
  final List<Driver> drivers = [
    Driver(
      name: "Lewis Hamilton",
      team: "Mercedes",
      championships: 7,
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Lewis_Hamilton_2016_Malaysia_2.jpg/330px-Lewis_Hamilton_2016_Malaysia_2.jpg",
      country: "United Kingdom",
    ),
    Driver(
      name: "Max Verstappen",
      team: "Red Bull Racing",
      championships: 3,
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/ba/Max_Verstappen_2017_Malaysia_3.jpg/330px-Max_Verstappen_2017_Malaysia_3.jpg",      
      country: "Netherlands",
    ),
    Driver(
      name: "Charles Leclerc",
      team: "Ferrari",
      championships: 0,
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/9/9e/Charles_Leclerc_2019_Singapore.jpg/330px-Charles_Leclerc_2019_Singapore.jpg",      
      country: "Monaco",
    ),
    Driver(
      name: "Sebastian Vettel",
      team: "Aston Martin",
      championships: 4,
      imageUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Sebastian_Vettel_2015_Malaysia_podium_2.jpg/330px-Sebastian_Vettel_2015_Malaysia_podium_2.jpg",
      country: "Germany",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('F1 Drivers'),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: drivers.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(drivers[index].imageUrl),
              ),
              title: Text(drivers[index].name),
              subtitle: Text(drivers[index].team),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DriverDetailPage(driver: drivers[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DriverDetailPage extends StatelessWidget {
  final Driver driver;

  DriverDetailPage({required this.driver});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(driver.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundImage: NetworkImage(driver.imageUrl),
                radius: 80,
              ),
            ),
            SizedBox(height: 16),
            Text(
              driver.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Team: ${driver.team}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Country: ${driver.country}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'World Championships: ${driver.championships}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
