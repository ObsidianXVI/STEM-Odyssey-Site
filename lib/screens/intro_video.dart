part of game;

class IntroVideoPage extends StatefulWidget {
  const IntroVideoPage({super.key});

  @override
  State<StatefulWidget> createState() => IntroVideoPageState();
}

class IntroVideoPageState extends State<IntroVideoPage> {
  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 47),
      () => Navigator.of(context).pushNamed('/customise1'),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: const Image(
          image: AssetImage('intro_video_final.gif'),
        ),
      ),
    );
  }
}
