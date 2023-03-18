import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:social_media/providers/main/main_provider.dart';
import 'package:social_media/providers/search/search_provider.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => MainProvider()),
  ChangeNotifierProvider(create: (_) => SearchProvider())
];
