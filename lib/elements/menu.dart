part of game;

class SideMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: 400,
        height: 1200,
        child: Stack(
          children: [
            const Positioned.fill(
              child: Image(
                image: AssetImage('images/side_menu.png'),
              ),
            ),
            Positioned(
              right: 20,
              top: 110,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 300,
                  height: 80,
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 260,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: 300,
                  height: 80,
                  color: Colors.red.withOpacity(0),
                ),
              ),
            ),
            Positioned(
              right: 20,
              top: 390,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed('/end');
                },
                child: Container(
                  width: 300,
                  height: 80,
                  color: Colors.red.withOpacity(0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
