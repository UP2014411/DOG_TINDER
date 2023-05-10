import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Pet extends Equatable {
  final String? id;
  final String name;
  final int age;
  final String gender;
  final List<dynamic> imageUrls;
  final String description;
  final String breed;
  final String location;

  const Pet(
      {required this.location,
      required this.id,
      required this.gender,
      required this.name,
      required this.age,
      required this.imageUrls,
      required this.description,
      required this.breed});

  @override
  List<Object?> get props =>
      [id, name, age, imageUrls, gender, description, breed, location];

  static Pet fromSnapshot(DocumentSnapshot snap) {
    Pet pet = Pet(
        id: snap.id,
        name: snap['name'],
        age: snap['age'],
        imageUrls: snap['imageUrls'],
        gender: snap['gender'],
        description: snap['description'],
        location: snap['location'],
        breed: snap['breed']);
    return pet;
  }

  Map<String, dynamic> toMap(){
    return {
      'name' : name,
      'age' : age,
      'gender' : gender,
      'imageUrls' : imageUrls,
      'description' : description,
      'location' : location,
      'breed' : breed,
    };
  }

  Pet copyWith({
  String? id, String? name, int? age, String? gender, List<dynamic>? imageUrls,
    String? description, String? breed, String? location,
  }){
    return Pet(
        location: location ?? this.location,
        id: id ?? this.id,
        gender: gender ?? this.gender,
        name: name ?? this.name,
        age: age ?? this.age,
        imageUrls: imageUrls ?? this.imageUrls,
        description: description ?? this.description,
        breed: breed ?? this.breed);
  }

  static List<Pet> pets = const [
    Pet(
        id: '1',
        name: 'Luna',
        gender: 'Female',
        age: 1,
        location: 'Milan Italy',
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
        ],
        description:
            'For simplicity\'s sake, some of the age ranges have been generalised. This means that for some species or breeds, choosing Elder or even Mature might give you a pet with a lifespan higher than what is common IRL. Just be sure to treat these older special friends particularly well in their new homes!',
        breed: 'Poodle'),
    Pet(
        id: '2',
        gender: 'Male',
        name: 'Paulina',
        age: 2,
        location: 'Barcelona Spain',
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTBoHB45M3U86oSd1lm-BTRhYBf013OUwljhp-7CGxxkZrc3N0GT8n3Fz8OmVLFaWOpTQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS3IU1WD4ySDCHTMABfbXyksyx0AuKLkqjhAWXSXzqmtaU6uOfxnMydN1VOaBagdGfevWQ&usqp=CAU',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJLtUY_lyofaqbSGgSHjzYv9DoCQ3zkTKCJsylx2aL3qf5k_STaIeJor6YqwgGAcEiDJ4&usqp=CAU',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ2KprbADS8sfmzZ0rWQ8HMAU8KbbqriUVxXdFD-m94xvL7U7-hiNsmwIJd5fRAi__NJPE&usqp=CAU',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFdRuZYC6xgX5dJNWvKG3oo28GAI4YNIRquVTkWWvPwiK3Y9D-SG8CgJVDiUVXx_rzrNk&usqp=CAU',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkx4jpR6HCOlsQdeRJw2_48LZH6DT2jWRq4JbE4F1POhmadCPu5hRTNi5hN3UAAqJPo68&usqp=CAU',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_GqcKZ8Ivqm2QucTC-ezDv82h4z8uNu-2njRbibRaGfgBEZnt1p9KhVs5AQVg0rxNgNo&usqp=CAU'
        ],
        description: 'Pet bio here',
        breed: 'Boston Terrier'),
    Pet(
        id: '3',
        gender: 'Female',
        name: 'Hachia',
        location: 'Belgrade Serbia',
        age: 1,
        imageUrls: [
          'https://thumbs.dreamstime.com/b/japanese-akita-inu-portrait-full-face-city-park-123900195.jpg',
          'https://www.thesprucepets.com/thmb/ZF0AYSSCeDk0wSrZ9bDhweufzWE=/1619x1214/smart/filters:no_upscale()/Akita-GettyImages-588622984-533e955df9214301a56b4c0689b32114-b756891eac2445059cbd59430dbff7e2.jpeg',
          'https://pbs.twimg.com/profile_images/968185583695691777/fSdBI4DR_400x400.jpg',
          'https://pbs.twimg.com/profile_images/968185583695691777/fSdBI4DR_400x400.jpg',
          'https://pbs.twimg.com/profile_images/968185583695691777/fSdBI4DR_400x400.jpg',
          'https://www.akitapedigree.com/pics/medium/6931/med_5f22cd803a1d0.jpeg',
          'https://www.akitapedigree.com/pics/medium/6931/med_5f22cd803a1d0.jpeg',
          'https://www.akitapedigree.com/pics/medium/3974/med_564c66ff989e9.jpg',
          'https://www.akitapedigree.com/pics/medium/3974/med_564c66ff989e9.jpg',
          'https://www.akitapedigree.com/pics/medium/3974/med_564c66ff989e9.jpg',
          //  'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-standing-outdoors.jpg',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSxX5wZVFnJqGDZq4G7QBa2RE_YNfYO0t6exc3655wTv4C8n1pfTUeIdeWuQTUHLqQDo4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWkJzyiqOXg9FlHfTxRYXXaiha6XJ6h8GXU4fyNpDj4sxrl0xRjCst1gMw6g2VinjLqVA&usqp=CAU',
          //  'https://frenchiejourney.com/wp-content/uploads/2021/12/Blue-French-Bulldog.png',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJJOyymVY64NIuuSCUgwsavkwOP08Afo_B4WdAa4yowZiIdQDKOByf8qsVyGKj03a2Qv4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwjf_MZ0DE9mIWLhcLPRBcquPaqvDGsMdVIx_5hxYVbExvHF51yNBnRbUV45uwrsBv2hw&usqp=CAU'
        ],
        description: 'Pet bio here',
        breed: 'French Bulldog'),
    Pet(
        id: '4',
        gender: 'Female',
        name: 'Yahiko',
        location: 'Skopje Macedonia',
        age: 1,
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTKVKRnv8K8-SdeOJzfzpYXy2hRV1rtWznf8A&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          //  'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-standing-outdoors.jpg',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSxX5wZVFnJqGDZq4G7QBa2RE_YNfYO0t6exc3655wTv4C8n1pfTUeIdeWuQTUHLqQDo4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWkJzyiqOXg9FlHfTxRYXXaiha6XJ6h8GXU4fyNpDj4sxrl0xRjCst1gMw6g2VinjLqVA&usqp=CAU',
          //  'https://frenchiejourney.com/wp-content/uploads/2021/12/Blue-French-Bulldog.png',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJJOyymVY64NIuuSCUgwsavkwOP08Afo_B4WdAa4yowZiIdQDKOByf8qsVyGKj03a2Qv4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwjf_MZ0DE9mIWLhcLPRBcquPaqvDGsMdVIx_5hxYVbExvHF51yNBnRbUV45uwrsBv2hw&usqp=CAU'
        ],
        description: 'Pet bio here',
        breed: 'French Bulldog'),
    Pet(
        id: '5',
        gender: 'Male',
        name: 'Nani 5',
        age: 1,
        location: 'Brussels Belgium',
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          //  'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-standing-outdoors.jpg',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSxX5wZVFnJqGDZq4G7QBa2RE_YNfYO0t6exc3655wTv4C8n1pfTUeIdeWuQTUHLqQDo4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWkJzyiqOXg9FlHfTxRYXXaiha6XJ6h8GXU4fyNpDj4sxrl0xRjCst1gMw6g2VinjLqVA&usqp=CAU',
          //  'https://frenchiejourney.com/wp-content/uploads/2021/12/Blue-French-Bulldog.png',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJJOyymVY64NIuuSCUgwsavkwOP08Afo_B4WdAa4yowZiIdQDKOByf8qsVyGKj03a2Qv4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwjf_MZ0DE9mIWLhcLPRBcquPaqvDGsMdVIx_5hxYVbExvHF51yNBnRbUV45uwrsBv2hw&usqp=CAU'
        ],
        description: 'Pet bio here',
        breed: 'French Bulldog'),
    Pet(
        id: '6',
        gender: 'Female',
        name: 'Nani 6',
        age: 1,
        location: 'Sofia Bulgaria',
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          //  'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-standing-outdoors.jpg',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSxX5wZVFnJqGDZq4G7QBa2RE_YNfYO0t6exc3655wTv4C8n1pfTUeIdeWuQTUHLqQDo4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWkJzyiqOXg9FlHfTxRYXXaiha6XJ6h8GXU4fyNpDj4sxrl0xRjCst1gMw6g2VinjLqVA&usqp=CAU',
          //  'https://frenchiejourney.com/wp-content/uploads/2021/12/Blue-French-Bulldog.png',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJJOyymVY64NIuuSCUgwsavkwOP08Afo_B4WdAa4yowZiIdQDKOByf8qsVyGKj03a2Qv4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwjf_MZ0DE9mIWLhcLPRBcquPaqvDGsMdVIx_5hxYVbExvHF51yNBnRbUV45uwrsBv2hw&usqp=CAU'
        ],
        description: 'Pet bio here',
        breed: 'French Bulldog'),
    Pet(
        id: '7',
        gender: 'Male',
        name: 'Nani ',
        location: 'Thessaloniki Greece',
        age: 1,
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          //  'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-standing-outdoors.jpg',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSxX5wZVFnJqGDZq4G7QBa2RE_YNfYO0t6exc3655wTv4C8n1pfTUeIdeWuQTUHLqQDo4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWkJzyiqOXg9FlHfTxRYXXaiha6XJ6h8GXU4fyNpDj4sxrl0xRjCst1gMw6g2VinjLqVA&usqp=CAU',
          //  'https://frenchiejourney.com/wp-content/uploads/2021/12/Blue-French-Bulldog.png',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJJOyymVY64NIuuSCUgwsavkwOP08Afo_B4WdAa4yowZiIdQDKOByf8qsVyGKj03a2Qv4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwjf_MZ0DE9mIWLhcLPRBcquPaqvDGsMdVIx_5hxYVbExvHF51yNBnRbUV45uwrsBv2hw&usqp=CAU'
        ],
        description: 'Pet bio here',
        breed: 'French Bulldog'),
    Pet(
        id: '8',
        gender: 'Female',
        name: 'Nani 8',
        age: 1,
        location: 'Paris France',
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          //  'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-standing-outdoors.jpg',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSxX5wZVFnJqGDZq4G7QBa2RE_YNfYO0t6exc3655wTv4C8n1pfTUeIdeWuQTUHLqQDo4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWkJzyiqOXg9FlHfTxRYXXaiha6XJ6h8GXU4fyNpDj4sxrl0xRjCst1gMw6g2VinjLqVA&usqp=CAU',
          //  'https://frenchiejourney.com/wp-content/uploads/2021/12/Blue-French-Bulldog.png',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJJOyymVY64NIuuSCUgwsavkwOP08Afo_B4WdAa4yowZiIdQDKOByf8qsVyGKj03a2Qv4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwjf_MZ0DE9mIWLhcLPRBcquPaqvDGsMdVIx_5hxYVbExvHF51yNBnRbUV45uwrsBv2hw&usqp=CAU'
        ],
        description: 'Pet bio here',
        breed: 'French Bulldog'),
    Pet(
        id: '9',
        gender: 'Female',
        name: 'Nani 9',
        location: 'Madrid Spain',
        age: 1,
        imageUrls: [
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQu2YrpFPDGQuiMGEw0wXNufAjXxifIkibnQbbnvwIn2sfBs0NWEtX50XZZB_mc2ys6dVo&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJd8_xfyKKacZJ7Fe6pYQHTCxRpneJ485i2jokCwbrv_Ld09LH6OGiIKjvXHnagoScgK8&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwT-QYwRoZz--Cu8am6YLcYo2bqSw5AtKDTuhIhqgeb2IcEBSPCYjji2OuCYh1zay5CZQ&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTLAKYj_KIAWvjysd5KoIhhVC--ZU4_MH8cPw&usqp=CAU',
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTytlbpGnXoEMzzqV4AbBaMkNbmzVBTUZMPhQ&usqp=CAU',
          //  'https://www.akc.org/wp-content/uploads/2017/11/French-Bulldog-standing-outdoors.jpg',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSxX5wZVFnJqGDZq4G7QBa2RE_YNfYO0t6exc3655wTv4C8n1pfTUeIdeWuQTUHLqQDo4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWkJzyiqOXg9FlHfTxRYXXaiha6XJ6h8GXU4fyNpDj4sxrl0xRjCst1gMw6g2VinjLqVA&usqp=CAU',
          //  'https://frenchiejourney.com/wp-content/uploads/2021/12/Blue-French-Bulldog.png',
          // 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJJOyymVY64NIuuSCUgwsavkwOP08Afo_B4WdAa4yowZiIdQDKOByf8qsVyGKj03a2Qv4&usqp=CAU',
          //  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwjf_MZ0DE9mIWLhcLPRBcquPaqvDGsMdVIx_5hxYVbExvHF51yNBnRbUV45uwrsBv2hw&usqp=CAU'
        ],
        description: 'Pet bio here',
        breed: 'French Bulldog'),
  ];
}
