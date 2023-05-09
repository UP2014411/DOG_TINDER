import 'package:flutter/material.dart';
import 'package:dog_tinder/db/db_model.dart';
import 'package:dog_tinder/db/db_functions.dart';

class EditDogScreen extends StatelessWidget {
  final DBModel? dog;
  const EditDogScreen({Key? key, this.dog}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dogNameController = TextEditingController();
    final dogBreedController = TextEditingController();
    final dogAgeController = TextEditingController();
    final dogBioController = TextEditingController();

    if (dog != null) {
      dogNameController.text = dog!.dogName;
      dogBreedController.text = dog!.dogBreed;
      dogAgeController.text = dog!.dogAge.toString();
      dogBioController.text = dog!.dogBio;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(dog == null ? 'Add dog' : 'Edit dog'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Center(
                child: Text(
                  'Amend your dog details',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                controller: dogNameController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Dog',
                    labelText: 'Dog Name',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                controller: dogBreedController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Breed',
                    labelText: 'Dog Breed',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextFormField(
                controller: dogAgeController,
                maxLines: 1,
                decoration: const InputDecoration(
                    hintText: 'Age',
                    labelText: 'Dog Age',
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ))),
              ),
            ),
            TextFormField(
              controller: dogBioController,
              decoration: const InputDecoration(
                  hintText: 'Type your dog bio here',
                  labelText: 'Dog Bio',
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                        width: 0.75,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ))),
              keyboardType: TextInputType.multiline,
              onChanged: (str) {},
              maxLines: 3,
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: SizedBox(
                height: 45,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                    onPressed: () async {
                      final dogName = dogNameController.value.text;
                      final dogBreed = dogBreedController.value.text;
                      final dogAge = dogAgeController.value.text;
                      final dogBio = dogBioController.value.text;

                      if (dogName.isEmpty || dogBreed.isEmpty || dogAge.isEmpty || dogBio.isEmpty){
                        return;
                      }

                      final DBModel model = DBModel(
                          id: dog?.id,
                          dogName: dogName,
                          dogBreed: dogBreed,
                          dogAge: int.parse(dogAge),
                          dogBio: dogBio);
                      if (dog == null) {
                        await DBFunctions.addDog(model);
                      } else {
                        await DBFunctions.updateDog(model);
                      }

                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                            const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 0.75,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10.0),
                                )))),
                    child: Text(
                      dog == null ? 'Save' : 'Edit',
                      style: const TextStyle(fontSize: 20, color: Colors.black),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
