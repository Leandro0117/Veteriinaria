import 'package:flutter/material.dart';
import 'screens/home/info_page.dart';
import 'screens/home/home_page.dart';

class MiBottomAppBar extends StatelessWidget {
  final int disabledButton;

  const MiBottomAppBar({super.key, this.disabledButton = 0});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.info,
              color: Color.fromARGB(255, 221, 166, 101),
              size: 30.0,
            ),
            onPressed: disabledButton != 1
                ? () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const InformacionPage()),
                    );
                  }
                : null, //Deshabilita  informacion si disabledButton es igual a 1
          ),
          IconButton(
            icon: const Icon(
              Icons.home_filled,
              color: Color.fromARGB(255, 221, 166, 101),
              size: 30.0,
            ),
            onPressed: disabledButton != 2
                ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  }
                : null, //Deshabilita el home si disabledButton es igual a 2
          ),
          IconButton(
            icon: const Icon(
              Icons.elderly_woman_sharp,
              color: Color.fromARGB(255, 221, 166, 101),
              size: 30.0,
            ),
            onPressed: disabledButton != 3
                ? () {
                    // Navigator.pushReplacement(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => const HomePage()),
                    // );
                  }
                : null, //Deshabilita la viejita si disabledButton es igual a 3
          ),
        ],
      ),
    );
  }
}
