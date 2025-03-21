import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BagContainer extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final String food;

  const BagContainer({
    super.key,
    this.width = double.infinity,
    this.height = 100,
    this.color = Colors.grey,
    required this.food,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.fromLTRB(20, 5, 20, 5),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: Container(
                      height: 50,
                      child: Image.asset(
                        'assets/sushi_bg2.jpg',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    food,
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black45,
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(20)),
                    width: 90,
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.orange,
                          ),
                          Text(
                            '1',
                            style: GoogleFonts.poppins(color: Colors.orange),
                          ),
                          const Icon(
                            Icons.add,
                            size: 20,
                            color: Colors.orange,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text('price', style: GoogleFonts.poppins(color: Colors.white))
              ],
            ),
          )
        ],
      ),
    );
  }
}
