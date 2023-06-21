part of game;

class MCSprite extends SpriteAnimationComponent
    with CollisionCallbacks, KeyboardHandler {
  //BuilsingS? buildingSprite;
  final STEMOdyssey game;
  Vector2? lastPos;

  MCSprite({
    required super.animation,
    required this.game,
    required super.position,
  }) : super(
          size: Vector2.all(STEMOdyssey.tileSize),
        );

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    if (other is ScreenHitbox) {
      position = intersectionPoints.first;
    }
    /*  else if (other is BuildingSprite) {
      game.overlays.add('press_e_to_enter');
      timedAction(2, () {
        game.overlays.remove('press_e_to_enter');
      });
      buildingSprite = other;
      position = intersectionPoints.first;
    } */
  }

  @override
  Future<void> onLoad() async {
    playing = false;
    addAll([
      RectangleHitbox(
        position: position,
        size: size,
        isSolid: true,
      ),
      KeyboardListenerComponent(
        keyUp: {
          LogicalKeyboardKey.keyA: (keysPressed) {
            playing = false;
            return true;
          },
          LogicalKeyboardKey.keyD: (keysPressed) {
            playing = false;
            return true;
          },
          LogicalKeyboardKey.keyW: (keysPressed) {
            playing = false;

            return true;
          },
          LogicalKeyboardKey.keyS: (keysPressed) {
            playing = false;
            return true;
          },
        },
        keyDown: {
          LogicalKeyboardKey.keyE: (keysPressed) {
            game.routerComponent.pushReplacementNamed('b_lab');
            game.camera.followComponent(this);
            return true;
          },
          LogicalKeyboardKey.keyX: (keysPressed) {
            if (game.routerComponent.currentRoute.name!.startsWith('b_')) {
              game.routerComponent.pushReplacementNamed('fullmap');
            }
/*             position = Vector2(
              STEMOdyssey.tileSize * 124,
              STEMOdyssey.tileSize * 80,
            ); */
            game.camera.followComponent(this);
            return true;
          },
          LogicalKeyboardKey.keyA: (keysPressed) {
            position.add(Vector2(-(STEMOdyssey.tileSize / 2), 0));
            playing = true;
            return true;
          },
          LogicalKeyboardKey.keyD: (keysPressed) {
            position.add(Vector2((STEMOdyssey.tileSize / 2), 0));
            playing = true;
            return true;
          },
          LogicalKeyboardKey.keyW: (keysPressed) {
            position.add(Vector2(0, -(STEMOdyssey.tileSize / 2)));
            playing = true;
            return true;
          },
          LogicalKeyboardKey.keyS: (keysPressed) {
            position.add(Vector2(0, (STEMOdyssey.tileSize / 2)));
            playing = true;
            return true;
          },
          LogicalKeyboardKey.keyG: (keysPressed) {
            if (game.overlays.isActive('lab_quiz')) {
              game.overlays.remove('lab_quiz');
            } else {
              game.overlays.add('lab_quiz');
            }
            return true;
          },
        },
      ),
    ]);
    game.camera.followComponent(this);
  }
}
