import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return SearchAnchor(
        builder: (BuildContext context, SearchController controller) {
          return SafeArea(
            child: SearchBar(
              hintText: "Search",
              elevation: const MaterialStatePropertyAll(1),
              backgroundColor: MaterialStatePropertyAll(Colors.grey[100]),
              shape: const MaterialStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(15)),
              )),
              controller: controller,
              padding: const MaterialStatePropertyAll(
                  EdgeInsets.symmetric(horizontal: 16)),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            
              //we can remove it
              trailing: <Widget>[
                Tooltip(
                  message: 'Filter',
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.tune,
                    ),
                  ),
                )
              ],
            ),
          );
        }, suggestionsBuilder:
        (BuildContext context, SearchController controller) {
      return List<ListTile>.generate(5, (int index) {
        final String item = 'item $index';
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
            });
          },
        );
      });
    });
  }
}
