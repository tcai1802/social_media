import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'package:social_media/providers/add/add_provider.dart';
import 'package:social_media/providers/providers.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => MainProvider()),
  ChangeNotifierProvider(create: (_) => SearchProvider()),
  ChangeNotifierProvider(create: (_) => ProfileProvider()),
  ChangeNotifierProvider(create: (_) => AddProvider()),
  ChangeNotifierProvider(create: (_) => AddPostProvider()),
  ChangeNotifierProvider(create: (_) => CameraProvider()),
];
