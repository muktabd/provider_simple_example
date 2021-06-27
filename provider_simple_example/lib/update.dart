import 'package:flutter/material.dart';
import '/services/services.dart';
import 'package:provider/provider.dart';

class UpdateName extends StatefulWidget {
  final value;
  UpdateName({Key? key, this.value}) : super(key: key);

  @override
  _UpdateNameState createState() => _UpdateNameState();
}

class _UpdateNameState extends State<UpdateName> {
  //call the consumer class
  // final DataServices dataServices = DataServices();

  final _nameChangeController = TextEditingController();

  @override
  void dispose() {
    _nameChangeController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _nameChangeController.text = widget.value;

    super.initState();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Consumer<DataServices>(builder: (context, dataServices, child) {
      return Scaffold(
        appBar: AppBar(),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(dataServices.newName),
              TextFormField(
                controller: _nameChangeController,
                decoration: InputDecoration(labelText: "New Name"),
              ),
              ElevatedButton(
                child: Text('Change now'),
                onPressed: () async {
                  setState(
                    () {
                      var newName = _nameChangeController.text;
                      dataServices.changeName(newName);
                    },
                  );
                },
              )
            ],
          ),
        ),
      );
    });
  }
}
