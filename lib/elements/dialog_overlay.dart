part of game;

class DialogOverlay extends StatelessWidget {
  final String message;

  const DialogOverlay({
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        height: 200,
        color: Colors.black.withOpacity(0.1),
        child: BackdropFilter(
          filter: ImageFilter.blur(
            sigmaX: 5,
            sigmaY: 5,
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 24,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
