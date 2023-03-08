import 'package:flutter/material.dart';

class studentSection extends StatefulWidget {
  const studentSection({
    Key? key,
  }) : super(key: key);

  @override
  State<studentSection> createState() => _studentSectionState();
}

class _studentSectionState extends State<studentSection> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 30,),
            //                 TODO:SEARCH BAR
            Padding(
              padding: const EdgeInsets.only(left: 40, right: 40),
              child: TextFormField(
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10.0, horizontal: 10),
                    hintText: 'Search Student',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            SizedBox(height: 10,),
            //                 TODO:SEARCH BUTTON
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                backgroundColor:MaterialStateProperty.all(const Color(0xFF498757)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),

                  )
                )
              ),
              child: Icon(Icons.search),

            ),
            const SizedBox(
              height: 50,
            ),
            //                TODO:ADD & DELETE BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/addStudent');
                  },
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('Delete'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
