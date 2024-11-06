import 'package:flutter/material.dart';

void main() => runApp(BarberApp());

class BarberApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarberHomePage(),
    );
  }
}

class BarberHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.location_pin, color: Colors.grey[600]),
            SizedBox(width: 8),
            Text("Ciocana",
                style: TextStyle(color: Colors.black, fontSize: 16)),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundImage: AssetImage("asset/fotop.png"),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Ropot Vladislav",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            _bookingCard(),
            SizedBox(height: 16),
            _searchSection(),
            SizedBox(height: 16),
            Text("Nearest Barbershop",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Expanded(child: _buildBarbershopList()),
          ],
        ),
      ),
    );
  }

  Widget _bookingCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Booking Now",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 10),
                IconButton(
                  icon: Icon(Icons.shopping_cart, color: Colors.orange),
                  onPressed: () {},
                  color: Colors.white,
                  iconSize: 30,
                  padding: EdgeInsets.all(8),
                ),
              ],
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(120), bottomRight: Radius.circular(16)),
              child: Image.asset("asset/photo1.png", scale: 2, fit: BoxFit.cover),
            ),
          ),
        ],
      ),
    );
  }

  Widget _searchSection() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search barber's, haircut services...",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 16),
            ),
          ),
        ),
        SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: IconButton(
            icon: Icon(Icons.filter_list, color: Colors.grey[600]),
            onPressed: () {},
          ),
        ),
      ],
    );
  }

  Widget _buildBarbershopList() {
    final barbershops = [
      Barbershop(
          title: "Alana Barbershop – Haircut massage & Spa",
          distance: "Banguntapan (5km)",
          rating: 4.5,
          imageUrl: "asset/foto3.jpeg"),
      Barbershop(
          title: "Hercha Barbershop – Haircut & Styling",
          distance: "Jalan Kaliurang (8km)",
          rating: 5.0,
          imageUrl: "asset/foto4.jpeg"),
      Barbershop(
          title: "Barberking – Haircut styling & massage",
          distance: "Jogia Expo Centre (12km)",
          rating: 4.5,
          imageUrl: "asset/foto5.jpeg"),
    ];

    return ListView.builder(
      itemCount: barbershops.length,
      itemBuilder: (context, index) {
        return BarbershopCard(barbershop: barbershops[index]);
      },
    );
  }
}

class Barbershop {
  final String title;
  final String distance;
  final double rating;
  final String imageUrl;

  Barbershop(
      {required this.title,
      required this.distance,
      required this.rating,
      required this.imageUrl});
}

class BarbershopCard extends StatelessWidget {
  final Barbershop barbershop;

  BarbershopCard({required this.barbershop});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(barbershop.imageUrl),
          radius: 30,
        ),
        title: Text(barbershop.title,
            style: TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(barbershop.distance),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.star, color: Colors.amber),
            Text(barbershop.rating.toString(),
                style: TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
