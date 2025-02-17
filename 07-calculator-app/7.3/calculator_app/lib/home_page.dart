import 'package:calculator_app/calculator_model.dart';
import 'package:flutter/material.dart';

import 'package:calculator_app/widgets.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(241, 242, 243, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Consumer<Calculator>(builder: (context, calculator, child) {
                double fontSize = 94;
                if (calculator.number.length > 6) {
                  fontSize = 65;
                }
                return Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    calculator.number,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: fontSize,
                      color: Colors.black,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                );
              }),
              const SizedBox(height: 16),
              Row(
                children: [
                  GrayButton(
                    text: 'C',
                    onTap: () => context.read<Calculator>().clear(),
                  ),
                  const SizedBox(width: 16),
                  GrayButton(
                    text: '+/-',
                    onTap: () => context.read<Calculator>().onSignChange(),
                  ),
                  const SizedBox(width: 16),
                  GrayButton(
                    text: '%',
                    onTap: () => context.read<Calculator>().onTapPercent(),
                  ),
                  const SizedBox(width: 16),
                  BlueButton(
                    text: '/',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  WhiteButton(
                    text: '7',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  WhiteButton(
                    text: '8',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  WhiteButton(
                    text: '9',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  BlueButton(
                    text: 'x',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  WhiteButton(
                    text: '4',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  WhiteButton(
                    text: '5',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  WhiteButton(
                    text: '6',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  BlueButton(
                    text: '-',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  WhiteButton(
                    text: '1',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  WhiteButton(
                    text: '2',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  WhiteButton(
                    text: '3',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  BlueButton(
                    text: '+',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  WhiteButton(
                    text: '.',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  WhiteButton(
                    text: '0',
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  RemoveButton(
                    onTap: () {},
                  ),
                  const SizedBox(width: 16),
                  BlueButton(
                    text: '=',
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
