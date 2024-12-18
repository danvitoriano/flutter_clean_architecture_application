import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture_application/controllers/api_controller.dart';
import 'package:flutter_clean_architecture_application/screens/components/entry_card.dart';
import 'package:flutter_clean_architecture_application/screens/favorites.dart';
import 'package:flutter_clean_architecture_application/utils/const/categories.dart';

class Results extends StatelessWidget {
  Results({super.key, required this.category});
  final String category;
  final ApiController apiController = ApiController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(categories[category]!),
          actions: [
            IconButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => Favorites()));
            }, icon: const Icon(Icons.bookmark))
          ],
        ),
        body: FutureBuilder(
          future: apiController.getEntriesByCategory(category: category),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.active:
                break;
              case ConnectionState.none:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemBuilder: (context, index) => EntryCard(
                      entry: snapshot.data![index],
                      isSaved: false,
                    ),
                    itemCount: snapshot.data!.length,
                  );
                } else {
                  return Center(
                    child: Text("Results: ${snapshot.error}"),
                  );
                }
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              default:
            }
            return Container();
          },
        ),
      ),
    );
  }
}
