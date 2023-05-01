

void main() {
  runApp(MultiProvider(
    providers: [
 ChangeNotifierProvider<DashboardMainProvider>(create: (_) => DashboardMainProvider()),
 ChangeNotifierProvider<HomeScreenProvider>(create: (_) => HomeScreenProvider()),
  ChangeNotifierProvider<MonthlyAttendance>(create: (_) => MonthlyAttendance()),
   ChangeNotifierProvider<SeeAllResultProvider>(create: (_) => SeeAllResultProvider()),
    ChangeNotifierProvider<ReportAnalysisProvider>(create: (_) => ReportAnalysisProvider()),
     ChangeNotifierProvider<ReportDashProvider>(create: (_) => ReportDashProvider()),
 
    ],
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
       designSize: const Size(390, 844),
      // designSize: const Size(375, 844),  ==actuaal wala ye hai which i keep in every project
      //  designSize: const Size(390, 937),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            appBarTheme: AppBarTheme(
              titleTextStyle:   const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              toolbarHeight: 80,
              color: FixedColors.darkBlue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(30),
                ),
              ),
            ),
            canvasColor: Colors.white,
            fontFamily: 'Montserrat',
            primaryColor: FixedColors.darkBlue,
            cardTheme: CardTheme(
              shadowColor: const Color(0xA99E9E9E),
              color: Colors.white,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r)),
            ),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: FixedColors.darkBlue)),
                home: const SplashScreen(),
        // home: const ExamDetailScreen(),
        onGenerateRoute: Namedroutes().routing,
      ),
    );
  }
}
