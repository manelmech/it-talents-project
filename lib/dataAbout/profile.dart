

import 'package:flutter/material.dart';
import 'package:ittalentsproject/modelsAbout/profile.dart';

final Profile profile = Profile(
    titre1: 'DÉCOUVREZ VOS TALENTS!',
    titre2: 'Nos Profiles',
    titre3: 'Nos Réalisations',
  president: 'IT TALENT SCHOOL',
  about: 'IT Talents School est un établissement privé de formation professionnelle dans les domaines des TIC et de l’Informatique, du management et des langues. L’offre de formation d’IT Talents School s’adresse principalement aux organismes,entreprises et institutions.'
,

  backdropPhoto: 'imagesabout/istock.jpg',
  logo: 'imagesabout/it.png',
  location: '7, Rue Larbi Sid Ali – Kouba / ALGER',
  courses: [
    Course(
      title: 'Architectes base de données',
      thumbnail: 'imagesabout/database-5.jpg',

    ),
    Course(
      title: 'Experts en cyber sécurité',
      thumbnail: 'imagesabout/secure.jpg',

    ),
    Course(
      title: 'Experts en langue anglaise',
      thumbnail: 'imagesabout/images (1).jpg',

    ),
    Course(
      title: 'Ingénieurs en génie logiciel',
      thumbnail: 'imagesabout/coder.jpg',

    )
  ],
    realisations: 
    [
      Realisation('imagesabout/graduate.png', '684+', 'Formations certifiés'),
      Realisation('imagesabout/laughing.png', '245+','Clients satisfaits'),
      Realisation('imagesabout/collaboration.png', '50+','Partenaires'),
    ]
);