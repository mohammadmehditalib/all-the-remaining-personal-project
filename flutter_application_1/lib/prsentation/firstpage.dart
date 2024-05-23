import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/Repository/api.dart';
import 'package:flutter_application_1/bloc/bloc/pagination_bloc.dart';
import 'package:flutter_application_1/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  List<Models> holder = [];
  bool status = true;

  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    context.read<PaginationBloc>().add(FetchInitial());
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        setState(() {
          status = false;
        });
        context.read<PaginationBloc>().add(FetchInitial());
        setState(() {
          status = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagination'),
        ),
        body: BlocBuilder<PaginationBloc, PaginationState>(builder: (context, state) {
          if (state is PaginationInitial) {
            return ListView.builder(
              controller: scrollController,
              itemBuilder: (context, index) {
                return index != (state.holder.length - 1)
                    ? ListTile(
                        title: Text(state.holder[index].title),
                      )
                    : status
                        ? (state.holder.length != 100)
                            ? const Align(
                                alignment: Alignment.bottomCenter,
                                child: CircularProgressIndicator())
                            : const Text('FINISHED FETCHING DATA')
                        : const SizedBox.shrink();
              },
              itemCount: state.holder.length,
            );
          } else {
            return const SizedBox.shrink();
          }
        }));
  }
}
