import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doc_ueberall/model/kapitelInhalte.dart';
import 'package:doc_ueberall/model/kapitels.dart';
import 'package:rxdart/rxdart.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseKepitelsDataSource {
  final Firestore fStore;

  final BehaviorSubject<Kapitels> _kepitolsSubject = BehaviorSubject();

  Stream<Kapitels> get outKapitels => _kepitolsSubject.stream;

  FirebaseKepitelsDataSource(this.fStore) {
    SharedPreferences.getInstance().then((prefs) {
      var kapitelsString = prefs.getString('kapitels');
      fStore
          .collection("kapitel")
          .document('OQ19KZA1blQPOqI9FhRD')
          .snapshots()
          .listen((querySnapshot) {
        if (querySnapshot.exists) {
          var kapitelsRemote = Kapitels.fromJson(querySnapshot.data);
          _kepitolsSubject.sink.add(kapitelsRemote);
        } else if (kapitelsString != null) {
          var kapitelsLocal = Kapitels.fromJson(json.decode(kapitelsString));
          _kepitolsSubject.sink.add(kapitelsLocal);
        } else {
          _kepitolsSubject.sink.add(kapitelsDefault);
        }
      });
    });
  }

  void dispose() {
    _kepitolsSubject.drain();
  }
}

Kapitels kapitelsDefault = Kapitels(kepitols: [
  Kapitel(
      id: '8e2294c059d111eb9168931778d09dbc',
      prio: 1,
      header: 'Erstes',
      kapitel: 'Reise',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: 'fa16a6da2b97421bb618c71c17f3aa1b',
            prio: 1,
            themengebiet: 'Reisevorbereitungen',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '2ceefd5ea7f74ede86f3e15044ee4c5b',
            prio: 2,
            themengebiet: 'Reisen bei Vorerkrankungen',
            header: 'Zweites'),
      ]),
  Kapitel(
      id: 'd1c30cf059d111eb9e1ecf3e549c3962',
      prio: 2,
      header: 'Zweites',
      kapitel: 'Kleine Medikamentenkunde',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '38277f0cc1d04b87af4e173953e40a49',
            prio: 1,
            themengebiet: 'Kleine Medikamentenkunde',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '69695250ed83405d876738411bb47643',
            prio: 2,
            themengebiet: 'Anwendungsweisen',
            header: 'Zweites'),
        KapitelzInhalte(
            id: '788d3f5ad0134a03816b2d1e7ab88d3a',
            prio: 3,
            themengebiet: 'Medikamente',
            header: 'Drittes'),
        KapitelzInhalte(
            id: '2badaa9033ed4f4cb93068e6c27536be',
            prio: 4,
            themengebiet: 'Mikrobiologische Medikamente',
            header: 'Viertes'),
        KapitelzInhalte(
            id: '30e73f79cb1e4e7e9e08d1679015a1d3',
            prio: 5,
            themengebiet: 'Schmerzmittel und fiebersenkende Mittel',
            header: 'Fünftes'),
        KapitelzInhalte(
            id: '3f3e805d1dbb4badb69de02d39d36eb1',
            prio: 6,
            themengebiet: 'Entzündungshemmende Mittel',
            header: 'Sechste'),
      ]),
  Kapitel(
      id: 'e93bf63059d111eb9e1ecf3e549c3962',
      prio: 3,
      header: 'Drittes',
      kapitel: 'Tiere und Pflanzen',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: 'fa341e970e9e46d68176347f6b2e5b1b',
            prio: 1,
            themengebiet: 'Tiere und Pflanzen',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '560f91dc97ad41cf875ca5283a35a710',
            prio: 2,
            themengebiet: 'Insektenstiche und -bisse',
            header: 'Zweites'),
        KapitelzInhalte(
            id: '6f15ff4d5c8646aa93a6b5298e2596eb',
            prio: 3,
            themengebiet: 'Verletzungen durch Meerestiere',
            header: 'Drittes'),
        KapitelzInhalte(
            id: 'c59070c38d54445baa43233ae44b22aa',
            prio: 4,
            themengebiet: 'Pflanzen',
            header: 'Viertes'),
      ]),
  Kapitel(
      id: 'f8f7d30059d111eb9168931778d09dbc',
      prio: 4,
      header: 'Viertes',
      kapitel: 'Sport',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: 'c05fe70f48684e248b0f6f3cd05450d1',
            prio: 1,
            themengebiet: 'Sportverletzungen',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '53ab55b3e0c0429583746647f972448b',
            prio: 2,
            themengebiet: 'Bergsport',
            header: 'Zweites'),
        KapitelzInhalte(
            id: '6a48b2d65c0744a0aa8a015ee27df67b',
            prio: 3,
            themengebiet: 'Laufen',
            header: 'Drittes'),
        KapitelzInhalte(
            id: '8b010d4c714542ecb82e021ab21c51a8',
            prio: 4,
            themengebiet: 'Radsport',
            header: 'Viertes'),
        KapitelzInhalte(
            id: '7b9900276e93427d877b4cd3a359f7a4',
            prio: 5,
            themengebiet: 'Wintersport',
            header: 'Fünftes'),
        KapitelzInhalte(
            id: '958f35ff9cea4ac3914bf00fb767bc66',
            prio: 6,
            themengebiet: 'Tennis und Squash',
            header: 'Sechste'),
        KapitelzInhalte(
            id: 'ac7f205d7f054041b585968d5b2fce42',
            prio: 7,
            themengebiet: 'Wassersport',
            header: 'Siebte'),
      ]),
  Kapitel(
      id: '0de30c8059d211eb9168931778d09dbc',
      prio: 5,
      header: 'Fünftes',
      kapitel: 'Physikalische Beeinträchtigungen',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: 'e6d6b2a0cfa94d899ce5a381f2f5cbb6',
            prio: 1,
            themengebiet: 'Hitze',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '0b1f53a7c67344f6b5342734b450ec7c',
            prio: 2,
            themengebiet: 'Kälte',
            header: 'Zweites'),
        KapitelzInhalte(
            id: '5878ef581420445bb03ad3305fdd10e3',
            prio: 3,
            themengebiet: 'Reisekrankheiten',
            header: 'Drittes'),
      ]),
  Kapitel(
      id: '1e62877059d211eb9168931778d09dbc',
      prio: 6,
      header: 'Sechste',
      kapitel: 'Infektionen, Erkältungen & Entzündungen',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: 'd169e3d485ac47d09d6b160dbd99b9ea',
            prio: 1,
            themengebiet: 'Alltags-Infektionen unterwegs',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '3e099d9d21ed47f2acc66c60155b2016',
            prio: 2,
            themengebiet: 'Erkältungskrankheiten',
            header: 'Zweites'),
        KapitelzInhalte(
            id: '1ec9942fd0444e5d933a822f0f8af454',
            prio: 3,
            themengebiet: 'Entzündungen',
            header: 'Drittes'),
      ]),
  Kapitel(
      id: '33e8a16059d211eb9e1ecf3e549c3962',
      prio: 7,
      header: 'Siebte',
      kapitel: 'Schmerzen',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: 'f0a1df9e68094f9ebb1dd9f31b44437d',
            prio: 1,
            themengebiet: 'Schmerzen',
            header: 'Erstes'),
      ]),
  Kapitel(
      id: '462c3a8059d211eb9168931778d09dbc',
      prio: 8,
      header: 'Achte',
      kapitel: 'Verletzungen',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '1edd144602074ac291b368f6816158ec',
            prio: 1,
            themengebiet: 'Augenverletzungen',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '85297a1e9ae74c1bb93d9736e6ae2b20',
            prio: 2,
            themengebiet: 'Blutungen, Beulen & Blutergüsse',
            header: 'Zweites'),
        KapitelzInhalte(
            id: '2b9a567341db42a4831b73310d790380',
            prio: 3,
            themengebiet: 'Wunden',
            header: 'Drittes'),
      ]),
  Kapitel(
      id: '5a359f8059d211eb9e1ecf3e549c3962',
      prio: 9,
      header: 'Neunte',
      kapitel: 'Kreislaufstörungen / Schwindel',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: 'b115d7a3ec0845879fde7e5c7d6b900d',
            prio: 1,
            themengebiet: 'Kreislaufstörungen / Schwindel',
            header: 'Erstes'),
      ]),
  Kapitel(
      id: '6d5c93c059d211eb9168931778d09dbc',
      prio: 10,
      header: 'Zehnte',
      kapitel: 'Infektionskrankheiten und Impfungen',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '1c68ea76f880445ea11f4f41ac44f650',
            prio: 1,
            themengebiet: 'Impfungen',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '1de01e8248184d55a43bd0a305ea9007',
            prio: 2,
            themengebiet: 'Allgegenwärtige Infektionskrankheiten',
            header: 'Zweites'),
        KapitelzInhalte(
            id: 'a94faf4b4e134d5bad0d4b47fcb02541',
            prio: 3,
            themengebiet: 'Seltene Infektionskrankheiten',
            header: 'Drittes'),
        KapitelzInhalte(id: '', prio: 4, themengebiet: '', header: 'Viertes'),
      ]),
  Kapitel(
      id: '7f02664059d211eb9168931778d09dbc',
      prio: 11,
      header: 'Elfte',
      kapitel: 'Notfälle',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '4891d3db04e54ca8a7c62d8b43050e79',
            prio: 1,
            themengebiet: 'Notfälle',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '545620aa2aea4666a1b40322d6b1ba73',
            prio: 2,
            themengebiet: 'Atemwege',
            header: 'Zweites'),
        KapitelzInhalte(
            id: '661ab706ea6a4989a1938191e16d866e',
            prio: 3,
            themengebiet: 'Bauchschmerzen',
            header: 'Drittes'),
        KapitelzInhalte(
            id: '77bb81e7e61640c6a16b2995808244b0',
            prio: 4,
            themengebiet: 'Psychische Ausnahmezustände',
            header: 'Viertes'),
        KapitelzInhalte(
            id: 'e0efca05d2584f2aabf2e914b8799959',
            prio: 5,
            themengebiet: 'Schock',
            header: 'Fünftes'),
        KapitelzInhalte(
            id: '15731ea1845a48aca0f3ee3f29764c35',
            prio: 6,
            themengebiet: 'Stromverletzungen',
            header: 'Sechste'),
        KapitelzInhalte(
            id: '6122ea2cc2584bc88ed05af547a6429b',
            prio: 7,
            themengebiet: 'Verletzungen',
            header: 'Siebte'),
        KapitelzInhalte(
            id: 'c8dabb4d9bfb4ff4be3a12974982515a',
            prio: 8,
            themengebiet: 'Extremitätenverletzungen',
            header: 'Achte'),
      ]),
  Kapitel(
      id: '922d793059d211eb9168931778d09dbc',
      prio: 12,
      header: 'Zwölfte',
      kapitel: 'Techniken und Handgriffe',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '87ecb42bfc67431ba85b31ed099a3b4b',
            prio: 1,
            themengebiet: 'Wer darf was?',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '34c5096043f8481793473d93f8d7cce5',
            prio: 2,
            themengebiet: 'Injektionstechniken',
            header: 'Zweites'),
        KapitelzInhalte(
            id: 'b6974c4728564406b2bb6d85027d880f',
            prio: 3,
            themengebiet: 'Verbände',
            header: 'Drittes'),
      ]),
  Kapitel(
      id: 'a4cf10d059d211eb9e1ecf3e549c3962',
      prio: 13,
      header: 'Dreizehnte',
      kapitel: 'Erste Hilfe',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '1967807928e248209b56e5a0553a2ada',
            prio: 1,
            themengebiet: 'Erste Hilfe und Sofortmaßnahmen',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '4c55cc7df0df476da597227e5ba88e25',
            prio: 2,
            themengebiet: 'Blutstillung',
            header: 'Zweites'),
        KapitelzInhalte(
            id: '3532b406cbf94441a7f819a0b516b81e',
            prio: 3,
            themengebiet: 'Brüche und Verletzungen',
            header: 'Drittes'),
        KapitelzInhalte(
            id: '792718cad0a844fe99e5986c8f38c580',
            prio: 4,
            themengebiet: 'Lagerung',
            header: 'Viertes'),
      ]),
  Kapitel(
      id: 'b588ae9059d211eb9168931778d09dbc',
      prio: 14,
      header: 'Vierzehnte',
      kapitel: 'Regionale Gesundheitsrisiken',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '484a2f0a98904157a1a0ef47c3c0bc3e',
            prio: 1,
            themengebiet: 'Regionale Gesundheitsrisiken',
            header: 'Erstes'),
        KapitelzInhalte(
            id: '419e7c5fd208474b802d0a0220db228c',
            prio: 2,
            themengebiet: 'Afrika',
            header: 'Zweites'),
        KapitelzInhalte(
            id: 'badcfec500074f6f9c8ca2338eb9c0ad',
            prio: 3,
            themengebiet: 'Amerika',
            header: 'Drittes'),
        KapitelzInhalte(
            id: '7e04fc01ef0d45b19916976ce6ff8c5d',
            prio: 4,
            themengebiet: 'Asien',
            header: 'Viertes'),
        KapitelzInhalte(
            id: 'd3bfe5aee1af4d17a43bdb050ef7cbbc',
            prio: 5,
            themengebiet: 'Europa',
            header: 'Fünftes'),
        KapitelzInhalte(
            id: 'c84389d5e2414f038babed7aafec21a6',
            prio: 6,
            themengebiet: 'Ozeanien',
            header: 'Sechste'),
      ]),
  Kapitel(
      id: 'd2a0a64059d211eb9e1ecf3e549c3962',
      prio: 15,
      header: 'Fünfzehnte',
      kapitel: 'Malariasituation und Impfvorschriften nach Ländern',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '47e3e4c1d08e4b1fb4985ae9451a6010',
            prio: 1,
            themengebiet: 'Malariasituation und Impfvorschriften nach Ländern',
            header: 'Erstes'),
      ]),
  Kapitel(
      id: 'faa9853059d211eb9168931778d09dbc',
      prio: 16,
      header: 'sechzehnte',
      kapitel: 'Autorisierte Gelbfieberimpfstellen',
      description:
          'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
      kapitelInhaltes: [
        KapitelzInhalte(
            id: '8c463e2a36394411add68fd7429d8d11',
            prio: 1,
            themengebiet: 'Autorisierte Gelbfieberimpfstellen',
            header: 'Erstes'),
      ]),
]);
