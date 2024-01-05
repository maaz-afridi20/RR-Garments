import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class CategoryModel {
  String id;
  String name;
  String image;
  String parentId;
  bool isFeatured;

  CategoryModel(
      {required this.id,
      required this.name,
      required this.image,
      required this.isFeatured,
      this.parentId = ''});

  //! empty helper function

  static CategoryModel empty() =>
      CategoryModel(id: '', name: '', image: 'image', isFeatured: false);

//! convert model to json structuer so you can store data to firebase
// this will just get the data like from the above usermodel and
// save them in variable.(to json)
// because json in dart is called Map
  Map<String, dynamic> toJson() {
    return {
      'Name': name,
      'Image': image,
      'IsFeatured': isFeatured,
      'ParentId': parentId
    };
  }

//! map json oriented document snapshot from firebase to usermodel

//! expnalation of factory method

// ye jo factory likha haii iss ka matlab hai k
// jab b hm koiii aik class ka constructor use krtay hain tu hm tu siraf aik hii bar wo name use
// kr sktay hain like hm nay ooper aik dafa usermodel name use kiyaaa
// tu agar hm dobara use krtay tu ye error deta..
// tu agat hm chahtay hain k hm aik say zyada baar contructor use kr sakay tu humeim
// (factory) variable ko use krna parega.. ye by default dart mein hotaa haii
// tu jab b hm factory likhein orr usss k baad consturator ka name likhein jissay hm
// use karnay chahein hm use kr sktay hain orr ye (.) k baad uss consturator
// ka name use kr sktay hain jaisa k hm nay .fromSnapshot use kiyaa hai.. ye dot
// k baad koii b name use kr sktay hain

  factory CategoryModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;

      // map thaat json record to model
      return CategoryModel(
        id: document.id,
        name: data['Name'] ?? '',
        image: data['Image'] ?? '',
        isFeatured: data['IsFeatured'] ?? false,
        parentId: data['ParentId'] ?? '',
      );
    } else {
      return CategoryModel.empty();
    }
  }
}
