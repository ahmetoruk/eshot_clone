import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:eshot_clone/blocs/search_cubit.dart';
import 'package:eshot_clone/domain/entities/search_result.dart';
import 'package:eshot_clone/injectable.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SearchBloc>(
      create: (context) => SearchBloc(routeRepository: getIt()),
      child: const SearchView(),
    );
  }
}

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textField = TextField(
      autofocus: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(80),
          ),
          filled: true,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          hintStyle: TextStyle(color: Colors.grey[800]),
          hintText: "Bostanlı...",
          fillColor: Colors.white70),
      onChanged: (String text) =>
          context.read<SearchBloc>().add(SearchTextEvent(text)),
    );
    return Scaffold(
      appBar: AppBar(
        title: SizedBox(height: 40, child: textField),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          switch (state.status) {
            case SearchStatus.initial:
              return Container();
            case SearchStatus.loading:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case SearchStatus.loadad:
              return ListView(
                children: state.searchResults
                    .where((element) => element.type == SearchResultType.bus)
                    .map<ListTile>((searchResult) => ListTile(
                          onTap: () =>
                              context.push("/route/${searchResult.id}"),
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: Text(
                              searchResult.id.toString(),
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(searchResult.name),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              const Icon(
                                Icons.timer,
                                color: Colors.black38,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(searchResult.workHours),
                            ],
                          ),
                        ))
                    .toList(),
              );
          }
        },
      ),
    );
  }
}
