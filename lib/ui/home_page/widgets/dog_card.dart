import 'package:deliveristo_assignment/models/dog_model.dart';
import 'package:flutter/material.dart';

class DogCard extends StatelessWidget {
  final Dog dog;
  const DogCard({super.key, required this.dog});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Card(
          child: Column(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 300,
                  child: Image.network(
                    dog.imageUrl,
                    fit: BoxFit.contain,
                  ),
                )),
            Text(dog.breed),
            Text(dog.subBreed)
          ]),
        ),
      ),
    );
  }
}
