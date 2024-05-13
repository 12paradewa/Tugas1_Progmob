import 'package:flutter/material.dart';
import 'TradeMenu.dart';
import 'MarketsMenu.dart';
import 'PerformanceMenu.dart';
import 'ProfileMenu.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State with SingleTickerProviderStateMixin {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    // Navigasi ke layar yang sesuai saat ikon di BottomNavigationBar diklik
    switch (_selectedIndex) {
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => TradeMenu()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MarketsMenu()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PerformanceMenu()),
        );
        break;
      case 4:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileMenu()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // Hilangkan tombol back di samping teks Accounts
        title: Text(
          'Accounts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: Icon(Icons.notifications), // Ganti ikon menjadi alarm dan lonceng
              onPressed: () {
                // Tambahkan aksi untuk tombol ikon alarm dan lonceng di sini
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30), // Mengatur padding horizontal
            decoration: BoxDecoration(
              color: Colors.grey[200], // Ubah warna background
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    Text(
                      '#1234567890',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 1),
                Divider(),
                SizedBox(height: 1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'Real  MT5  Standard',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            shadows: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 4,
                                offset:
                                    Offset(0, 2), // changes position of shadow
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Text(
                  '50.10 USD',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildMenuButton(Icons.add_circle, 'Deposit', Colors.green),
                    _buildMenuButton(Icons.remove_circle, 'Withdraw', Colors.red),
                    _buildMenuButton(Icons.history, 'History', Colors.blue),
                    _buildMenuButton(Icons.details, 'Details', Colors.orange),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 0, 0, 0), // warna ikon dan teks yang dipilih
        unselectedItemColor: Colors.grey, // warna ikon dan teks yang tidak dipilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), // Ubah ikon menjadi kotak-kotak
            label: 'Accounts',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.candlestick_chart_rounded), // Ubah ikon menjadi candlestick
            label: 'Trade',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public), // Ubah ikon menjadi bumi dengan garis
            label: 'Markets',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.insert_chart),
            label: 'Performance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(IconData icon, String label, Color iconColor) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: iconColor,
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 5),
        Text(
          label,
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
