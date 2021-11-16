import 'package:demo/src/application.dart';
import 'package:demo/src/screen/home/local_widget/local_widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<HomeProvider>();
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: provider.q,
          fontSize: 12,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),
      body: provider.images == null
          ? const Center(child: SpinKitRipple(color: Colors.black))
          : provider.images!.isEmpty
              ? const Center(child: CustomText(text: 'لا توجد صور'))
              : ListView.builder(
                  controller: provider.scrollController,
                  itemBuilder: (context, index) {
                    return CustomImage(image: provider.images![index]);
                  },
                  itemCount: provider.images!.length,
                ),
    );
  }
}
