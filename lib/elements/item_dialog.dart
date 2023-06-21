part of game;

class ItemDialog extends StatefulWidget {
  final String imgSrc;
  final String label;
  final STEMOdyssey game;

  const ItemDialog({
    required this.label,
    required this.imgSrc,
    required this.game,
  });

  @override
  State<StatefulWidget> createState() => ItemDialogState();
}

class ItemDialogState extends State<ItemDialog>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 1),
    vsync: this,
  );
  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: Offset.zero,
    end: const Offset(1.5, 0.0),
  ).animate(CurvedAnimation(
    parent: _controller,
    curve: Curves.easeInOutCirc,
  ));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Center(
        child: Container(
          width: 700,
          height: 700,
          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.label,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 70),
                Image(
                  image: AssetImage(widget.imgSrc),
                ),
                const SizedBox(height: 40),
                TextButton(
                  onPressed: () {
                    widget.game.overlays.add('overlayName');
                  },
                  child: const Text(
                    'Preview',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
