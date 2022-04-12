import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_api_with_provider/model/data_model.dart';
import 'package:rest_api_with_provider/utils/app_state.dart';
import 'package:rest_api_with_provider/utils/data_utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // AppState provider = Provider.of<AppState>(context, listen: false);
    return Consumer<AppState>(
      builder: (context, provider, child) {
        return Scaffold(
          appBar: const CupertinoNavigationBar(
            middle: Text("RestApi with Provider"),
          ),
          body: provider.datalist.isEmpty
              ? Center(
                  child: Text(
                  "No Data",
                  style: TextStyle(fontSize: 26),
                ))
              : ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${provider.datalist[index].title}"),
                      leading: Text("${provider.datalist[index].id}"),
                    );
                  },
                  itemCount: provider.datalist.length,
                ),
          floatingActionButton: FloatingActionButton(
            child: const Icon(CupertinoIcons.refresh_thick),
            onPressed: () async {
              List<DataModel> data = await DataUtils().getData();
              provider.updateDatamodel(data);
            },
          ),
        );
      },
    );
  }
}
