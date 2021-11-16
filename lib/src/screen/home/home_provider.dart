import 'package:bot_toast/bot_toast.dart';
import 'package:demo/src/application.dart';
import 'package:demo/src/screen/home/local_model/local_models.dart';

class HomeProvider extends ChangeNotifier {
  final scrollController = ScrollController();
  final String q;
  final dioService = DioService.getInstance();
  List<ImageModel>? images;

  int currentPage = 1;
  int lastPage = 1;
  bool isLoading = false;

  HomeProvider({required this.q}) {
    load();
    scrollController.addListener(() {
      if (scrollController.position.pixels * 2 >=
          scrollController.position.maxScrollExtent) {
        load();
      }
    });
  }

  Future<void> load() async {
    if (currentPage > lastPage) {
      BotToast.showText(text: 'نهايه النتائج');
      return;
    }
    if (isLoading) return;
    isLoading = true;

    final data = {
      'query': q,
      'page': currentPage,
      'per_page': 15,
      'client_id': unsplashKey,
    };
    final result = await dioService.get(
      searchApi,
      queryParameters: data,
    );
    isLoading = false;

    if (result.response == null) return;
    currentPage++;
    lastPage = result.response!.data['total_pages'];
    images ??= <ImageModel>[];
    for (final object in result.response!.data['results']) {
      images!.add(ImageModel.fromMap(object));
    }
    notifyListeners();
  }
}
