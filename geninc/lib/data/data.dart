// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:flutter/material.dart';
import 'package:geninc/model/person.dart';
import 'package:geninc/model/ville.dart';

const primaryColor = Color.fromARGB(255, 26, 188, 156);
const opacityPrimaryColor = Color.fromARGB(220, 26, 200, 156);
const secondaryColor = Color.fromARGB(255, 44, 53, 64);
const accentColor = Colors.amber; //fromARGB(255, 44, 53, 64);
List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

List<List<double>> ventes_jour_person = [
  [1, 3],
  [2, 1],
  [3, 4],
  [4, 0],
  [5, 5],
  [6, 4],
];
List<List<double>> ventes_semaine_person = [
  [1, 9],
  [2, 15],
  [3, 13],
  [4, 6],
  [5, 2],
  [6, 17],
  [7, 13],
  [8, 10],
];
List<List<double>> ventes_mois_person = [
  [1, 10],
  [2, 26],
  [3, 45],
  [4, 30],
  [5, 24],
  [6, 18],
  [7, 32],
  [8, 27],
  [9, 44],
  [10, 52],
  [11, 22],
  [12, 48],
];
List<List<double>> ventes_jour_group = [
  [1, 31],
  [2, 27],
  [3, 38],
  [4, 42],
  [5, 49],
  [6, 33],
];
List<List<double>> ventes_semaine_group = [
  [1, 122],
  [2, 155],
  [3, 138],
  [4, 160],
  [5, 189],
  [6, 120],
  [7, 140],
  [8, 200],
];
List<List<double>> ventes_mois_group = [
  [1, 430],
  [2, 520],
  [3, 400],
  [4, 620],
  [5, 550],
  [6, 489],
  [7, 566],
  [8, 703],
  [9, 498],
  [10, 529],
  [11, 398],
  [12, 809],
];

List<Person> personnes = [
  Person(key: UniqueKey(), name: "Guirasse"),
  Person(key: UniqueKey(), name: "Manu"),
  Person(key: UniqueKey(), name: "Yvan"),
  Person(key: UniqueKey(), name: "Augestin"),
  Person(key: UniqueKey(), name: "Salih"),
  Person(key: UniqueKey(), name: "Saad"),
  Person(key: UniqueKey(), name: "Jorik"),
];

List<Map<String, Object>> ITEMS_DRAWER = [
  {'title': 'Terrain', 'routeName': '/terrain', 'icon': Icons.place_rounded},
  {
    'title': 'Statistiques',
    'routeName': '/stat',
    'icon': Icons.stacked_line_chart_rounded
  },
  {'title': 'Mombres', 'routeName': '/members', 'icon': Icons.person},
];

const VISITEE = 'visité';
const NON_VISITEE = 'non visité';
const EN_COUR_DE_VISITE = 'en cour de visite';
const ALL = "tout";
const SEMAINE = "semaine";
const JOUR = "jour";
const MOIS = "mois";

List<Ville> VILLES = [
  Ville(
    name: 'Argenteuil',
    code: 78370,
    statut: NON_VISITEE,
    progression: 0,
    visites: 0,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.sP5pWB0HSl4pwugkSH18fgHaE8%26pid%3DApi&f=1',
  ),
  Ville(
    name: 'Aubervilier',
    code: 78370,
    statut: NON_VISITEE,
    progression: 0,
    visites: 0,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.sP5pWB0HSl4pwugkSH18fgHaE8%26pid%3DApi&f=1',
  ),
  Ville(
    name: 'Aitry',
    code: 78370,
    statut: NON_VISITEE,
    progression: 0,
    visites: 0,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.sP5pWB0HSl4pwugkSH18fgHaE8%26pid%3DApi&f=1',
  ),
  Ville(
    name: 'Versailles',
    code: 78370,
    statut: VISITEE,
    progression: 0,
    visites: 0,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.RBVcFPzm9Ap8DJclNd3UZwHaDt%26pid%3DApi&f=1',
  ),
  Ville(
    name: 'Châteaufort',
    code: 78370,
    statut: NON_VISITEE,
    progression: 0,
    visites: 0,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.LK2m9scZfF4ZbgzciodhbwHaFP%26pid%3DApi&f=1',
  ),
  Ville(
    name: 'Rosay',
    code: 78370,
    statut: EN_COUR_DE_VISITE,
    progression: 0,
    visites: 0,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse2.mm.bing.net%2Fth%3Fid%3DOIP.vrr4FbKJkR4oUQCbPx8IOwAAAA%26pid%3DApi&f=1',
  ),
  Ville(
    name: 'Noisy-le-Roi',
    code: 78370,
    statut: NON_VISITEE,
    progression: 0,
    visites: 0,
    imageUrl:
        'https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.7zpC9xx3SHrGmBDeat6dDAHaE6%26pid%3DApi&f=1',
  ),
];

List<Map<String, List<Ville>>> HOLELIST = [];
