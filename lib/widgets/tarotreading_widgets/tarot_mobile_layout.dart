import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'tarot_read_body.dart';

class TarotMobileLayout extends StatelessWidget {
  const TarotMobileLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Expanded(child: TarotReadViewBody())

      ],
    );
  }
}