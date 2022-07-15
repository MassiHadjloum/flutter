// ignore_for_file: constant_identifier_names

import 'package:bnparisbas/constants/widhets.dart';
import 'package:bnparisbas/models/list_tile_info.dart';
import 'package:flutter/material.dart';

final itemsDrawer = [
  {'title': 'Accueil', 'icon': Icons.home_rounded, 'routeName': '/accueil'},
  {
    'title': 'Comptes & Cartes',
    'icon': Icons.credit_card_rounded,
    'routeName': '/comptes_cartes'
  },
  {
    'title': 'Piloter mon épargne',
    'icon': Icons.circle,
    'routeName': '/piloter_mon_epargne'
  },
  {
    'title': 'Virements',
    'icon': Icons.stacked_line_chart,
    'routeName': '/virements'
  },
  {
    'title': 'Paiment mobile',
    'icon': Icons.mobile_screen_share,
    'routeName': '/paiment_mobile'
  },
  {
    'title': 'Offres',
    'icon': Icons.shopping_bag_rounded,
    'routeName': '/offres'
  },
  {
    'title': 'RIB, chèque & documents',
    'icon': Icons.file_copy_rounded,
    'routeName': '/rib'
  },
  {
    'title': 'Contacter mon conseiller',
    'icon': Icons.mail_rounded,
    'routeName': '/contacter_conseiller'
  },
  {'title': 'Bourse', 'icon': Icons.show_chart, 'routeName': '/bourse'},
  {
    'title': 'Empreinte carbone',
    'icon': Icons.nature,
    'routeName': '/empreinte_carbone'
  },
  {
    'title': 'Assurance',
    'icon': Icons.security_rounded,
    'routeName': '/assurance'
  },
  {
    'title': 'Suivi des demandes',
    'icon': Icons.update,
    'routeName': '/suivi_demandes'
  },
  {
    'title': 'Parrainage',
    'icon': Icons.wallet_giftcard_rounded,
    'routeName': '/parrainage'
  },
  {'title': 'Astuces', 'icon': Icons.lightbulb, 'routeName': '/astuces'},
  {'title': 'Aide & Urgence', 'icon': Icons.help_sharp, 'routeName': '/aide'},
  {
    'title': 'Sécurité & Mentions légales',
    'icon': Icons.upload_file_sharp,
    'routeName': '/securite'
  }
];

const primaryColor = Color.fromARGB(255, 26, 188, 156);
const opacityPrimaryColor = Color.fromARGB(220, 26, 200, 156);
const accentColor = Colors.amber; //fromARGB(255, 44, 53, 64);

const Headers =  {
      'Content-Type': 'application/json',
      'Charset': 'utf-8'
    };

final List<Map<String, Object?>> itemsGridEpargne = [
  {
    "title": "Cartes",
    "image": "assets/images/paiement-par-carte-de-credit.png",
    "typeData": TypeData.CARTES,
  },
  {
    "title": "Épargne",
    "image": "assets/images/coffre-fort.png",
    "typeData": TypeData.EPARGNE
  },
  {
    "title": "Assurances",
    "image": "assets/images/parapluie.png",
    "typeData": TypeData.ASSURANCE
  },
  {
    "title": "Crédits",
    "image": "assets/images/calculatrice.png",
    "typeData": TypeData.CREDITS
  },
  {
    "title": "Offres 0-17 ans",
    "image": "assets/images/papa.png",
    "typeData": TypeData.OFFRES
  },
  {"title": "Et d'autres offres à venir...", "image": null},
];

final listTileInfoSecuretyProfile = [
  ListTileInfo(
      title: 'Numéro mobile',
      subtitle:
          'Gérez votre numéro de mobile pour réaliser vos opération sensibles.',
      leading: const Icon(Icons.phone_android, color: primaryColor, size: 40),
      trailing: 'RENSEIGNÉ'),
  ListTileInfo(
      title: 'Clé Digitale',
      subtitle:
          'Renforcez la sécurité de vos opérations sensibles avec la Clé Digitale.',
      leading:
          const Icon(Icons.security_rounded, color: primaryColor, size: 40),
      trailing: 'ACTIVÉE'),
  ListTileInfo(
      title: 'Fingerprint',
      subtitle: 'Accédez à vos comptes avec votre empreinte digital.',
      leading: const Icon(Icons.fingerprint, color: primaryColor, size: 40)),
  ListTileInfo(
      title: 'Code Secret',
      subtitle: 'Modifez le code secret de votre espace client.',
      leading: const Icon(Icons.code_sharp, color: primaryColor, size: 40)),
  ListTileInfo(
    title: 'Partage de données et autorisations',
    subtitle:
        'Gérez les autorisations d\'accès à vos comptes accordés à des application et des sites web.',
    leading: const Icon(Icons.cloud_upload, color: primaryColor, size: 40),
  )
];

