import 'package:flutter/material.dart';

class PageGmail extends StatelessWidget {
  const PageGmail({super.key});

  @override
  Widget build(BuildContext context) {
    // Retourne l'interface principale de la page
    return Scaffold(
      // Barre d'application en haut
      appBar: AppBar(
        backgroundColor: Colors.white, // Fond blanc
        foregroundColor: Colors.black, // Couleur des icônes noire
        elevation: 0, // Pas d'ombre sous l'app bar
        title: const Text(
          "Gmail", // Titre de l'application
          style: TextStyle(
            color: Colors.black, // Texte en noir
            fontWeight: FontWeight.w400, // Poids de police normal
            fontSize: 22, // Taille de police
          ),
        ),
      ),

      // Menu latéral (drawer) qui glisse depuis la gauche
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, // Supprime le padding par défaut
          children: [
            // Espace vide en haut du drawer
            SizedBox(height: 20, child: const Center()),

            // Conteneur principal pour tout le contenu du menu
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ), // Padding horizontal
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Alignement à gauche
                children: [
                  // Section : Titre Gmail dans le drawer
                  Container(
                    padding: const EdgeInsets.only(left: 16, bottom: 10),
                    child: const Text(
                      "Gmail", // Titre du service
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 228, 12, 12), // Rouge Gmail
                      ),
                    ),
                  ),

                  // Ligne de séparation
                  const Divider(
                    height: 20, // Espace vertical autour de la ligne
                    thickness: 1, // Épaisseur de la ligne
                    color: Colors.grey, // Couleur grise
                    indent: 16, // Décallage à gauche
                    endIndent: 16, // Décallage à droite
                  ),

                  // Section 1 : Catégories de boîtes de réception
                  // Chaque _creerElementMenu crée un élément cliquable du menu
                  _creerElementMenu("Toutes les boîtes"), // Sans notification

                  const Divider(
                    height: 20,
                    thickness: 1,
                    color: Colors.grey,
                    indent: 16,
                    endIndent: 16,
                  ),

                  // Boîtes avec différents états :
                  _creerElementMenu(
                    "Principale",
                    badge: "99+",
                  ), // Avec badge "99+" (beaucoup d'emails)
                  _creerElementMenu(
                    "Promotions",
                    estCoche: true,
                  ), // Activé/sélectionné (estCoche)
                  _creerElementMenu("Réseaux sociaux"), // Élément normal
                  _creerElementMenu(
                    "Notifications", // Élément avec badge ET état estCoche
                    badge:
                        "2 nouv", // Badge indiquant 2 nouvelles notifications
                    estCoche: true, // Élément actif/sélectionné
                  ),

                  // Espace entre les sections
                  Container(height: 24),

                  // Section 2 : Tous les libellés (étiquettes)
                  Container(
                    padding: const EdgeInsets.only(left: 16),
                    child: const Text(
                      "Tous les libellés", // Titre de section
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),

                  Container(height: 12), // Espacement
                  // Liste des libellés avec différents états
                  // estCoche:true = élément actif/sélectionné ou avec notifications
                  // badge = indicateur numérique (nombre d'emails)
                  _creerElementMenu("Messages suivis", estCoche: true),
                  _creerElementMenu("En attente"),
                  _creerElementMenu("Important",badge: "348",), // 348 emails importants
                  _creerElementMenu("Achats",badge: "15",), // 15 emails d'achats
                  _creerElementMenu("Envoyés", estCoche: true),
                  _creerElementMenu("Planifié"),
                  _creerElementMenu("Boîte d'envoi", estCoche: true),
                  _creerElementMenu("Brouillons", badge: "15"), // 15 brouillons
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ============================================================
  // MÉTHODE : _creerElementMenu
  // Objectif : Créer un élément réutilisable du menu
  // Paramètres :
  //   - title : Texte affiché pour l'élément
  //   - estCoche : booléen indiquant si l'élément est actif/sélectionné
  //   - badge : texte optionnel affiché dans un badge (notification)
  // ============================================================
  Widget _creerElementMenu(
    String title, {
    bool estCoche = false, // Par défaut non sélectionné
    String? badge, // Badge optionnel (peut être null)
  }) {
    // Récupère l'icône correspondant au titre
    IconData icon = _getIconForTitle(title);

    // Retourne un ListTile (élément de liste cliquable)
    return ListTile(
      // Icône à gauche
      leading: Icon(
        icon,
        size: 24,
        color:
            estCoche // Si l'élément est "estCoche" (actif/avec notifications)
            ? const Color.fromARGB(255, 243, 33, 33) // Rouge vif
            : Colors.grey[600], // Gris sinon
      ),

      // Contenu principal (titre + badge éventuel)
      title: Row(
        children: [
          // Titre de l'élément
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: estCoche
                    ? const Color.fromARGB(255, 243, 33, 33) // Rouge si estCoche
                    : Colors.black87, // Noir sinon
                fontWeight: estCoche
                    ? FontWeight.w500
                    : FontWeight.normal, // Gras si estCoche
              ),
            ),
          ),

          // Badge de notification (affiché seulement si badge != null)
          if (badge != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                // Couleur du badge :
                // - Orange si estCoche (élément actif)
                // - Gris transparent sinon
                color: estCoche
                    ? const Color.fromARGB(255, 252, 149, 14) // Orange
                    : const Color.fromARGB(82, 0, 3, 15), // Gris transparent
                borderRadius: BorderRadius.circular(12), // Coins arrondis
              ),
              child: Text(
                badge, // Texte du badge ("99+", "2 nouv", etc.)
                style: const TextStyle(
                  color: Colors.white, // Texte blanc
                  fontSize: 11, // Petite taille
                  fontWeight: FontWeight.w500, // Demi-gras
                ),
              ),
            ),
        ],
      ),

      // Padding horizontal du contenu
      contentPadding: const EdgeInsets.symmetric(horizontal: 16),
      minLeadingWidth: 0, // Réduit l'espace par défaut avant l'icône
    );
  }

  // ============================================================
  // MÉTHODE : _getIconForTitle
  // Objectif : Associer chaque titre de menu à une icône Material
  // Paramètre : title - le texte de l'élément de menu
  // Retour : IconData - l'icône correspondante
  // ============================================================
  IconData _getIconForTitle(String title) {
    // Switch pour mapper chaque titre à son icône
    switch (title) {
      case "Toutes les boîtes":
        return Icons.all_inbox; // Icône "toutes les boîtes"
      case "Principale":
        return Icons.inbox; // Icône boîte de réception
      case "Promotions":
        return Icons.local_offer_outlined; // Icône étiquette promotion
      case "Réseaux sociaux":
        return Icons.people_outline; // Icône personnes/réseaux
      case "Notifications":
        return Icons.notifications_none; // Icône cloche de notification
      case "Messages suivis":
        return Icons.label_important_outlined; // Icône étiquette importante
      case "En attente":
        return Icons.schedule_outlined; // Icône horloge/attente
      case "Important":
        return Icons.star_border; // Icône étoile (importance)
      case "Achats":
        return Icons.shopping_bag_outlined; // Icône sac shopping
      case "Envoyés":
        return Icons.send_outlined; // Icône envoi
      case "Planifié":
        return Icons.access_time_outlined; // Icône horloge
      case "Boîte d'envoi":
        return Icons.outbox_outlined; // Icône boîte d'envoi
      case "Brouillons":
        return Icons.drafts_outlined; // Icône brouillon
      default:
        return Icons.folder_outlined; // Icône par défaut (dossier)
    }
  }
}
