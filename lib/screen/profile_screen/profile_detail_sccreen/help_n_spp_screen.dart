// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class HelpNSppScreen extends StatefulWidget {
  const HelpNSppScreen({super.key});

  @override
  State<HelpNSppScreen> createState() => _HelpNSppScreenState();
}

class _HelpNSppScreenState extends State<HelpNSppScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6F8F6),
      appBar: AppBar(title: Text("Help & Support")),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              _buildContactUs(),
              SizedBox(height: 40),
              _buildFAQ(),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContactUs() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Contact Us",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),
        _contactItem("Email", "mrlucky467@gmail.com", Icons.email_outlined),
        SizedBox(height: 20),
        _contactItem("Phone", "+855 89 553 696", Icons.phone_outlined),
      ],
    );
  }

  Widget _contactItem(String title, String value, IconData icon) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xffAF7950)),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 5),
              Text(
                value,
                style: TextStyle(color: Color(0xffAF7950)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFAQ() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "FAQs",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 20),

        _faqItem(
          "How do I track my order?",
          "Go to Order History and click on your order to see tracking details.",
        ),

        _faqItem(
          "What is your return policy?",
          "We offer 30-day returns for unused items in original packaging.",
        ),

        _faqItem(
          "How do I change my address?",
          "Update your address in Edit Profile or contact support.",
        ),

        _faqItem(
          "What payment methods are accepted?",
          "We accept credit cards, ABA pay, QR code, Apple Pay, and Google Pay.",
        ),

        _faqItem(
          "How long does delivery take?",
          "Standard delivery: 3-5 days. Express: 1-2 days.",
        ),
      ],
    );
  }

  Widget _faqItem(String question, String answer) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Card(
        child: Theme(
          data: Theme.of(context).copyWith(
            dividerColor: Colors.transparent,
          ),
          child: ExpansionTile(
            collapsedIconColor: Color(0xffAF7950),
            iconColor: Color(0xffAF7950),
            title: Text(
              question,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Text(
                  answer,
                  style: TextStyle(color: Color(0xffAF7950)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}