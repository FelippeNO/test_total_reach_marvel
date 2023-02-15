import 'package:flutter/material.dart';

import '../../../core/design/ui/ui_scale.dart';

class HorizontalCarouselSession extends StatelessWidget {
  const HorizontalCarouselSession({Key? key, required this.sessionName, required this.itens, this.backgroundColor})
      : super(key: key);
  final String sessionName;
  final List<String> itens;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return itens.isEmpty
        ? const SizedBox()
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  height: UIScale.height(5),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    sessionName,
                    style: TextStyle(
                      fontSize: UIScale.width(4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(8.0),
                  height: UIScale.height(20),
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: itens.length,
                    itemBuilder: (itemBuilder, index) {
                      return Container(
                        padding: const EdgeInsets.all(8.0),
                        margin: EdgeInsets.symmetric(horizontal: UIScale.width(2)),
                        width: UIScale.width(25),
                        //    height: UIScale.height(18),
                        color: backgroundColor ?? Colors.grey.withOpacity(0.38),
                        child: Text(
                          itens[index],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
  }
}
