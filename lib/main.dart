import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:promina_task/modules/gellary/presentaion/cubit/gallery_cubit.dart';

import 'gallery_app.dart';
import 'injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await diInit();

  runApp( BlocProvider<GalleryCubit>(
    create: (BuildContext context) {
      return GalleryCubit(sl(),sl(),sl())..init();
    },
  child:const GalleryApp() ,));
}

