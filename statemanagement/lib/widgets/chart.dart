import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:statemanagement/Models/transaction.dart';

class Chart extends StatelessWidget {
   List<Transaction>recentTransaction;

  Chart(  this.recentTransaction);
  
  @override
  Widget build(BuildContext context) {
   
    
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 150,
          width: 370,  
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
             return Column(children: [
                 Text('amount'),
                SizedBox(
                  height: 100,
                  width: 21,
                  child: Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.black87)),
                    child: const SizedBox(
                      height: 100,
                      width: 21,
                    ),
                  ),
                ),
                 Text(index.toString())
              ]);
            },
            itemCount: 7,
          ),
        )
      ],
    );
  }
}
