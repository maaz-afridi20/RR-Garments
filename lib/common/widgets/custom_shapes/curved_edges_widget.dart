import 'package:coding_with_t_ecommerce2/common/widgets/custom_shapes/curved_edges.dart';
import 'package:coding_with_t_ecommerce2/utils/constants/imported_statement.dart';

class TCurvedEdgesWidget extends StatelessWidget {
  const TCurvedEdgesWidget({super.key, this.child});

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(clipper: TCustomCurvedEdges(), child: child);
  }
}
