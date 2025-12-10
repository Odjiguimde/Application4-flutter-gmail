import 'package:flutter/material.dart';

class PageGmail extends StatelessWidget {
  const PageGmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: const Text(
          "Gmail",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(height: 70, child: const Center()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre Gmail
                  Container(
                    padding: const EdgeInsets.only(left: 16, bottom: 16),
                    child: const Text(
                      "Gmail",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  // Section "Toutes les boîtes"
                  _buildMenuItem("Toutes les boîtes"),
                  _buildMenuItem("Principale", badge: "99+"),
                  _buildMenuItem("Promotions", checked: true),
                  _buildMenuItem("Réseaux sociaux"),
                  _buildMenuItem("Notifications", badge: "2 nouveau"),
                  Container(height: 24),
                  // Section "Tous les libellés"
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text(
                      "Tous les libellés",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                  Container(height: 12),
                  _buildMenuItem("Messages suivis", checked: true),
                  _buildMenuItem("En attente"),
                  _buildMenuItem("Important", badge: "348"),
                  _buildMenuItem("Achats", badge: "15"),
                  _buildMenuItem("Envoyés", checked: true),
                  _buildMenuItem("Planifié"),
                  _buildMenuItem("Boîte d'envoi", checked: true),
                  _buildMenuItem("Brouillons", badge: "15"),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Section Promotions
            Container(
              margin: const EdgeInsets.only(bottom: 12),
              child: const Text(
                "Promotions",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              child: _buildEmailItem(
                "Jan Hendrik von Ahlen | JobLeads — Vo...",
              ),
            ),
            // Section Notifications
            Container(
              margin: const EdgeInsets.only(bottom: 5),
              child: const Text(
                "Notifications",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: _buildEmailItem(
                "Duolingo — 💬 Snif... C'est pas t...",
                isBold: true,
              ),
            ),
            // Divider
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: const Divider(height: 1),
            ),
            // GalsenAI
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: _buildEmailItemWithSender(
                "GalsenAI",
                "Programme à l'instant: Conféren...\nGalsenAI vous invite à un nouvel événement...",
              ),
            ),
            // Divider
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: const Divider(height: 1),
            ),
            // LinkedIn Job Alerts 1
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: _buildEmailItemWithSender(
                "LinkedIn Job Alerts",
                "\"data science\": X-FLOW - Data Scientist: X-FLOW Data Scientist: X-FLOW is a m...",
              ),
            ),
            // Divider
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: const Divider(height: 1),
            ),
            // CMC Spotlight
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: _buildEmailItemWithSender(
                "CMC Spotlight",
                "BlackRock Wants Staking for Etherer...\nExplore the latest industry news, insight...",
              ),
            ),
            // Divider
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: const Divider(height: 1),
            ),
            // LinkedIn Job Alerts 2
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: _buildEmailItemWithSender(
                "LinkedIn Job Alerts",
                "\"data scientist\": X-FLOW - Data Scientist: X-FLOW Data Scientist: X-FLOW is a m...",
              ),
            ),
            // Divider
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: const Divider(height: 1),
            ),
            // JobLeads
            Container(
              margin: const EdgeInsets.only(bottom: 24),
              child: _buildEmailItemWithSender(
                "JobLeads",
                "Confidential / personal: your network",
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(String title, {bool checked = false, String? badge}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        children: [
          Checkbox(
            value: checked,
            onChanged: (value) {},
            activeColor: Colors.blue,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(fontSize: 14, color: Colors.black87),
            ),
          ),
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                badge,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildEmailItem(String content, {bool isBold = false}) {
    return Container(
      child: Text(
        content,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          color: Colors.grey[700],
        ),
      ),
    );
  }

  Widget _buildEmailItemWithSender(String sender, String content) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 6),
            child: Text(
              sender,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            child: Text(
              content,
              style: TextStyle(fontSize: 13, color: Colors.grey[700]),
            ),
          ),
        ],
      ),
    );
  }
}
