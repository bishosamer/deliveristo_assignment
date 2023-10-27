import 'package:deliveristo_assignment/models/dog_model.dart';
import 'package:deliveristo_assignment/ui/home_page/bloc/homepage_bloc.dart';
import 'package:deliveristo_assignment/ui/home_page/widgets/breed_selector.dart';
import 'package:deliveristo_assignment/ui/home_page/widgets/dog_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Random Dogs')),
      body: BlocListener<HomepageBloc, HomepageState>(
        listener: (context, state) {
          if (state is HomePageError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              BreedSelector(),
              BlocBuilder<HomepageBloc, HomepageState>(
                builder: (context, state) {
                  if (state is Loaded && state.dogs != null) {
                    List<Widget> cards = [];
                    for (Dog dog in state.dogs!) {
                      cards.add(DogCard(dog: dog));
                    }
                    return Expanded(
                      child: ListView(
                        children: [...cards],
                      ),
                    );
                  } else {
                    return Container();
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
