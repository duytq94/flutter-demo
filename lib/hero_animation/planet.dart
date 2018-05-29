import 'package:meta/meta.dart';

class Planet {
  final String name;
  final String description;
  final String imagePath;

  Planet({@required this.name, @required this.description, @required this.imagePath});
}

class ListPlanet {
  List<Planet> planets;

  ListPlanet({@required this.planets});
}

final listPlanet = new ListPlanet(planets: [
  new Planet(
      name: 'Mercury',
      description:
          "Like Venus, Mercury orbits the Sun within Earth's orbit as an inferior planet, and never exceeds 28° away from the Sun. When viewed from Earth, this proximity to the Sun means the planet can only be seen near the western or eastern horizon during the early evening or early morning. At this time it may appear as a bright star-like object, but is often far more difficult to observe than Venus. The planet telescopically displays the complete range of phases, similar to Venus and the Moon, as it moves in its inner orbit relative to Earth, which reoccurs over the so-called synodic period approximately every 116 days.",
      imagePath: 'images/ic_mercury.png'),
  new Planet(
      name: 'Venus',
      description:
          "Venus is the second planet from the Sun, orbiting it every 224.7 Earth days.[12] It has the longest rotation period (243 days) of any planet in the Solar System and rotates in the opposite direction to most other planets (meaning the Sun would rise in the west and set in the east).[13] It does not have any natural satellites. It is named after the Roman goddess of love and beauty. It is the second-brightest natural object in the night sky after the Moon, reaching an apparent magnitude of −4.6 – bright enough to cast shadows at night and, rarely, visible to the naked eye in broad daylight. Orbiting within Earth's orbit, Venus is an inferior planet and never appears to venture far from the Sun; its maximum angular distance from the Sun (elongation) is 47.8°.",
      imagePath: 'images/ic_venus.png'),
  new Planet(
      name: 'Mars',
      description:
          'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System after Mercury. In English, Mars carries a name of the Roman god of war, and is often referred to as the "Red Planet" because the reddish iron oxide prevalent on its surface gives it a reddish appearance that is distinctive among the astronomical bodies visible to the naked eye.[16] Mars is a terrestrial planet with a thin atmosphere, having surface features reminiscent both of the impact craters of the Moon and the valleys, deserts, and polar ice caps of Earth.',
      imagePath: 'images/ic_mars.png'),
  new Planet(
      name: 'Jupiter',
      description:
          "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a giant planet with a mass one-thousandth that of the Sun, but two-and-a-half times that of all the other planets in the Solar System combined. Jupiter and Saturn are gas giants; the other two giant planets, Uranus and Neptune are ice giants. Jupiter has been known to astronomers since antiquity. The Romans named it after their god Jupiter. When viewed from Earth, Jupiter can reach an apparent magnitude of −2.94, bright enough for its reflected light to cast shadows, and making it on average the third-brightest object in the night sky after the Moon and Venus.",
      imagePath: 'images/ic_jupiter.png'),
  new Planet(
      name: 'Saturn',
      description:
          "Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius about nine times that of Earth. It has only one-eighth the average density of Earth, but with its larger volume Saturn is over 95 times more massive. Saturn is named after the Roman god of agriculture; its astronomical symbol (♄) represents the god's sickle.",
      imagePath: 'images/ic_saturn.png'),
  new Planet(
      name: 'Uranus',
      description:
          'Uranus is the seventh planet from the Sun. It has the third-largest planetary radius and fourth-largest planetary mass in the Solar System. Uranus is similar in composition to Neptune, and both have different bulk chemical composition from that of the larger gas giants Jupiter and Saturn. For this reason, scientists often classify Uranus and Neptune as "ice giants" to distinguish them from the gas giants',
      imagePath: 'images/ic_uranus.png'),
  new Planet(
      name: 'Neptune',
      description:
          "Neptune is the eighth and farthest known planet from the Sun in the Solar System. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. Neptune is 17 times the mass of Earth and is slightly more massive than its near-twin Uranus, which is 15 times the mass of Earth and slightly larger than Neptune. Neptune orbits the Sun once every 164.8 years at an average distance of 30.1 AU (4.5 billion km). It is named after the Roman god of the sea and has the astronomical symbol ♆, a stylised version of the god Neptune's trident.",
      imagePath: 'images/ic_neptune.png'),
  new Planet(
      name: 'Moon',
      description:
          "The Moon is an astronomical body that orbits planet Earth and is Earth's only permanent natural satellite. It is the fifth-largest natural satellite in the Solar System, and the largest among planetary satellites relative to the size of the planet that it orbits (its primary). The Moon is after Jupiter's satellite Io the second-densest satellite in the Solar System among those whose densities are known.",
      imagePath: 'images/ic_moon.png'),
]);
