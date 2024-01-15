import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TVerticalImageText extends StatelessWidget {
  const TVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = Colors.white,
    this.backgroundColor = Colors.white,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunction.isDarkMode(context);
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: TSizes.spaceBwItems),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //  ------------------------------- circulor icon ---------------------------------

              Container(
                width: 56,
                height: 56,
                padding: const EdgeInsets.all(TSizes.sm),
                decoration: BoxDecoration(
                  color:
                      backgroundColor ?? (dark ? Colors.white : Colors.black),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),

              const SizedBox(height: TSizes.spaceBwItems / 2),
              //  ------------------------------- Texts below circulor icon ---------------------------------

              SizedBox(
                width: 55,
                height: 50,
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.labelSmall!.apply(
                        color: textColor,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
