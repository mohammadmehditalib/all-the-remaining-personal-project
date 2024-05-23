import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_2/bloc/bloc/bloc/database_bloc.dart';
import 'package:flutter_application_2/services/database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Enteries extends StatelessWidget {
  const Enteries({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAST SEARCH HISTORY OF LOCATIONS')),
      body: BlocBuilder<DatabaseBloc, DatabaseState>(builder: (context, state) {
        if (state is DatabaseFetched) {
          return ListView.builder(
              itemCount: state.dataHolder.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(state.dataHolder[index].currentTemp.toString()),
                    trailing: Text(state.dataHolder[index].humidity.toString()),
                    subtitle: Row(),
                  ));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      }),
    );
  }
}