final listTileInfoParametresProfile = [
  ListTileInfo(
      leading: const Icon(Icons.notifications, color: primaryColor, size: 40),
      title: 'Notifications',
      subtitle:
          'Recevez les notifications liées à vos comptes BNP Paribas sur votre mobile.'),
  ListTileInfo(
      leading: const Icon(Icons.category, color: primaryColor, size: 40),
      title: 'Catégorisation des opération',
      subtitle: 'Gérez la catégorisation automatique de vos opération.'),
  ListTileInfo(
      leading: const Icon(Icons.compare_arrows_rounded,
          color: primaryColor, size: 40),
      title: 'Virement',
      subtitle:
          'Paramétrez vos opérations de virements instantanés et internationaux sur mobile et sur le site.'),
  ListTileInfo(
      leading:
          const Icon(Icons.beach_access_rounded, color: primaryColor, size: 40),
      title: 'Météo du compte principal',
      subtitle:
          'Affichez le sold et définissez la météo de votre compte avant connexion.'),
  ListTileInfo(
      leading:
          const Icon(Icons.line_weight_rounded, color: primaryColor, size: 40),
      title: 'Écran d\'accueil',
      subtitle:
          'Personnalisez l\'affichage de vos widgets pour consulter vos comptes en un coup d\'oil'),
  ListTileInfo(
      leading: const Icon(Icons.sim_card_download_rounded,
          color: primaryColor, size: 40),
      title: 'Relevés en ligne',
      subtitle:
          'Paramétrez les documents que vous souhaitez visualiser sur mobile, tablette et sur le site.'),
];

final listTileInfoOffresCartes = [
  ListTileInfo(
      title: "Carte Visa Electron",
      leading: SizedBox(
          width: 60,
          height: 70,
          child: Image.asset("assets/images/electron_card.png")),
      subtitle: "Carte de paiement et de retrait à autorisation systématique.",
      trailing: ReuseWidgets.rightArrow,
      typeCarte: TypeCarte.ELECTRON),
  ListTileInfo(
      title: "Carte Visa Classic",
      leading: SizedBox(
          width: 60,
          height: 70,
          child: Image.asset("assets/images/classic_card.png")),
      subtitle: "La carte visa international tout simplement.",
      trailing: ReuseWidgets.rightArrow,
      typeCarte: TypeCarte.CLASSIC),
  ListTileInfo(
      title: "Carte Visa Premier",
      leading: SizedBox(
          width: 60,
          height: 70,
          child: Image.asset("assets/images/premier_card.jpeg")),
      subtitle:
          "La cart Visa Premier vous offre une protéction à toute épreuve..",
      trailing: ReuseWidgets.rightArrow,
      typeCarte: TypeCarte.PREMIER),
  ListTileInfo(
      title: "Carte Visa Infinite",
      leading: SizedBox(
          width: 60,
          height: 70,
          child: Image.asset("assets/images/infinite_card.png")),
      subtitle:
          "La carte Visa Infinite est la carte de prestige de la gamme BNP Paribas.",
      trailing: ReuseWidgets.rightArrow,
      typeCarte: TypeCarte.INFINITE),
  ListTileInfo(
      title: "Cryptogramme dynamique",
      leading: SizedBox(
          width: 60,
          height: 70,
          child: Image.asset("assets/images/cryptogramme.jpeg")),
      subtitle: "Une technologie fiable et innovante.",
      trailing: ReuseWidgets.rightArrow,
      typeCarte: TypeCarte.CRYPTOGRAMME),
];

