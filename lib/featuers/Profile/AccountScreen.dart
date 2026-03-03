import 'package:flutter/material.dart';
import 'package:greenmart/core/utils/colors.dart';

import '../auth/pages/LoginScreen.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Row(
              children: [
                const CircleAvatar(
                  radius: 30,
                  backgroundImage: AssetImage("assets/images/profile.png"),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Dina Ebrahem",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      "dina@email.com",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                )
              ],
            ),

            const SizedBox(height: 30),
            const Divider(color: AppColors.borderColor),

            /// MENU ITEMS
            _buildMenuItem(Icons.shopping_bag_outlined, "Orders"),
            _divider(),

            _buildMenuItem(Icons.person_outline, "My Details"),
            _divider(),

            _buildMenuItem(Icons.location_on_outlined, "Delivery Address"),
            _divider(),

            _buildMenuItem(Icons.credit_card_outlined, "Payment Methods"),
            _divider(),

            _buildMenuItem(Icons.local_offer_outlined, "Promo Code"),
            _divider(),

            _buildMenuItem(Icons.notifications_none, "Notifications"),
            _divider(),

            _buildMenuItem(Icons.help_outline, "Help"),
            _divider(),

            _buildMenuItem(Icons.info_outline, "About"),

            const SizedBox(height: 30),

            /// LOGOUT BUTTON
            SizedBox(
              width: double.infinity,
              height: 55,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: AppColors.primaryColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const LoginScreen(),
                    ),
                        (route) => false,
                  );
                },
                child: Text(
                  "Log Out",
                  style: TextStyle(
                    color: AppColors.primaryColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  /// Menu Item Widget
  static Widget _buildMenuItem(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 22,
                color: Colors.grey.shade700,
              ),
              const SizedBox(width: 15),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Colors.grey,
          ),
        ],
      ),
    );
  }

  /// Divider with spacing
  static Widget _divider() {
    return const Divider(
      color: AppColors.borderColor,
      height: 1,
    );
  }
}