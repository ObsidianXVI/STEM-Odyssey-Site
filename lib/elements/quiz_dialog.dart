part of game;

class QuizDialog extends StatelessWidget {
  final String message;
  final Map<String, bool> options;
  final Function closeOverlay;

  const QuizDialog({
    required this.message,
    required this.options,
    required this.closeOverlay,
  });

  @override
  Widget build(BuildContext context) {
    final Iterable<MapEntry<String, bool>> entries = options.entries;
    return Stack(
      children: [
        DialogOverlay(
          message: message,
        ),
        Center(
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 700,
              height: 400,
              child: Center(
                child: GridView.count(
                  primary: false,
                  crossAxisCount: 2,
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  childAspectRatio: 4 / 2,
                  children: List<QuizOption>.generate(4, (index) {
                    return QuizOption(
                      label: entries.elementAt(index).key,
                      isCorrect: entries.elementAt(index).value,
                      parent: this,
                    );
                  }),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class QuizOption extends StatefulWidget {
  final String label;
  final bool isCorrect;
  final QuizDialog parent;

  QuizOption({
    required this.label,
    required this.isCorrect,
    required this.parent,
  });

  @override
  State<StatefulWidget> createState() => QuizOptionState();
}

class QuizOptionState extends State<QuizOption> {
  Color color = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 200,
        height: 80,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Center(
          child: TextButton(
            onPressed: () {
              if (widget.isCorrect) {
                color = Colors.green;
                widget.parent.closeOverlay();
              } else {
                color = Colors.red;
              }
              setState(() {});
            },
            child: Text(
              widget.label,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 40,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
