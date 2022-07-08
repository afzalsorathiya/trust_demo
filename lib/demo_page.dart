import 'package:flutter/material.dart';
import 'package:http/http.dart';

class DemoPage extends StatefulWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAPI();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade100,
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Demo Work'),
        ),
        body: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return listView();
            }));
  }

  listView() {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue.shade400,
      ),
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: const [
              Text('Provider ID -'),
              SizedBox(
                width: 10,
              ),
              Text(
                '110',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text('Name -'),
              SizedBox(
                width: 10,
              ),
              Text(
                'Trust',
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Address -'),
              const SizedBox(
                width: 10,
              ),
              Flexible(
                child: Text(
                  'Gujarat' * 100,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: const [
              Text('Phone -'),
              SizedBox(
                width: 10,
              ),
              Text(
                '115245d5sd0',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future getAPI() async {
    var url = Uri.parse(
        'http://trustserv.org/webservice_v10/v1/providerBySubCategory');
    Response response = await post(url);
    print('*****************************************');
    print(response.statusCode);
    if (response.statusCode == 200) {
      print('sucess');
    } else {
      print('OOps Something Went wrong');
    }
    print('*****************************************');
  }
}
