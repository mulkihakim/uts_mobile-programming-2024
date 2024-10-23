import 'package:flutter/material.dart';
import 'package:linkaja_ui/widgets/image_carousel_widget.dart';
import '../widgets/bottom_navbar.dart'; // Import widget bottom_navbar

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; // Menyimpan index yang dipilih di navbar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
                color: Colors.white,
              ),
              child: Container( // Tambahkan Container untuk memberikan ukuran
                width: double.infinity, // Agar memenuhi lebar yang tersedia
                height: 100, // Atur tinggi sesuai kebutuhan
                child: Stack(
                  children: [
                    // Menambahkan gambar sebagai latar belakang
                    Positioned.fill(
                      child: Image.asset(
                        'assets/images/building.png', // Ganti dengan path gambar Anda
                        fit: BoxFit.cover, // Mengisi area dengan gambar
                        opacity: AlwaysStoppedAnimation(0.25),
                      ),
                    ),
                    // Menempatkan logo di atas gambar
                    Positioned(
                      left: 16, // Memberikan jarak dari sisi kiri
                      top: 40, // Jarak dari bagian atas
                      child: Image.asset(
                        'assets/images/linkaja_logo.png',
                        width: 40,
                        height: 40,
                      ),
                    ),
                    // Menempatkan ikon di sebelah kanan
                    Positioned(
                      right: 16, // Mengatur posisi di sebelah kanan
                      top: 50, // Jarak dari bagian atas
                      child: Row(
                        children: const [
                          Icon(Icons.favorite_border, color: Colors.black),
                          SizedBox(width: 10),
                          Icon(Icons.support_agent, color: Colors.black),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bagian balance yang dimodifikasi
            _buildBalanceSection(),
            const SizedBox(height: 10),
            // Quick Action Section
            _buildQuickActionSection(),
            SizedBox(height: 10),
            // Grid icon untuk fitur utama
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.count(
                shrinkWrap: true,
                crossAxisCount: 4,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _iconButton('Pulsa/Data', Icons.phone_android),
                  _iconButton('Electricity', Icons.flash_on),
                  _iconButton('Cable TV & Internet', Icons.tv),
                  _iconButton('Kartu Uang Elektronik', Icons.credit_card),
                  _iconButton('Mosque', Icons.mosque),
                  _iconButton('Church', Icons.church),
                  _iconButton('Infaq', Icons.volunteer_activism),
                  _iconButton('More', Icons.more_horiz),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Banner peduli anak yatim
            ImageCarouselWidget(),
            SizedBox(height: 10),
            // Best Deals
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Best Deals',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text('See All', style: TextStyle(color: Colors.red)),
                    ],
                  ),
                  SizedBox(height: 10),
                  _dealsList(),
                ],
              ),
            ),
            SizedBox(height: 10),
            // Latest Updates (Optional jika ditambahkan)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Latest Updates',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  _latestUpdatesList(),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  // Fungsi untuk membangun bagian balance yang telah dimodifikasi
  Widget _buildBalanceSection() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 224, 24, 24),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Row(children: [
            SizedBox(width: 5),
            Text('Hi, Mulki Hakim',
                style: TextStyle(fontSize: 12, color: Colors.white)),
          ]),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(child: _buildCard('Your Balance', 'Rp 69.696', Icons.arrow_forward)),
              SizedBox(width: 8),
              Expanded(child: _buildCardWithCoin('Bonus Balance', '888', Icons.arrow_forward)),
              SizedBox(width: 8),
              Expanded(child: _buildCard('MyPayLater', 'Apply Now', Icons.arrow_forward))
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard(String title, String balance, IconData icon) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 85, 75, 75))),
              SizedBox(height: 2),
              Text(balance, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ],
          ),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }

  // New function to build card with coin icon
  Widget _buildCardWithCoin(String title, String balance, IconData icon) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(color: Colors.grey.withOpacity(0.2), blurRadius: 5),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontSize: 10, color: Color.fromARGB(255, 85, 75, 75))),
              SizedBox(height: 2),
              Row(
                children: [
                  Icon(Icons.monetization_on, color: Color.fromARGB(255, 255, 217, 0), size: 16),
                  SizedBox(width: 4),
                  Text(balance, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: Colors.white, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildQuickActionSection() {
    return Container(
      padding: EdgeInsets.all(16), // Padding kiri dan kanan
      margin: const EdgeInsets.only(right: 8, left: 8, top: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2), // Subtle shadow
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Even space distribution
        children: [
          _buildAction(Icons.add, 'Top Up'),
          _buildAction(Icons.attach_money, 'Cash Out'),
          _buildAction(Icons.send, 'Send Money'),
          _buildAction(Icons.grid_view, 'See All'),
        ],
      ),
    );
  }

  Widget _buildAction(IconData icon, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, // Center the column content
      children: [
        Icon(icon, color: Colors.black, size: 24), // Change icon color to black
        SizedBox(height: 10), // Space between icon and label
        Text(
          label,
          style: TextStyle(
            fontSize: 10, // Slightly larger font size
            fontWeight: FontWeight.w500, // Medium font weight
          ),
        ),
      ],
    );
  }

  Widget _iconButton(String label, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, size: 30, color: Colors.red),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 10), textAlign: TextAlign.center,),
      ],
    );
  }

  Widget _dealsList() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Jumlah deals
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.only(right: 10),
            color: Colors.red[100],
            child: Center(child: Text('Deal $index')),
          );
        },
      ),
    );
  }

  Widget _latestUpdatesList() {
    return Container(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5, // Jumlah update
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: EdgeInsets.only(right: 10),
            color: Colors.blue[100],
            child: Center(child: Text('Update $index')),
          );
        },
      ),
    );
  }
}
