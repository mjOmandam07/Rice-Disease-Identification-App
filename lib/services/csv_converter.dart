import 'package:csv/csv.dart';
import 'package:flutter/services.dart' show rootBundle;

class converter {
  var disease_list = [];

  convert() async {
    try {
      final myData = await rootBundle.loadString("assets/rice_diseases.csv");
      List<List<dynamic>> csvTable = CsvToListConverter().convert(myData);
      disease_list = csvTable;
      var result = await disease_list.map((item) {
        return {
          'name': item[0],
          'description': item[1],
          'image': item[2],
          'image2': item[3],
          'image3': item[4],
          'image4': item[5],
          'cause': item[6],
          'causeDescription': item[7],
          'solution': item[8],
          'solutionDescription': item[9]
        };
      }).toList();

      return result;
    } catch (e) {
      print('Caught Error: $e');
    }
  }
}
