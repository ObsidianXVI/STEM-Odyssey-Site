part of game;

class NPCSprite extends SpriteComponent
    with CollisionCallbacks, HasGameRef<STEMOdyssey> {
  final String imgSrc;

  NPCSprite({
    required this.imgSrc,
    required super.position,
  }) : super(
          size: Vector2.all(STEMOdyssey.tileSize),
        );

  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load(imgSrc);
    add(
      RectangleHitbox(
        position: position,
        size: size,
        isSolid: true,
      ),
    );
  }

  @override
  void onCollision(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollision(intersectionPoints, other);
    print('colliso!');
    if (other is ScreenHitbox) {
      //
    } else if (other is MCSprite) {
      print('tocuhed!');
      game.overlays.add('press_n_dialog');
      Future.delayed(
        const Duration(seconds: 2),
        () => game.overlays.remove('press_n_dialog'),
      );
    }
  }
}
