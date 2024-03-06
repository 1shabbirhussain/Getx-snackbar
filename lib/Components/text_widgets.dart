import 'package:flutter/material.dart';
import 'package:asdfg/assets/colors.dart';

////MediumRegularText
class MediumRegularText extends StatelessWidget {
  final String text;
   MediumRegularText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontFamily: "Source-San-3", fontSize: 16),
    );
  }
}

////MediumBoldText
class MediumBoldText extends StatelessWidget {
  final String text;
  const MediumBoldText({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontFamily: "Source-San-3",
          fontSize: 16,
          fontWeight: FontWeight.w600,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
    );
  }
}

////MediumItalicText
class MediumItalicText extends StatelessWidget {
  final String text;
  const MediumItalicText({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: "Source-San-3",
        fontSize: 16,
        fontStyle: FontStyle.italic,
      ),
    );
  }
}

////HeadingRegularText
class HeadingRegularText extends StatelessWidget {
  final String text;
  final Color? color;
  const HeadingRegularText({Key? key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24,
        color: color ?? MyColors.black100, // Use 'color' here
        fontFamily: "Source-San-3",
      ),
    );
  }
}

////HeadingBoldText
class HeadingBoldText extends StatelessWidget {
  final String text;
  final Color? color; // Use 'Color?' to make it nullable

  const HeadingBoldText({
    Key? key,
    required this.text,
    this.color, // Make it optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 24,
        color: color ?? MyColors.black100, // Use 'color' here
        fontFamily: "Source-San-3",
      ),
    );
  }
}

///HeadingItalicText
class HeadingItalicText extends StatelessWidget {
  final String text;
  final Color? color;

  const HeadingItalicText({Key? key, required this.text, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontStyle: FontStyle.italic,
        fontSize: 24,
        color: color ?? MyColors.black100,
        fontFamily: "Source-San-3",
      ),
    );
  }
}

////SmallRegularText
class SmallRegularText extends StatelessWidget {
  final String text;
  const SmallRegularText({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(color: MyColors.black54),
    );
  }
}

////SmallBoldText
class SmallBoldText extends StatelessWidget {
  final String text;
  const SmallBoldText({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          const TextStyle(color: MyColors.black54, fontWeight: FontWeight.w600),
    );
  }
}

////SmallItalicText
class SmallItalicText extends StatelessWidget {
  final String text;
  const SmallItalicText({Key? key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          const TextStyle(color: MyColors.black54, fontStyle: FontStyle.italic),
    );
  }
}
