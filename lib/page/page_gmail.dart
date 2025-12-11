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
            SizedBox(height: 20, child: const Center()),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Titre Gmail
                  Container(
                    padding: const EdgeInsets.only(left: 16, bottom: 10),
                    child: const Text(
                      "Gmail",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  const Divider(
                    height: 20, // Espace vertical autour de la ligne
                    thickness: 1, // Épaisseur de la ligne
                    color: Colors.grey, // Couleur de la ligne
                    indent: 16, // Décallage à gauche
                    endIndent: 16, // Décallage à droite
                  ),
                  // Section "Toutes les boîtes"
                  _buildMenuItem("Toutes les boîtes"),
                  const Divider(
                    height: 20, // Espace vertical autour de la ligne
                    thickness: 1, // Épaisseur de la ligne
                    color: Colors.grey, // Couleur de la ligne
                    indent: 16, // Décallage à gauche
                    endIndent: 16, // Décallage à droite
                  ),
                  // Ici le badge veut dire le nombres totals de notifications qu'on a dans notre titre
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
                  //Ici le checked :true veut dire qu'il y'a des notifications pour le titre concerné
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
    );
  }

  //Widgt pour generaliser l'affichage de chaque element dans le drawer
  Widget _buildMenuItem(String title, {bool checked = false, String? badge}) {
    IconData icon = _getIconForTitle(title);

    return ListTile(
      leading: Icon(
        icon,
        size: 24,
        color:
            checked //on verifie ici si il y'a une notification dans la ligne (a droite)
            //si oui elle s'affiche en rouge sinon elle reste gris
            ? const Color.fromARGB(255, 243, 33, 33)
            : Colors.grey[600],
      ),
      title: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: checked
                    ? const Color.fromARGB(255, 243, 33, 33)
                    : Colors.black87,
                fontWeight: checked ? FontWeight.w500 : FontWeight.normal,
              ),
            ),
          ),
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 243, 33, 44),
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
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 0, // Réduit l'espace par défaut de l'icône
    );
  }

  //Widget pour charger les differents icones des elements present dans le drawer
  IconData _getIconForTitle(String title) {
    switch (title) {
      case "Toutes les boîtes":
        return Icons.all_inbox;
      case "Principale":
        return Icons.inbox;
      case "Promotions":
        return Icons.local_offer_outlined;
      case "Réseaux sociaux":
        return Icons.people_outline;
      case "Notifications":
        return Icons.notifications_none;
      case "Messages suivis":
        return Icons.label_important_outline;
      case "En attente":
        return Icons.schedule_outlined;
      case "Important":
        return Icons.star_border;
      case "Achats":
        return Icons.shopping_bag_outlined;
      case "Envoyés":
        return Icons.send_outlined;
      case "Planifié":
        return Icons.access_time_outlined;
      case "Boîte d'envoi":
        return Icons.outbox_outlined;
      case "Brouillons":
        return Icons.drafts_outlined;
      default:
        return Icons.folder_outlined;
    }
  }
}
