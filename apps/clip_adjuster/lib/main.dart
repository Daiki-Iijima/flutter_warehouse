import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      title: 'ClipAdjuster',
      home: Scaffold(
        body: SafeArea(
          child: Center(child: BorderSampleWidget()),
        ),
      ),
    ),
  );
}

class BorderSampleState extends State<BorderSampleWidget> {
  double scaleOffset = 1;
  double xOffset = 0;
  double yOffset = 0;
  String imagePath = '';

  TextEditingController textEditingController = TextEditingController();

  void _changeOffsetSlider(double value) => setState(() {
        scaleOffset = value;
      });

  void _changeXOffsetSlider(double value) => setState(() {
        xOffset = value;
      });

  void _changeYOffsetSlider(double value) => setState(() {
        yOffset = value;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.8,
          margin: const EdgeInsets.only(left: 20, top: 10),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              labelText: '画像URL',
              border: const OutlineInputBorder(),
              prefixIcon: const Icon(Icons.image),
              suffixIcon: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  setState(() {
                    imagePath = '';
                    textEditingController.clear();
                  });
                },
              ),
            ),
            onChanged: (value) {
              setState(
                () {
                  imagePath = value;
                },
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          child: const Text(
            'サイズ',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Slider(
            label: '${scaleOffset.toStringAsFixed(1)}倍',
            divisions: 20,
            value: scaleOffset,
            min: 0.0,
            max: 10,
            onChanged: _changeOffsetSlider,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          child: const Text(
            'Xオフセット',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Slider(
            label: xOffset.toStringAsFixed(1),
            divisions: 100,
            value: xOffset,
            min: -500,
            max: 500,
            onChanged: _changeXOffsetSlider,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20, top: 10),
          child: const Text(
            'Yオフセット',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.8,
          child: Slider(
            label: yOffset.toStringAsFixed(1),
            divisions: 100,
            value: yOffset,
            min: -500,
            max: 500,
            onChanged: _changeYOffsetSlider,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.width * 0.5,
          margin: const EdgeInsets.only(left: 20, top: 10),
          color: Colors.red,
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(MediaQuery.of(context).size.width * 0.25),
            child: Transform.translate(
              offset: Offset(xOffset, yOffset),
              child: Transform.scale(
                scale: scaleOffset,
                child: Image.network(
                  imagePath,
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    // ここで代替の画像またはウィジェットを返す
                    return Image.asset(
                      'assets/images/placeholder.png',
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BorderSampleWidget extends StatefulWidget {
  const BorderSampleWidget({
    super.key,
  });

  @override
  State<StatefulWidget> createState() {
    return BorderSampleState();
  }
}
