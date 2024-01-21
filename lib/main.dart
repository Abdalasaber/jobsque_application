import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque/cubit/apply_now_cubit/apply_now_cubit.dart';
import 'package:jobsque/cubit/login_security_cubit/login_security_cubit.dart';
import 'package:jobsque/cubit/on_boarding_cubit/on_boarding_cubit.dart';
import 'package:jobsque/remote_database/dio_helper.dart';
import 'cubit/applied_cubit/applied_cubit.dart';
import 'observer.dart';
import '../../../cubit/job_cubit/job_cubit.dart';
import 'cubit/language_profile_cubit/language_profile_cubit.dart';
import 'cubit/layout_cubit/layout_cubit.dart';
import 'package:sizer/sizer.dart';
import 'app_route/app_router.dart';
import 'cubit/home_cubit/home_cubit.dart';
import 'cubit/login_cubit/login_cubit.dart';
import 'cubit/message_cubit/message_cubit.dart';
import 'cubit/profile_cubit/profile_cubit.dart';
import 'cubit/register_cubit/register_cubit.dart';
import 'local_database/cache_helper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  CashHelper.init();
  DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (BuildContext context, Orientation orientation,
          DeviceType deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => LayoutCubit()),
            BlocProvider(create: (context) => LoginCubit()),
            BlocProvider(create: (context) => RegisterCubit()),
            BlocProvider(create: (context) => OnBoardingCubit()),
            BlocProvider(
              create: (context) => HomeCubit()
                ..getRecentJobs()
                ..getSuggestJobs()
                ..getFavouriteJobs(),
            ),
            BlocProvider(create: (context) => MessageCubit()),
            BlocProvider(create: (context) => ApplyNowCubit()),
            BlocProvider(create: (context) => AppliedCubit()),
            BlocProvider(
              create: (context) =>
                  JobCubit(appliedCubit: AppliedCubit.get(context)),
            ),
            BlocProvider(
                create: (context) => ProfileCubit()
                  ..getProfileDetailsAndPortfolios()
                  ..getProfileNameAndEmail()),
            BlocProvider(create: (context) => LanguageProfileCubit()),
            BlocProvider(create: (context) => LoginSecurityCubit()),
          ],
          child: const MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Jobsque',
            // initialRoute: AppRouters.splashPageRoute,
            onGenerateRoute: onGenerateRoute,
          ),
        );
      },
    );
  }
}
