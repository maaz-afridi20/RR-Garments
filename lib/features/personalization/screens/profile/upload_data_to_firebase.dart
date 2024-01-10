import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class UploadDummyDataToFirebaseScreen extends StatelessWidget {
  const UploadDummyDataToFirebaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryRepository());
    // final firebaseStorageServiceController = Get.put(TFirebaseStorageService());
    return Scaffold(
      appBar: TAppbar(showBackArrow: true, title: 'Upload Data'.text.make()),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: TSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            'Main Record'.text.make(),
            TSettingMenuTile(
                icon: Iconsax.category,
                title: 'Upload Categories',
                subtitle: 'Upload all of your categories here',
                trailing: GestureDetector(
                    onTap: () =>
                        controller.uploadDummyData(TDummyData.categories),
                    child: const Icon(Icons.drive_folder_upload))),
            TSettingMenuTile(
              icon: Iconsax.card_tick,
              title: 'Upload Products',
              subtitle: 'Upload all of your products here',
              trailing: GestureDetector(
                  onTap: () {},
                  // FirebaseStorageController().uploadImagesAsAWhole(),
                  child: const Icon(Icons.drive_folder_upload)),
            ),
            const TSettingMenuTile(
                icon: Iconsax.shop,
                title: 'Upload Brands',
                subtitle: 'Upload all of your brands here',
                trailing: Icon(Icons.drive_folder_upload)),
            const TSettingMenuTile(
                icon: Iconsax.cloud_add,
                title: 'Upload Banners',
                subtitle: 'Upload all of your banners here',
                trailing: Icon(Icons.drive_folder_upload)),
            TSettingMenuTile(
              icon: Iconsax.card_tick,
              title: 'Upload Products',
              subtitle: 'Upload all of your products here',
              trailing: GestureDetector(
                  // onTap: () => controller.,
                  child: const Icon(Icons.drive_folder_upload)),
            ),
          ],
        ),
      ),
    );
  }
}
