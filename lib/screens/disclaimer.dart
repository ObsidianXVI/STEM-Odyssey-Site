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
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 400,
                  right: 400,
                ),
                child: RichText(
                  textAlign: TextAlign.left,
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'Disclaimer:\n',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.red,
                        ),
                      ),
                      TextSpan(
                        text:
                            """Hello, Traveller welcome to STEM Odyssey! As you explore our platform and the various STEM (Science, Technology, Engineering, and Mathematics) jobs on display, please take note that this map is presently in its developmental stages and as such only reflects jobs within the Healthcare industry. The careers reflected in this game are also entry-level jobs reqiring entry-level educational requirements across all 4 domains of STEM, and are a non-exhaustive list of possible careers open in the Healthcare space. While every effort has been made to ensure both completeness and accuracy of careers presented, any issues encountered can be reported to our development team. Thank you and we hope you have an enriching journey with us!""",
                        style: TextStyle(
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
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
