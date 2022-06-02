import 'package:flutter/material.dart';

class TicketsWidget extends StatelessWidget {
  const TicketsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            height: 30,
            width: 350,
            decoration: const BoxDecoration(
              // border: Border.all(width: 4, color: Colors.red),
              // border: Border(
              //   top: BorderSide(width: 4, color: Colors.red),
              // ),
              color: Color(0xffffb85a),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
            ),
            child: const Center(
                child: Text(
              "Etkinliğin Adı",
              style: TextStyle(fontWeight: FontWeight.w700),
            )),
          ),
          Container(
            height: 100,
            width: 350,
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
                  children: const [
                    Text(
                      "Bilet No:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 68,
                    ),
                    Text(
                      "2020402036",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Etkinlik tarihi:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 36,
                    ),
                    Text(
                      "18.07.2022",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Etkinlik Saati:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 38,
                    ),
                    Text(
                      "17:30",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black),
                    )
                  ],
                ),
                Row(
                  children: const [
                    Text(
                      "Lokasyon:",
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    SizedBox(
                      width: 60,
                    ),
                    Text(
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
    );
  }
}

          // Container(
          //   color: Colors.white,
          //   child: Row(
          //     children: <Widget>[
          //       SizedBox(
          //         height: 20,
          //         width: 10,
          //         child: DecoratedBox(
          //           decoration: BoxDecoration(
          //             borderRadius: const BorderRadius.only(
          //               topRight: Radius.circular(10),
          //               bottomRight: Radius.circular(10),
          //             ),
          //             color: Colors.grey.shade200.withOpacity(0),
          //           ),
          //         ),
          //       ),
          //       Expanded(
          //           child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: LayoutBuilder(
          //           builder: (context, constraints) {
          //             return Flex(
          //               direction: Axis.horizontal,
          //               mainAxisSize: MainAxisSize.max,
          //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //               children: List.generate(
          //                 (constraints.constrainWidth() / 10).floor(),
          //                 (index) => SizedBox(
          //                   height: 2,
          //                   width: 5,
          //                   child: DecoratedBox(
          //                     decoration:
          //                         BoxDecoration(color: Colors.grey.shade400),
          //                   ),
          //                 ),
          //               ),
          //             );
          //           },
          //         ),
          //       )),
          //       SizedBox(
          //         height: 20,
          //         width: 10,
          //         child: DecoratedBox(
          //           decoration: BoxDecoration(
          //             borderRadius: const BorderRadius.only(
          //               topLeft: Radius.circular(10),
          //               bottomLeft: Radius.circular(10),
          //             ),
          //             color: Colors.grey.shade200,
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          // Container(
          //   height: 50,
          //   decoration: const BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.only(
          //         bottomLeft: Radius.circular(16),
          //         bottomRight: Radius.circular(16)),
          //   ),
          // )
