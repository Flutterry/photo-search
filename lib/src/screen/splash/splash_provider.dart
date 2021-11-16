import 'package:demo/src/application.dart';

class SplashProvider extends ChangeNotifier {
  final searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void search() {
    if (!formKey.currentState!.validate()) return;
    push(HomeScreen(), HomeProvider(q: searchController.text));
  }
}
