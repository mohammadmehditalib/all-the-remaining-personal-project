import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_5/cubit/data_fetcher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    context.read<DataFetcherCubit>().apiCalling();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DataFetcherCubit, DataFetcherState>(
        builder: (context, state) {
          if (state is DataFetcherFetched) {
            return ListView.builder(
                itemCount: state.holder.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.holder[index].title),
                  );
                });
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
