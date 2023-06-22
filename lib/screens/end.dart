part of game;

class EndPage extends StatelessWidget {
  const EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const Center(
          child: Image(
            image: AssetImage('images/thank.png'),
          ),
        ),
      ),
    );
  }
}
