library game;

import 'dart:ui';

import 'package:audioplayers/audioplayers.dart';
import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' hide Route;
import 'package:flutter/services.dart';
import 'package:audioplayers_web/audioplayers_web.dart';

part './sprites/mc_sprite.dart';
part './sprites/npc_sprite.dart';
part './sprites/guard_sprite.dart';
part './sprites/sprite_preview.dart';

part './elements/quiz_dialog.dart';
part './elements/item_dialog.dart';
part './elements/unlockable.dart';
part './elements/dialog_overlay.dart';
part './elements/inventory_overlay.dart';

part './maps/fullmap.dart';
part './maps/lab.dart';

part './screens/launch.dart';
part './screens/disclaimer.dart';
part './screens/intro_video.dart';
part './screens/customise_1.dart';
part './screens/customise_2.dart';

part './schemas/avatar.dart';
part './schemas/journey.dart';
part './schemas/profile.dart';

class STEMOdyssey extends FlameGame
    with HasCollisionDetection, HasKeyboardHandlerComponents {
  static const double tileSize = 48;
  final String mcImgSrc;
  final GameData? gameData;
  late RouterComponent routerComponent;
  String? unlockedItemName;
  String? unlockedItemSrc;

  STEMOdyssey({
    required this.mcImgSrc,
    required this.gameData,
  });

  Future<MCSprite> createMC(Vector2 position) async {
    return MCSprite(
      position: position,
      animation: SpriteAnimation.spriteList(
        await Future.wait(
          [1, 2].map(
            (i) => Sprite.load('mc_male_$i.png'),
          ),
        ),
        stepTime: 0.15,
      ),
      game: this,
    );
  }

  @override
  Future<void> onLoad() async {
    if (gameData == null) throw "GameData is null";
    routerComponent = RouterComponent(
      initialRoute: 'fullmap',
      routes: {
        'fullmap': Route(() => FullmapSprite(mcSprite: createMC)),
        'b_lab': Route(() => LabSprite(mcSprite: createMC)),
      },
    );

    addAll([
      routerComponent,
      GuardSprite(),
    ]);
  }
}

class GameData {
  final AvatarData avatarData;
  final JourneyData journeyData = JourneyData(unlockables: []);

  GameData({
    required this.avatarData,
  });
}

GameData? gameData;
final AudioPlayer audioPlayer = AudioPlayer();

void main() {
  gameData = GameData(
    avatarData: AvatarData(
      name: 'name',
      age: 10,
      subjects: [],
      universityDegrees: [],
      passions: [],
      male: true,
    ),
  );
  runApp(const OdysseyApp());
}

class OdysseyApp extends StatefulWidget {
  const OdysseyApp({super.key});

  @override
  State<StatefulWidget> createState() => OdysseyAppState();
}

class OdysseyAppState extends State<OdysseyApp> {
  @override
  void initState() {
    //audioPlayer.play(AssetSource('audio/milky_powdery_way.wav'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'STEM Odyssey',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        backgroundColor: Colors.black,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Material(child: STEMOdysseyLaunchPage()),
        '/disclaimer': (context) => const Material(child: DisclaimerPage()),
        '/intro': (context) => const Material(child: IntroVideoPage()),
        '/customise1': (context) =>
            const Material(child: CustomiseCharacterPage1()),
        '/customise2': (context) =>
            const Material(child: CustomiseCharacterPage2()),
        '/save': (context) => const Material(child: IntroVideoPage()),
        '/game': (context) => Material(
              child: GameWidget(
                game: STEMOdyssey(
                  mcImgSrc: 'images/mc_male_1.png',
                  gameData: gameData,
                ),
                overlayBuilderMap: {
                  'press_e_dialog': (context, game) {
                    return const DialogOverlay(
                        message: 'Press E to enter buildings!');
                  },
                  'press_i_dialog': (context, game) {
                    return const DialogOverlay(
                        message:
                            'Press I to interact with the NPCs and find out more about their jobs!');
                  },
                  'new_unlockable': (context, STEMOdyssey game) {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () {
                        game.overlays.remove('new_unlockable');
                        game.overlays.add('unlocked_item');
                      },
                    );
                    return const DialogOverlay(message: 'New item unlocked!');
                  },
                  'unlocked_item': (context, STEMOdyssey game) {
                    Future.delayed(
                      const Duration(seconds: 2),
                      () => game.overlays.remove('unlocked_item'),
                    );

                    return ItemDialog(
                      label: game.unlockedItemName!,
                      imgSrc: game.unlockedItemSrc!,
                      game: game,
                    );
                  },
                  'inventory_overlay': (context, STEMOdyssey game) {
                    return InventoryOverlay(
                      gameData: game.gameData!,
                      game: game,
                    );
                  },
                  'lab_quiz': (context, STEMOdyssey game) {
                    return QuizDialog(
                      message:
                          "Here's a question for you before you leave! Prosthetists are people that use prostheses to help people with physical disabilities. What materials are prosthetics commonly made of?",
                      options: const {
                        'carbon': true,
                        'iron': false,
                        'silicon': false,
                        'plastic': false,
                      },
                      closeOverlay: () {
                        Future.delayed(const Duration(seconds: 1), () {
                          game.unlockedItemSrc = 'images/test_tube_rack.png';
                          game.unlockedItemName = 'Test Tube Rack';
                          game.overlays.remove('lab_quiz');
                          game.overlays.add('new_unlockable');
                        });
                      },
                    );
                  },
                  'lab_info': (context, game) {
                    return const DialogOverlay(message: "Info");
                  },
                  'unlockable_inventory': (context, STEMOdyssey game) {
                    return Center(
                      child: Container(
                        width: 700,
                        height: 700,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Stack(
                          children: [
                            const Image(
                              image: AssetImage('images/inventory_preview.png'),
                              fit: BoxFit.cover,
                            ),
                            Positioned(
                              child: SpritePreview(
                                baseImg: game.mcImgSrc,
                                lastUnlockable: UnlockableItem(
                                  top: 2,
                                  left: 2,
                                  imgSrc: game.unlockedItemSrc!,
                                ),
                                unlockables:
                                    game.gameData!.journeyData.unlockables,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                },
              ),
            ),
      },
    );
  }

  @override
  void dispose() {
    audioPlayer.stop();
    super.dispose();
  }
}
