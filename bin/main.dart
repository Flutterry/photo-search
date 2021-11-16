import 'package:chaotic_helper/init.dart';
import 'package:chaotic_helper/backend.dart';

Future<void> main() async {
  Chaotic.applicationName = "demo";
  
  
  await Chaotic.clear();
}
