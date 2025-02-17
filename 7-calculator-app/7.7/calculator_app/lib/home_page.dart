import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:calculator_app/calculator_model.dart';

import 'package:calculator_app/widgets.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Calculator>(
      builder: (context, calculator, child) {
        double fontSize = 94;
        if (calculator.number.length > 6) {
          fontSize = 65;
        }

        return Scaffold(
          backgroundColor: calculator.isDarkModeOn
              ? const Color.fromRGBO(23, 23, 28, 1)
              : const Color.fromRGBO(241, 242, 243, 1),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.scale(
                        scale: 1.2,
                        child: Switch(
                          value: !calculator.isDarkModeOn,
                          onChanged: (_) {
                            context.read<Calculator>().changeIsDarkModeOn();
                          },
                          activeColor: const Color.fromRGBO(210, 211, 218, 1),
                          activeTrackColor: Colors.white,
                          inactiveThumbColor:
                              const Color.fromRGBO(78, 80, 85, 1),
                          inactiveTrackColor:
                              const Color.fromRGBO(46, 47, 56, 1),
                          trackOutlineColor: WidgetStateProperty.resolveWith(
                            (_) {
                              return Colors.red.withOpacity(0);
                            },
                          ),
                        ),
                      ),
                      calculator.isDarkModeOn
                          ? Positioned(
                              right: 3,
                              child: Image.asset('assets/icons/moon.png'),
                            )
                          : Positioned(
                              left: 3,
                              child: Image.asset('assets/icons/sun.png'),
                            ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          calculator.number,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: fontSize,
                            color: calculator.isDarkModeOn
                                ? Colors.white
                                : Colors.black,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ),
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
                            onTap: () =>
                                context.read<Calculator>().onSignChange(),
                          ),
                          const SizedBox(width: 16),
                          GrayButton(
                            text: '%',
                            onTap: () =>
                                context.read<Calculator>().onTapPercent(),
                          ),
                          const SizedBox(width: 16),
                          BlueButton(
                            text: '/',
                            onTap: () => context
                                .read<Calculator>()
                                .onTapOperation(Operation.division),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          WhiteButton(
                            text: '7',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(7),
                          ),
                          const SizedBox(width: 16),
                          WhiteButton(
                            text: '8',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(8),
                          ),
                          const SizedBox(width: 16),
                          WhiteButton(
                            text: '9',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(9),
                          ),
                          const SizedBox(width: 16),
                          BlueButton(
                            text: 'x',
                            onTap: () => context
                                .read<Calculator>()
                                .onTapOperation(Operation.multiplication),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          WhiteButton(
                              text: '4',
                              onTap: () =>
                                  context.read<Calculator>().onTapNumber(4)),
                          const SizedBox(width: 16),
                          WhiteButton(
                            text: '5',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(5),
                          ),
                          const SizedBox(width: 16),
                          WhiteButton(
                            text: '6',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(6),
                          ),
                          const SizedBox(width: 16),
                          BlueButton(
                            text: '-',
                            onTap: () => context
                                .read<Calculator>()
                                .onTapOperation(Operation.substraction),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          WhiteButton(
                            text: '1',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(1),
                          ),
                          const SizedBox(width: 16),
                          WhiteButton(
                            text: '2',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(2),
                          ),
                          const SizedBox(width: 16),
                          WhiteButton(
                            text: '3',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(3),
                          ),
                          const SizedBox(width: 16),
                          BlueButton(
                            text: '+',
                            onTap: () => context
                                .read<Calculator>()
                                .onTapOperation(Operation.addition),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          WhiteButton(
                            text: '.',
                            onTap: () => context.read<Calculator>().onTapDot(),
                          ),
                          const SizedBox(width: 16),
                          WhiteButton(
                            text: '0',
                            onTap: () =>
                                context.read<Calculator>().onTapNumber(0),
                          ),
                          const SizedBox(width: 16),
                          RemoveButton(
                            onTap: () =>
                                context.read<Calculator>().onTapRemove(),
                          ),
                          const SizedBox(width: 16),
                          BlueButton(
                            text: '=',
                            onTap: () =>
                                context.read<Calculator>().onTapEqual(),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
