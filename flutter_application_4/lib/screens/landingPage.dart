import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_4/cubits/cubit/datafetcher_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text('press button to fetch apis from remote'),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        context.read<DatafetcherCubit>().function();
                        Navigator.pop(context);
                      },
                      child: const Text('press buttton'))
                ],
              ));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<DatafetcherCubit, DatafetcherState>(
        builder: (context, state) {
          if (state is DatafetcherFetched) {
            return ListView.builder(
                itemCount: state.holder.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(state.holder[index].body),
                    ));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
