import 'package:deliveristo_assignment/repository/dog_repository.dart';
import 'package:deliveristo_assignment/ui/home_page/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomepageBloc, HomepageState>(
        builder: (context, state) {
          return Center(
            child: ElevatedButton(
              onPressed: () => context.read<Repository>().getRandomDog("1"),
              child: Text("a7a"),
            ),
          );
        },
      ),
    );
  }
}
