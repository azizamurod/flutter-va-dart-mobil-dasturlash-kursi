import 'package:flutter/material.dart';

class GrayButton extends StatelessWidget {
  const GrayButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(210, 211, 218, 1),
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class BlueButton extends StatelessWidget {
  const BlueButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromRGBO(75, 94, 252, 1),
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}

class RemoveButton extends StatelessWidget {
  const RemoveButton({
    super.key,
    required this.onTap,
  });

  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.symmetric(vertical: 27),
          child: Image.asset(
            'assets/icons/remove.png',
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
