import 'package:flutter/material.dart';

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Material(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10), topRight: Radius.circular(10)),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: screenHeight / 26,
              width: screenWidth / 1.12,
              decoration: const BoxDecoration(
                // border: Border.all(width: 4, color: Colors.red),
                // border: Border(
                //   top: BorderSide(width: 4, color: Colors.red),
                // ),
                color: Color(0xffffb85a),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              ),
              child:  const Center(
                  child: Text(
                "Etkinliğin Adı",
                style: TextStyle(fontWeight: FontWeight.w700),
              )),
            ),
            Container(
              height: screenHeight / 7.81,
              width: screenWidth / 1.12,
              padding: const EdgeInsets.only(left: 17, top: 5, bottom: 5),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children:  [
                      const Text(
                        "Bilet No:",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: screenWidth / 5.77,
                      ),
                      const Text(
                        "2020402036",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children:  [
                      const Text(
                        "Etkinlik tarihi:",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: screenWidth / 10.91,
                      ),
                      const Text(
                        "18.07.2022",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children:  [
                      const Text(
                        "Etkinlik Saati:",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: screenWidth / 10.33,
                      ),
                      const Text(
                        "17:30",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                  ),
                  Row(
                    children:  [
                      const Text(
                        "Lokasyon:",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: screenWidth/6.55,
                      ),
                      const Text(
                        "Boğaziçi Üniversit...",
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


