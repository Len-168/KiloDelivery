import 'package:flutter/material.dart';

class Profile {
  IconData? icons;
  String? label;
  Profile({
    required this.icons,
    required this.label,
  });
}

List<Profile> lstofProfile = [
  Profile(icons: Icons.person, label: "Profile"),
  Profile(icons: Icons.shopping_cart_checkout_outlined, label: "Orders"),
  Profile(icons: Icons.person, label: "Offer and promo"),
  Profile(icons: Icons.policy_rounded, label: "Privacy policy"),
  Profile(icons: Icons.security, label: "Security"),
];
