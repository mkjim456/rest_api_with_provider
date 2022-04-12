import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:rest_api_with_provider/model/data_model.dart';

class DataUtils {
  Future<List<DataModel>> getData() async {
    List<DataModel> listdata = [];
    try {
      var request = http.Request(
          'GET', Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      http.StreamedResponse response = await request.send();

      if (response.statusCode == 200) {
        var rawdata = await response.stream.bytesToString();
        List<dynamic> data = jsonDecode(rawdata);
        data.forEach((element) {
          DataModel model = DataModel.fromJson(element);
          listdata.add(model);
        });
        return listdata;
      } else {
        print(response.reasonPhrase);
        return [];
      }
    } catch (e) {
      print("Error $e");
      throw e;
    }
  }
}
