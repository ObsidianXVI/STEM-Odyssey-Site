part of game;

class CustomiseCharacterPage2 extends StatelessWidget {
  const CustomiseCharacterPage2({super.key});

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
              top: 275,
              left: 50,
              width: 600,
              child: Column(
                children: [
                  TextField(
                    onSubmitted: (value) => print(value),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 110),
                  TextField(
                    onSubmitted: (value) => print(value),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 110),
                  TextField(
                    onSubmitted: (value) => print(value),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(child: child), // Sprite, colors, etc.
          ],
        ),
      ),
    );
  }
}
