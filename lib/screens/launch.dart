part of game;

class STEMOdysseyLaunchPage extends StatelessWidget {
  const STEMOdysseyLaunchPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed('/disclaimer');
          },
          child: const Image(
            image: AssetImage('launch_img.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
