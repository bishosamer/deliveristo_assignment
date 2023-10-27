import 'package:deliveristo_assignment/models/breed_model.dart';
import 'package:deliveristo_assignment/ui/home_page/bloc/homepage_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BreedSelector extends StatelessWidget {
  BreedSelector({
    super.key,
  });
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String numberOfImages = '1';
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomepageBloc, HomepageState>(
      builder: (context, state) {
        if (state is HomepageInitial) {
          context.read<HomepageBloc>().add(GetBreeds());
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is Loaded) {
          List<DropdownMenuItem> breeds = [];
          for (Breed breed in state.breeds) {
            breeds.add(DropdownMenuItem(
              value: breed,
              child: Text(breed.name),
            ));
          }
          List<DropdownMenuItem> subBreeds = [];
          if (state.selectedBreed != null) {
            for (String subBreed in state.selectedBreed!.subBreeds) {
              subBreeds.add(DropdownMenuItem(
                value: subBreed,
                child: Text(subBreed),
              ));
            }
          }

          return Wrap(
            children: [
              DropdownButton(
                  hint: const Text('choose breed'),
                  items: breeds,
                  value: state.selectedBreed,
                  onChanged: (val) {
                    context.read<HomepageBloc>().add(SelectBreed(
                        breed: val, breeds: state.breeds, dogs: state.dogs));
                  }),
              DropdownButton(
                  disabledHint: const Text('no sub breeds available'),
                  items: subBreeds,
                  value: state.selectedSubBreed,
                  onChanged: (val) {
                    context.read<HomepageBloc>().add(SelectSubBreed(
                        breed: state.selectedBreed!,
                        breeds: state.breeds,
                        subBreed: val,
                        dogs: state.dogs));
                  }),
              SizedBox(
                  width: MediaQuery.of(context).size.width / 4,
                  child: Form(
                    key: formKey,
                    child: TextFormField(
                      onSaved: (newValue) => numberOfImages =
                          newValue == '' || newValue == null ? '1' : newValue,
                      validator: (val) {
                        if (val != null && val != '') {
                          if (!RegExp(r'^[0-9]+$').hasMatch(val)) {
                            return 'Please enter numbers only';
                          }
                        }

                        return null;
                      },
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'number of images',
                      ),
                    ),
                  )),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: state.selectedBreed == null
                    ? MediaQuery.of(context).size.width / 2 - 15
                    : MediaQuery.of(context).size.width / 3 - 15,
                child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        formKey.currentState!.save();
                        context.read<HomepageBloc>().add(GetRandomDog(
                            breeds: state.breeds,
                            breed: state.selectedBreed,
                            subBreed: state.selectedSubBreed,
                            num: numberOfImages));
                      }
                    },
                    child: Text(
                      state.selectedBreed != null
                          ? "Random ${state.selectedBreed!.name}"
                          : "Random dog",
                    )),
              ),
              state.selectedBreed != null
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      width: MediaQuery.of(context).size.width / 3 - 15,
                      child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              context.read<HomepageBloc>().add(GetRandomDog(
                                  breeds: state.breeds, num: numberOfImages));
                            }
                          },
                          child: const Text("Radom Dog")))
                  : Container(),
            ],
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
