import 'package:rice_disease_detection/Pages/diseases.dart';
import 'package:rice_disease_detection/services/csv_converter.dart';

class riceDiseases {
  var diseases = [];
  var name;
  var description;
  var image;
  var cause;
  var causeDescription;
  var solution;
  var solutionDescription;

  var images = [];
  riceDiseases(
      {this.name,
      this.description,
      this.image,
      this.cause,
      this.causeDescription,
      this.solution,
      this.solutionDescription});

  Future getAll() async {
    diseases = await converter().convert();
    return diseases;
  }

  getDisease() async {
    diseases = await converter().convert();
    image = null;
    description = null;
    for (var item = 0; item < diseases.length; item++) {
      if (diseases[item]['name'] == name) {
        image = diseases[item]['image'];
        description = diseases[item]['description'];
        images.addAll([
          diseases[item]['image2'],
          diseases[item]['image3'],
          diseases[item]['image4']
        ]);
        cause = diseases[item]['cause'];
        causeDescription = diseases[item]['causeDescription'];
        solution = diseases[item]['solution'];
        solutionDescription = diseases[item]['solutionDescription'];
      }
    }
  }
}




// Function to simulate loading that take long time
// final _sample =  Future.delayed(const Duration(seconds: 5), () async {
//   var diseases = [['ASD', 'XCVXCV', 'XCVXCVDSF'], ['uzeb', 'XCVXCV', 'XCVXCVDSF'], ['ASD', 'XCVXCV', 'XCVXCVDSF']];
//   var result =   diseases.map((item){
//      return {'name': item[0], 'description': item[1], 'image':item[2]};
//   }).toList();
//   return result;
// }
// );