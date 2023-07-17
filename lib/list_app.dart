import 'package:flutter/material.dart';
import 'package:searchable_listview/searchable_listview.dart';
import 'package:untitled1/baza.dart';
import 'package:untitled1/detail_item.dart';

class ExampleApp extends StatefulWidget {
  const ExampleApp({Key? key}) : super(key: key);
  static String routName = "/list_app";

  @override
  State<ExampleApp> createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  final Map<String, List<Model>> mapOfActors = {
    'test 1': [
      Model(word: "ажалинг", number: "1 399(1)"),
      Model(word: "аждар", number: "6 401(1) 405(1) 414(1) 416(2) 417(1)"),
      Model(word: "аждарга", number: "4 400(1) 405(1) 412(1) 416(1)"),
      Model(word: "аждардан", number: "2 412(2)"),
    ],
    'test 2': [
      Model(word: "адрас", number: "2 377(1) 402(1)"),
      Model(word: "аё", number: "1 364(1)"),
      Model(word: "аёл", number: "1 369(1)"),
      Model(word: "аёлингиз", number: "1 381(1)"),
    ]
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Сўз шакли бўйича қидириш',
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: SearchableList<Model>(
                  style: const TextStyle(fontSize: 25),
                  builder: (Model actor) => ActorItem(actor: actor),
                  loadingWidget: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Loading...')
                    ],
                  ),
                  errorWidget: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.error,
                        color: Colors.red,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Xatolik')
                    ],
                  ),
                  asyncListCallback: () async {
                    await Future.delayed(
                      const Duration(
                        milliseconds: 1000,
                      ),
                    );
                    return models;
                  },
                  asyncListFilter: (q, list) {
                    return list
                        .where((element) => element.word.contains(q))
                        .toList();
                  },
                  emptyWidget: const EmptyView(),
                  onRefresh: () async {},
                  onItemSelected: (Model item) {},
                  inputDecoration: InputDecoration(
                    labelText: "Қидириш",
                    fillColor: Colors.white,
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.blue,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void addActor() {
    models.add(Model(
      word: "salom",
      number: '5156165',
    ));
    setState(() {});
  }

  Widget expansionSearchableList() {
    return SearchableList<Model>.expansion(
      expansionListData: mapOfActors,
      expansionTitleBuilder: (p0) {
        return Container(
          color: Colors.grey[300],
          width: MediaQuery.of(context).size.width * 0.8,
          height: 30,
          child: Center(
            child: Text(p0.toString()),
          ),
        );
      },
      filterExpansionData: (p0) {
        final filteredMap = {
          for (final entry in mapOfActors.entries)
            entry.key: (mapOfActors[entry.key] ?? [])
                .where((element) => element.word.contains(p0))
                .toList()
        };
        return filteredMap;
      },
      style: const TextStyle(fontSize: 25),
      builder: (Model actor) => ActorItem(actor: actor),
      emptyWidget: const EmptyView(),
      inputDecoration: InputDecoration(
        labelText: "Search Actor",
        fillColor: Colors.white,
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.blue,
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ActorItem extends StatelessWidget {
  final Model actor;

  const ActorItem({
    Key? key,
    required this.actor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailItem(
              word: actor.word,
              numbers: actor.number,
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      const Text(
                        'Cўзшакл: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(truncateText(actor.word)),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        'ЧАСТОТА: ',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(truncateText(actor.number)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String truncateText(String text) {
  if (text.length > 30) {
    text = "${text.substring(0, 30)}...";
  }
  return text;
}

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
        ),
        Text('no actor is found with this name'),
      ],
    );
  }
}

class Model {
  String word;
  String number;

  Model({
    required this.word,
    required this.number,
  });
}
