import 'package:cached_network_image/cached_network_image.dart';
import 'package:demo/src/application.dart';
import 'package:demo/src/screen/home/local_model/local_models.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CustomImage extends StatelessWidget {
  final ImageModel image;

  const CustomImage({Key? key, required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: image.urls.regular,
          placeholder: (context, _) => const Center(
            child: SpinKitCircle(color: Colors.black),
          ),
          errorWidget: (context, _, __) =>
              const Center(child: Icon(Icons.error)),
        ),
      ),
    );
  }
}