final listHeaderCarteInfinite = [
  {"text": "Carte Visa Infinite*", "size": 17.0, "bold": true},
  {"text": "La carte bancaire de prestige avec l'exigence de vous satisfaire."},
  {
    "text":
        "*Fourniture d'une carte de débit (carte de paiement internationale à débit immédiat), fourniture d'une carte de débit (carte de paiement internationale à débit différé)."
  }
];
final listDetailsCarteInfinite = [
  {
    "title": "Offres privilèges",
    "image": "assets/images/medaille.png",
    "text":
        "Retrouvez l'ensemble des offres privilèges Carte Visa Infinite dans le magazine Exclusivement Vous."
  },
  {
    "title": "Carte internationale sans frais supplémentaires",
    "image": "assets/images/planete-terre.png",
    "text":
        "Vos achatset retraits avec la Carte Visa Infinite sont :. \n• sans frais supplémentaires dans la plupart des banques en France. \n• sans frais supplementalres dans la plupart des banques en France et dans le monde. \n• avec des commissions réduites sur les banques non-partenaires."
  },
  {
    "title": "Option débit différé gratuite",
    "image": "assets/images/carte-bancaire.png",
    "text":
        "Profitez de l'option paiement débit différé qui vous permet de regrouper l'ensemble de vos paiements et prélèvements au dernier jour ouvré du mois."
  },
  {
    "title": "Carte sans contact",
    "image": "assets/images/nfc.png",
    "text":
        "Fonction « carte sans contact » pour rapidement vos achats jusqu'à 50 €. Fonction Paylib pour effectuer vos paiements en ligne de manière simple et sécurisée."
  },
  {
    "title": "Services d'assurance",
    "image": "assets/images/assurance-sante.png",
    "text":
        "Assurance individuelle Accidents Voyages (accident-décès-invalidité) pour vous et votre famille."
  },
  {
    "title": "Plafonds et services bancaires personnalisables",
    "image": "assets/images/loading-bar.png",
    "text":
        "• Plafonds de retrait et de paiement élevés et  personnalisables. \n• Des options de paiement disponibles sur votre carte à débit différé selon vos besoins. \n• Services additionnels personnalisés : coffre-fort, service presse etc."
  },
  {
    "title": "Assurances premium",
    "image": "assets/images/shield.png",
    "text":
        "Modification, interruption ou annulation de voyage, neige et montagne, perte ou vol de bagages, achats sur Internet, assistance médicale, etc."
  },
  {
    "title": "Service de conciergerie haut de gamme",
    "image": "assets/images/sonnerie-de-bureau.png",
    "text":
        "Réservations de billets, taxis, livraisons, location, conseils, assistance à domicile, recherches, etc."
  },
];

final listHeaderCryptogramme = [
  {"text": "Cryptogramme dynamique", "size": 17.0, "bold": true},
  {"text": "Une technologie fiable et innovante"},
];

final listDetailsCryptogramme = [
  {
    "title": "Une sécurité renforcée des  paiements à distance",
    "image": "assets/images/carte-bancaire.png",
    "text":
        "Grâce au Cryptogramme Dynamique, vos paiements par téléphone et vos achats sur Internet (depuis un ordinateur ou un smartphone) sont encore plus sécurisés : la série de 3 chiffres au verso de votre carte (le cryptogramme ou « CW ») change régulièrement et automatiquement, de manière aléatoire."
  },
  {
    "title": "Une protection contre la fraude",
    "image": "assets/images/cadenas.png",
    "text":
        "Ainsi, vous pouvez confier sans crainte vos informations de carte bancaire pour ce type d'achats : même en cas de piratage, de vol de données ou d'utilisation frauduleuse, votre carte sera inutilisable, puisque le cryptogramme aura changé entre temps !"
  },
  {
    "title": "Gardez le même code confidentiel",
    "image": "assets/images/carte-bancaire.png",
    "text":
        "Si vous êtes déjà titulaire d'une carte Visa Electron/ MyB's, Visa Classic, Visa Premier ou Visa Infinite, vous conservez votre code confidentiel inchangé lors de l'ajout du Cryptogramme Dynamique."
  },
  {
    "title": "Faites des achats en ligne en toute sérénité",
    "image": "assets/images/shield.png",
    "text":
        "En cas de souscription d'abonnement avec un paiement périodique, de paiement en plusieurs fois, ou d'enregistrement des données de votre carte par un commerçant sur Internet pour effectuer des achats ultérieurement sur son site, pas d'inquiétude : il n'y a aucun changement pour vous, et vos habitudes de paiement restent identiques à celles que vous avez actuellement."
  },
  {
    "title": "Gardez les mêmes fonctionnalités",
    "image": "assets/images/check-box.png",
    "text":
        "Enfin, votre carte conserve bien sûr toutes ses fonctionnalités existantes : choix du débit immédiat ou différé, plafonds de paiement et de retrait, assurances et assistances, paiement sans contact, ..."
  },
];

final listHeaderCartePremier = [
  {"text": "Carte Visa Premier*", "size": 17.0, "bold": true},
  {
    "text":
        "Des services complets et une protection optimale au quotidien et pour vos déplacements."
  },
  {
    "text":
        "* Fourniture d'une carte de débit (carte de paiement internationale à débit immédiat), fourniture d'une carte de débit (carte de paiement internationale à débit différé)."
  }
];

