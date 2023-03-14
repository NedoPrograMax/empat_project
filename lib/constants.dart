import 'package:empat_app/models/categories.dart';
import 'package:empat_app/models/category.dart';
import 'package:empat_app/models/movie.dart';
import 'package:empat_app/widgets/favorite/favorite_screen.dart';
import 'package:empat_app/widgets/home/home_screen.dart';
import 'package:flutter/material.dart';

const tabItems = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_outlined),
    activeIcon: Icon(Icons.home),
    label: "Home",
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.favorite_outline),
    activeIcon: Icon(Icons.favorite),
    label: "Favorite",
  ),
];

const tabs = [
  HomeScreen(),
  FavoriteScreen(),
];

const categories = [
  Category(
    color: Colors.red,
    type: Categories.Action,
  ),
  Category(
    color: Colors.blue,
    type: Categories.Drama,
  ),
  Category(
    color: Colors.amber,
    type: Categories.Comedy,
  ),
];

const constMovies = [
  Movie(
    id: 1,
    title: "Ghostbusters",
    imageAsset: "assets\\images\\ghostbusters.jpg",
    description:
        "Three parapsychologists forced out of their university funding set up shop as a unique ghost removal service in New York City, attracting frightened yet skeptical customers.",
    category: Categories.Comedy,
  ),
  Movie(
    id: 2,
    title: "Police Academy",
    imageAsset: "assets\\images\\police_academy.jpg",
    description:
        "A group of good-hearted, but incompetent misfits enter the police academy, but the instructors there are not going to put up with their pranks.",
    category: Categories.Comedy,
  ),
  Movie(
    id: 3,
    title: "The Naked Gun",
    imageAsset: "assets\\images\\naked_gun.jpg",
    description:
        "Incompetent police Detective Frank Drebin must foil an attempt to assassinate Queen Elizabeth II.",
    category: Categories.Comedy,
  ),
  Movie(
    id: 4,
    title: "Johny English",
    imageAsset: "assets\\images\\johny_english.jpg",
    description:
        "After a sudden attack on MI5, Johnny English, Britain's most confident, yet unintelligent spy, becomes Britain's only spy.",
    category: Categories.Comedy,
  ),
  Movie(
    id: 5,
    title: "Men in Black",
    imageAsset: "assets\\images\\men_in_black.jpg",
    description:
        "A police officer joins a secret organization that polices and monitors extraterrestrial interactions on Earth.",
    category: Categories.Action,
  ),
  Movie(
    id: 6,
    title: "Le gendarme de Saint-Tropezk",
    imageAsset: "assets\\images\\Le_gendarme_de_Saint-Tropez.jpg",
    description:
        "Gendarme Ludovic Cruchot is re-assigned to the French Riviera seaside resort town of Saint-Tropez where petty criminals and his own daughter give him a hard time.",
    category: Categories.Comedy,
  ),
  Movie(
    id: 7,
    title: "The Godfather",
    imageAsset: "assets\\images\\the_godfather.jpg",
    description:
        "The aging patriarch of an organized crime dynasty in postwar New York City transfers control of his clandestine empire to his reluctant youngest son.",
    category: Categories.Drama,
  ),
];
