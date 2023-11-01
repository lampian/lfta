import 'package:flutter/material.dart';
import 'package:lfta_question1/features/character/presentation/bloc/characters_bloc.dart';
import 'package:lfta_question1/features/character/presentation/page/characters_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  registerGetItDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharactersBloc(),
        ),
        // BlocProvider(
        //   create: (context) => SubjectBloc(),
        // ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CharactersPage(),
      ),
    );
  }
}
