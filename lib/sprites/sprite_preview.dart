part of game;

class SpritePreview extends StatelessWidget {
  final String baseImg;
  final UnlockableItem lastUnlockable;
  final List<UnlockableItem> unlockables;

  const SpritePreview({
    required this.baseImg,
    required this.lastUnlockable,
    required this.unlockables,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      height: 80,
      child: Stack(
        children: [
          Positioned.fill(
            child: Image(
              image: AssetImage(baseImg),
              fit: BoxFit.cover,
            ),
          ),
          ...unlockables,
        ],
      ),
    );
  }
}

class UnlockableItem extends StatelessWidget {
  final String imgSrc;
  final double? left;
  final double? bottom;
  final double? right;
  final double? top;

  const UnlockableItem({
    required this.imgSrc,
    this.left,
    this.right,
    this.bottom,
    this.top,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: bottom,
      left: left,
      top: top,
      right: right,
      child: Image(
        image: AssetImage(imgSrc),
      ),
    );
  }
}
