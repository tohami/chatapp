import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_search/material_search.dart';


class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) => new Container(
    child: new MaterialSearch<String>(
      placeholder: 'Search by name or ID', //placeholder of the search bar text input

      getResults: (String criteria) async {
        var list = await Firestore.instance.collection('users').where('name' , isEqualTo: criteria ).getDocuments();
        return list.documents.map((profile) => new MaterialSearchResult<String>(
          value: profile['name'].toString(), //The value must be of type <String>
          text: profile['name'].toString(), //String that will be show in the list
          icon: Image.network(profile['photoUrl'].toString()),
        )).toList();
      },
      //callback when some value is selected, optional.
      onSelect: (String selected) {
        print(selected);
      },
      //callback when the value is submitted, optional.
      onSubmit: (String value) {
        print(value);
      },
    )
  );
}