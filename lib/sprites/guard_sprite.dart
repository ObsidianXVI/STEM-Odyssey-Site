part of game;

class GuardSprite extends SpriteComponent {
  GuardSprite()
      : super(
          size: Vector2.all(STEMOdyssey.tileSize),
          position: Vector2(
            STEMOdyssey.tileSize * 125,
            STEMOdyssey.tileSize * 80,
          ),
        );
  @override
  Future<void> onLoad() async {
    sprite = await Sprite.load('npc_guard.png');
  }
}
