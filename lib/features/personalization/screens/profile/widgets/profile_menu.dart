import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TProfileMenu extends StatelessWidget {
  const TProfileMenu(
      {super.key,
      required this.value,
      required this.title,
      required this.onPressed,
      this.icon = Iconsax.arrow_right_34});

  final IconData icon;
  final VoidCallback onPressed;
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: TSizes.spaceBwItems / 1.5),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Text(title,
                  style: Theme.of(context).textTheme.bodySmall,
                  overflow: TextOverflow.ellipsis),
            ),
            Expanded(
              flex: 5,
              child: Text(value,
                  style: Theme.of(context).textTheme.bodyMedium,
                  overflow: TextOverflow.ellipsis),
            ),
            Icon(icon, size: 18),
          ],
        ),
      ),
    );
  }
}
