# 🎮 E-Shop Gaming - Application E-commerce Flutter

Une application e-commerce moderne développée avec Flutter, spécialisée dans la vente de matériel gaming et streaming.

## 📱 Aperçu

E-Shop Gaming est une application e-commerce complète avec une interface utilisateur élégante et un thème sombre aux accents rouges, parfaitement adaptée à l'univers du gaming.

## ✨ Fonctionnalités

### 🛍️ Catalogue de Produits
- **40 produits gaming** de haute qualité
- Catégories variées : Périphériques, Composants, Streaming, Audio, VR, etc.
- Images produits professionnelles
- Descriptions détaillées
- Prix en euros

### 🔍 Navigation et Filtrage
- Barre de recherche intuitive
- Filtrage par catégories
- Système de tri (prix, nom)
- Vue détaillée par catégorie avec statistiques

### 🛒 Panier d'Achat
- Ajout/suppression de produits
- Gestion des quantités
- Calcul automatique du total
- Animation lors de l'ajout au panier

### 🎨 Interface Utilisateur
- Design moderne et épuré
- Thème sombre avec accents rouges
- Animations fluides
- Navigation intuitive
- Responsive design

## 🏷️ Catégories de Produits

- 🎧 **Accessoires Gaming** - Casques, tapis de souris, etc.
- ⌨️ **Périphériques** - Claviers, souris, manettes
- 🖥️ **Composants PC** - Cartes graphiques, processeurs, RAM
- 🎬 **Matériel Streaming** - Webcams, micros, éclairage
- 🖱️ **Équipements Pro** - Stations d'accueil, pédaliers
- 🎮 **VR & Technologies** - Casques VR, accessoires
- 🪑 **Mobilier Gaming** - Chaises, bureaux gaming
- 🌐 **Solutions Réseau** - Routeurs gaming

## 🛠️ Technologies Utilisées

- **Flutter SDK** - Framework de développement
- **Provider** - Gestion d'état
- **Architecture MVC** - Structure du projet
- **Animations personnalisées** - Expérience utilisateur fluide
- **Gestion des thèmes** - Interface cohérente
- **System de routing** - Navigation entre écrans

## 🚀 Installation et Exécution

### Prérequis
- Flutter SDK (version 3.2.0 ou supérieure)
- Dart SDK
- Chrome (pour le développement web)

### Étapes d'installation

1. **Cloner le dépôt**
   ```bash
   git clone https://github.com/Sirajsalah777/Ecom-gaming.git
   cd Ecom-gaming
   ```

2. **Installer les dépendances**
   ```bash
   flutter pub get
   ```

3. **Lancer l'application**
   ```bash
   flutter run -d chrome
   ```

## 📁 Structure du Projet

```
lib/
├── data/
│   └── products_data.dart          # Données des produits
├── models/
│   ├── product.dart                # Modèle produit
│   └── cart_item.dart             # Modèle article panier
├── providers/
│   ├── cart_provider.dart          # Gestion du panier
│   └── products_provider.dart      # Gestion des produits
├── screens/
│   ├── home_screen.dart            # Écran d'accueil
│   ├── cart_screen.dart            # Écran panier
│   ├── category_screen.dart        # Écran catégorie
│   └── product_detail_screen.dart  # Détails produit
├── theme/
│   └── app_theme.dart              # Configuration thème
├── widgets/
│   ├── product_card.dart           # Carte produit
│   ├── cart_item_widget.dart       # Widget article panier
│   └── category_header.dart        # En-tête catégorie
└── main.dart                       # Point d'entrée
```

## 🎯 Fonctionnalités Principales

### 🏠 Page d'Accueil
- Grille de produits responsive
- Filtres par catégorie
- Barre de recherche
- Système de tri

### 🛒 Panier Intelligent
- Ajout rapide au panier
- Gestion des quantités
- Calcul automatique du total
- Suppression par glissement

### 📱 Navigation Fluide
- Transitions animées
- Navigation contextuelle
- Retour intuitif

## 🔮 Évolutions Futures

- [ ] Système d'authentification
- [ ] Paiement en ligne
- [ ] Liste de souhaits
- [ ] Notifications push
- [ ] Reviews produits
- [ ] Programme de fidélité
- [ ] Support multilingue
- [ ] Mode AR pour visualisation produits

## 📊 Statistiques

- **40 produits** gaming premium
- **8 catégories** différentes
- **Interface responsive** pour tous les écrans
- **Thème sombre** optimisé pour le gaming

## 🤝 Contribution

Les contributions sont les bienvenues ! Pour contribuer :

1. Fork le projet
2. Créer une branche feature (`git checkout -b feature/AmazingFeature`)
3. Commit vos changements (`git commit -m 'Add some AmazingFeature'`)
4. Push vers la branche (`git push origin feature/AmazingFeature`)
5. Ouvrir une Pull Request

## 📄 Licence

Ce projet est sous licence MIT. Voir le fichier `LICENSE` pour plus de détails.

## 👨‍💻 Auteur

**Siraj Salah**
- GitHub: [@Sirajsalah777](https://github.com/Sirajsalah777)

## 🙏 Remerciements

- Images produits fournies par Unsplash
- Communauté Flutter pour l'inspiration
- Équipe de développement pour les contributions

---

⭐ **N'oubliez pas de donner une étoile au projet si vous l'aimez !** ⭐
