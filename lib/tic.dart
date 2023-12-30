import 'package:flutter/material.dart';

class tic extends StatefulWidget {
  @override
  State<tic> createState() => _ticState();
}

class _ticState extends State<tic> {
  play p = play();
  bool x = true;
  bool color = true;
  String win = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        width: double.infinity,
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
              "tic_tac_toe",
              style: TextStyle(
                  fontSize: 30,
                  color: const Color.fromARGB(255, 255, 240, 101)),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              win,
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 75, 247, 127)),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 411,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, crossAxisSpacing: 4, mainAxisSpacing: 4),
                itemCount: 9,
                itemBuilder: (BuildContext context, int index) {
                  return botonXo(index);
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            MaterialButton(
              color: const Color.fromARGB(255, 255, 240, 101),
              onPressed: () {
                setState(() {
                  p = play();
                  win = "";
                });
              },
              child: Text(
                "restart",
              ),
            )
          ],
        )),
      ),
    );
  }

  Widget botonXo(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (p.panel[index] == "") {
            p.panel[index] = x ? "x" : "o";
            x = !x;
          }
          if (p.isWin()) {
            win = x ? "o is win" : "x is win";
            p = play();
          } else if (p.count == 9) {
            win = "equal";
          }
        });
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(12),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: const Color.fromARGB(255, 36, 35, 35)),
        child: Text(
          "${p.panel[index]}",
          style: const TextStyle(
              fontSize: 40, color: Color.fromARGB(255, 219, 40, 34)),
        ),
      ),
    );
  }
}

class play {
  List panel = ["", "", "", "", "", "", "", "", ""];
  List win = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];
  int count = 0;
  bool isWin() {
    for (int i = 0; i < win.length; i++) {
      if (panel[win[i][0]] == panel[win[i][1]] &&
          panel[win[i][0]] == panel[win[i][2]] &&
          panel[win[i][0]] != "") {
        return true;
      }
    }
    count++;
    return false;
  }
}
