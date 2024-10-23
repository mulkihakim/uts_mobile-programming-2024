import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            children: [
              _buildCategoryItem(Icons.phone_android, 'Pulsa/Data'),
              _buildCategoryItem(Icons.electrical_services, 'Listrik'),
              _buildCategoryItem(Icons.tv, 'TV Kabel & Internet'),
              _buildCategoryItem(Icons.credit_card, 'Kartu Uang Elektronik'),
              _buildCategoryItem(Icons.mosque, 'Masjid'),
              _buildCategoryItem(Icons.church, 'Gereja'),
              _buildCategoryItem(Icons.card_giftcard, 'Infaq'),
              _buildCategoryItem(Icons.more_horiz, 'Semua'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.red[100],
          child: Icon(icon, color: Colors.red),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}
