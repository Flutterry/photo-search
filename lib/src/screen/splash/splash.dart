import 'package:demo/src/application.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashProvider provider;

  @override
  Widget build(BuildContext context) {
    provider = context.watch<SplashProvider>();
    return Scaffold(
      body: Form(
        key: provider.formKey,
        child: CustomScrollableColumn(
          children: [
            SizedBox(height: getHeight(10)),
            Image.asset(
              getImage('splash/logo.png'),
              width: getWidth(50),
              height: getWidth(50),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField.withLabel(
                label: 'عن ماذا تبحث',
                hint: 'فواكه',
                errorMsg: 'الرجاء ادخال عن ماذا تبحث',
                controller: provider.searchController,
                validation: textValidation,
                icon: Icons.search,
                textInputType: TextInputType.text,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: provider.search,
        backgroundColor: Colors.black,
        child: const Icon(Icons.search),
      ),
    );
  }
}
