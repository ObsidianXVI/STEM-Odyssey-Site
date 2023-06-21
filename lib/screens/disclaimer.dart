part of game;

class DisclaimerPage extends StatelessWidget {
  const DisclaimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.black,
        child: Stack(
          children: [
            const Center(
              child: Image(
                image: AssetImage('info_pane.png'),
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: RichText(
                textAlign: TextAlign.left,
                text: const TextSpan(
                  children: [
                    TextSpan(text: 'Disclaimer:\n'),
                    TextSpan(text: 'A:\n'),
                    TextSpan(text: 'B:\n'),
                    TextSpan(text: 'C:\n'),
                    TextSpan(text: 'D:\n'),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              right: 50,
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/intro');
                },
                child: Container(
                  width: 100,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
