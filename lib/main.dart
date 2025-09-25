import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FamPay Contextual Cards',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
const apiUrl = "https://polyjuice.kong.fampay.co/mock/famapp/feed/home_section/?slugs=famx-paypage";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _showActionButtons = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children:  [
              Image.asset(
                "assets/fampay.png",
                height: 22,
              ),
              SizedBox(width: 6),
              Text(
                "fampay",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF000000),
                ),
              ),
            ],
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(height: 20),

          // Big display card with action
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GestureDetector(
              onLongPress: () {
                setState(() {
                  _showActionButtons = !_showActionButtons;
                });
              },
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2D249F),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.lock,
                          size: 48,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          "Big display card\nwith action",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          "This is a sample text for the subtitle that you can add to contextual cards",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            height: 1.4,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          height: 44,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Center(
                            child: Text(
                              "Action",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Long press action buttons
                  if (_showActionButtons)
                    Positioned(
                      left: -10,
                      top: 40,
                      child: Column(
                        children: [
                          _buildFloatingAction(Icons.notifications, "remind later"),
                          const SizedBox(height: 8),
                          _buildFloatingAction(Icons.cancel, "dismiss now"),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Save the streak card
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: const [
                  Icon(Icons.local_fire_department, size: 50, color: Colors.orange),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Save the streak 🔥",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "10-Day Savings Challenge",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 20),

          // Three gradient cards
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildGradientBox(const [Color(0xFFFFA963), Color(0xFFFFA115)]),
                const SizedBox(width: 8),
                _buildGradientBox(const [Color(0xFF24036A), Colors.redAccent]),
                const SizedBox(width: 8),
                _buildGradientBox(const [Colors.greenAccent, Colors.teal]),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Small card with arrow
          _buildSmallCardWithArrow(
            title: "Small card with arrow",
            subtitle: "",
          ),

          const SizedBox(height: 12),

          // Small display card with avatar
          _buildSmallDisplayCard(
            title: "Arya Stark",
            subtitle: "Small display card",
          ),

          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildFloatingAction(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, size: 18, color: Colors.black87),
          const SizedBox(width: 6),
          Text(
            text,
            style: const TextStyle(fontSize: 14, color: Colors.black87),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientBox(List<Color> colors) {
    return Expanded(
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: LinearGradient(
            colors: colors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
      ),
    );
  }

  Widget _buildSmallCardWithArrow({
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFE8F4FF),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.arrow_forward,
              color: Color(0xFF4A6FFF),
              size: 20,
            ),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: subtitle.isNotEmpty
              ? Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          )
              : null,
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
            color: Color(0xFF999999),
          ),
        ),
      ),
    );
  }

  Widget _buildSmallDisplayCard({
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: ListTile(
          leading: const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.orange,
            child: Icon(Icons.person, color: Colors.white),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF666666),
            ),
          ),
        ),
      ),
    );
  }
}