final listDetailsCartePremier = [
  {
    "title": "Gestion simplifiée",
    "image": "assets/images/check-box.png",
    "text":
        "Débit différé, pour faciliter la gestion de votre trésorerie. Plafonds de retraits et paiements personnalisables selon vos besoins."
  },
  {
    "title": "Carte internationale",
    "image": "assets/images/planete-terre.png",
    "text":
        "La carte Visa Premier vous permet d'effectuer vos retraits sans frais supplémentaires en Franceet en zone Euro et via le réseau BNP Paribas Global Network et Global Alliance dans le monde."
  },
  {
    "title": "Visa Premier assurances",
    "image": "assets/images/assurance-sante.png",
    "text":
        "Assistance médicale, annulation de voyage, neige et montagne, perte ou vol de bagages, etc."
  },
];

final listHeaderCarteClassic = [
  {"text": "Carte Visa Classic*", "size": 17.0, "bold": true},
  {"text": "La carte internationale."},
  {
    "text":
        "* Fourniture d'une carte de débit (carte de paiement internationale à débit immédiat), fourniture d'une carte de débit (carte de paiement internationale à débit différé)."
  },
];

final listDetailsCarteClassic = [
  {
    "title": "Payer dans le monde",
    "image": "assets/images/planete-terre.png",
    "text":
        "Avec votre Carte Visa Classic, vous pouvez payer et retirer de l'argent en France et dans plus de 200 pays dans le monde."
  },
  {
    "title": "Option débit différé pour plus de sérénité",
    "image": "assets/images/hourglass.png",
    "text":
        "Profitez de l'option paiement débit différé qui vous permet de regrouper l'ensemble de vos paiements et prélèvements au dernier jour ouvré du mois."
  },
  {
    "title": "Carte sans contact",
    "image": "assets/images/nfc.png",
    "text":
        "Profitez de la fonction « sans contact » pour régler rapidement vos achats jusqu'à 50 €."
  },
  {
    "title": "Services d'assistance",
    "image": "assets/images/check-up.png",
    "text":
        "Assistance en cas de maladie, blessure ou décès pour tout déplacement en France et à l'étranger, pour vous et votre famille."
  },
  {
    "title": "Services d'assurance",
    "image": "assets/images/assurance-sante.png",
    "text":
        "Assurance individuelle Accidents Voyages (accident-décès-invalidité) pour vous et votre famille."
  },
];

final listHeaderCarteElectron = [
  {"text": "Carte Visa Electron*", "size": 17.0, "bold": true},
  {"text": "Maîtrisez vos dépenses en toutes circonstances."},
  {
    "text":
        "* Fourniture d'une carte de débit (carte de paiement à autorisation systématique)."
  },
];

final listDetailsCarteElectron = [
  {
    "title": "Payer dans le monde",
    "image": "assets/images/planete-terre.png",
    "text":
        "Paiement et retrait d'argent en France et à l'étranger avec la Carte Visa Electron."
  },
  {
    "title": "Maîtriser ses dépenses",
    "image": "assets/images/statistiques.png",
    "text":
        "Interrogation automatique du solde avant chaque paiement. La Carte Visa Electron est une carte à débit immédiat. Les paiements et les retraits sont débités au fur et à mesure qu'ils parviennent à la banque."
  },
];

final listSouscrireCarte = [
  ListTileInfo(
      title: "Contacter",
      subtitle: "Un Conseiller",
      leading:
          const Text("1", style: TextStyle(color: primaryColor, fontSize: 18))),
  ListTileInfo(
      title: "Signez",
      subtitle: "Les documents contractuels",
      leading:
          const Text("2", style: TextStyle(color: primaryColor, fontSize: 18))),
  ListTileInfo(
      title: "Recevez",
      subtitle: "votre carte à domicile",
      leading:
          const Text("3", style: TextStyle(color: primaryColor, fontSize: 18))),
];

