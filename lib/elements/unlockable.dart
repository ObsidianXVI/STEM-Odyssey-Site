part of game;

class Unlockable extends StatefulWidget {
  final String imgSrc;
  const Unlockable({required this.imgSrc, super.key});
  @override
  State<StatefulWidget> createState() => UnlockableState();
}

class UnlockableState extends State<Unlockable>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(reverse: true);
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticIn,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 300),
          child: Container(
            width: 800,
            height: 100,
            child: Center(
              child: Image(
                image: AssetImage(widget.imgSrc),
              ),
            ),
          ),
        )
      ],
    );
  }
}
