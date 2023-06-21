part of game;

class CustomiseCharacterPage1 extends StatelessWidget {
  const CustomiseCharacterPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Widget> fields = [];
    for (int i = 1; i < 4; i++) {
      fields.addAll([
        const SizedBox(height: 50),
        TextButton(
          onPressed: () {},
          child: Image(
            image: AssetImage('cfield_$i.png'),
          ),
        ),
      ]);
    }
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage('space_bg.png'),
                fit: BoxFit.cover,
              ),
            ),
/*             const Positioned(
              top: 20,
              left: 20,
              child: Image(
                image: AssetImage('customise_char_title.png'),
              ),
            ), */
            Positioned(
              child: Column(
                children: [],
              ),
            ),
            // Positioned(child: child), // Sprite, colors, etc.
          ],
        ),
      ),
    );
  }
}