final listEnDetailCarteElectron = [
  {
    "title": "Déscription",
    "text":
        """La Carte Visa Electron est une carte de paiement et de retrait utilisable en France comme à l'étranger La particularité de cette carte est l'interrogation automatique du solde du compte avant chaque paiement ou retrait\n\n* Fourniture d'une carte de débit (carte de paiemen à autorisation systématique)."""
  },
  {
    "title": "Fonctionnement",
    "text":
        """ Conditions de souscription à la Carte Visa Electron La Carte Visa Electron peut être souscrite dans la formule Esprit Libre ou indépendamment, par toute personne physique majeure. Si vous le souhaitez, votre éventuel co-titulaire ou un tiers mandaté peut être également titulaire de cette carte. \n\nVous vivez en couple ?\n Bénéficiez de 50% de réduction sur la cotisation annuelle de la 2ème Carte Visa Electron! \n\nMise à disposition de la carte\n La carte est expédiée à l'adresse courrier du titulaire. Il est toutefois possible d'envoyer la à une autre adresse a la demande du clienty compris en agence \n\nDurée et renouvellement carte \nLa carte Visa Electron est valable trois ans, jusqu'au demier jour du mois indiqué sur la carte. Elle est renouvelée automatiquement, un mois avant la date d'échéance de la carte, sauf avis contraire de la Banque ou du titulaire de la carte ou du compte exprimé par écrit au moins un mois avant la date d'échéance. Cette carte est adressée par courrier au titulaire de la carte sauf s'il demande à son agence de changer le lieu de réception de sa nouvelle carte. Une nouvelle carte est également créée en cas de mise en opposition de la carte (pour perte ou vol). Elle est envoyée à l'adresse courrier du titulaire de la carte. \n\nActivation \nLe titulaire doit activer sa carte de paiement dans un distributeur en effectuant un retrait avant de réaliser des achats chez un commerçant. \n\nInterrogation automatique du solde \nA chaque utilisation, retrait ou paiement, la Carte Visa Electron déclenche une consultation automatique du solde de votre compte (en incluant l'éventuelle facilité de caisse). \n\nPlafonds de paiement \nEn France et à l'étranger, le plafond standard de paiement est de 1 000 € (ou équivalent en devises) par période de 30 jours consécutifs. Ce plafond est néanmoins modulable en fonction de vos besoins. \n\nPlafonds de retrait \nEn France et à l'étranger, le plafond standard de retrait est de 450 € (ou équivalent en devises) par période de 7 jours consécutifs dans les distributeurs BNP Paribas ou autres banques affichant le logo CB (en France) ou Visa (à l'étranger). Ce plafond est personnalisable selon vos besoins. \n\nDébit des paiements \nLa carte est toujours à débit immédiat : les paiements sont débités au fur et à mesure qu'elles parviennent à la banque. \n\nDébit des retraits \nMontant débité immédiatement sur le compte-chèques auquel la carte est rattachée. \n\nLe code confidentiel \nEn cas de changement de carte, votre code est conservé ou changé selon le cas: \n\n✓ Création suite à une mise en opposition : Nouveau code confidentiel \n\n✓ Renouvellement ou réfection autre que suite à une mise en opposition : Code confidentiel conservé \n\n✓ Souscription à une nouvelle carte: Code confidentiel conservé \n\nPerte et vol de la Carte Visa Electron Utilisation frauduleuse de la carte Les paiements et les retraits (avec ou sans code) effectués avant la mise en opposition de la carte sont votre charge dans la limite de 50 €. \n\nRemarques :\n\nsi vous êtes également détenteur de BNP Paribas Sécurité ou BNP Paribas Sécurité Plus, la franchise vous est remboursée, \n\nvotre responsabilité est illimitée en cas de faute lourde, d'opposition tardive ou d'utilisation frauduleuse de la carte par un membre de votre famille, \n\nen cas d'utilisation frauduleuse sans dépossession de la carte (achats à distance ou contrefaçon), vous êtes remboursé du montant de la fraude et des frais correspondants (frais d'opposition, intérêts et commissions) \n\n"""
  },
  {
    "title": "Servises associés",
    "text":
        """Accés aux automates BNP Paribas\n Visa Electron vous permet de vous identifier budes automates BNP Paribas pour accéder aux fonctionnalités suivantes \nDépôt de billets,\nImprimante libre-service: historiques, ✓ éditions de soldes et de RIB, commandes de chéquiers, \n✓ Remise de chèques. \nPaylib\n Paylib est une nouvelle façon gratuite de régler ses achats en ligne depuis un ordinateur, une tablette ou un smartphone. Simple et sécurisée, cette solution de paiement en ligne permet de concrétiser ses transactions sans saisir les données de votre carte Visa Electron. """
  },
  {
    "title": "Clôture",
    "text":
        """La gamme BNP Paribas est conçue pour répondre a vos exigences: si vous estimez que la carte Visa Electron n'est plus adaptée à vos besoins, si ceux-ci ont évolué, n'hésitez pas à faire appel à votre Conseiller en agence. """
  },
  {
    "title": "Tarif",
    "text": "Carte Visa Electron: 38 €/an\n-50% sur la 2ème carte."
  },
];








//TODO CARTE PREMIER
/* 
La Carte Visa Premier en détail
Retrouvez tout ce que vous voulez savoir sur
la carte Visa Premier.

La Carte Visa Classic en détail

Retrouvez tout ce que vous voulez savoir sur
la Carte Visa Classic.
Comment souscrire ?


 */