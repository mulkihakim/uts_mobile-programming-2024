import 'package:flutter/material.dart';
import 'package:linkaja_ui/widgets/bottom_navbar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _selectedIndex = 4; // Index for Bottom Navigation Bar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          _buildProfileHeader(),
          Divider(thickness: 10, color: Colors.grey[300]), // Garis pemisah
          _buildProfileMenuItem('Account Type', 'FULL SERVICE', true),
          _buildProfileMenuItem('Account Settings', '', true),
          _buildProfileMenuItem('LinkAja Syariah', 'Not Active', true),
          _buildProfileMenuItem('Payment Method', '', true),
          Divider(thickness: 10, color: Colors.grey[300]), // Garis pemisah
          _buildProfileMenuItem('Email', 'mulki@gmail.com', true),
          _buildProfileMenuItem('Security Question', 'Set', true),
          _buildProfileMenuItem('PIN Settings', '', true),
          _buildProfileMenuItem('Language', 'English', true),
          Divider(thickness: 10, color: Colors.grey[300]), // Garis pemisah
          _buildProfileMenuItem('Terms of Service', '', true),
          _buildProfileMenuItem('Privacy Policy', '', true),
          _buildProfileMenuItem('Help Center', '', true),
        ],
      ),
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between items
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Mulki Hakim',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 4),
                Text(
                  '2241720131',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          SizedBox(width: 16), // Space between text and avatar
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/pp.jpg'),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileMenuItem(String title, String value, bool showArrow) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value.isNotEmpty)
            Text(
              value,
              style: TextStyle(color: Colors.grey),
            ),
          if (showArrow)
            Icon(Icons.chevron_right, color: Colors.red)
          else
            SizedBox(width: 24),
        ],
      ),
      onTap: () {
        // Handle menu item tap
      },
    );
  }
}
