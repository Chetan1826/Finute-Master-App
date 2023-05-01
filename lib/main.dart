import 'package:edumate/providers/analysis_provider.dart';
import 'package:edumate/providers/dashboard_provider.dart';
import 'package:edumate/providers/homescreen_provider.dart';
import 'package:edumate/providers/monthlyAttendance_provider.dart';
import 'package:edumate/providers/report_dash_provider.dart';
import 'package:edumate/providers/seeallresult_provider.dart';
import 'package:edumate/routes.dart';
import 'package:edumate/screens/splashscreen.dart';
import 'package:edumate/shared/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

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


// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_datagrid/datagrid.dart';

// void main() {
//   runApp(MyApp());
// }

// /// The application that contains datagrid on it.
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Syncfusion DataGrid Demo',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: MyHomePage(),
//     );
//   }
// }

// /// The home page of the application which hosts the datagrid.
// class MyHomePage extends StatefulWidget {
//   /// Creates the home page.
//   MyHomePage({Key? key}) : super(key: key);

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   List<Result> result = <Result>[];
//   late ResultDataSource resultDataSource;

//   @override
//   void initState() {
//     super.initState();
//     result = getResultData();
//     resultDataSource = ResultDataSource(resultData: result);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Syncfusion Flutter DataGrid'),
//       ),
//       body: SfDataGrid(
//        allowPullToRefresh: true,
//         source: resultDataSource,
//         columnWidthMode: ColumnWidthMode.fill,
//         columns: <GridColumn>[
//           GridColumn(
//               columnName: 'group',
//               label: Container(
//                   padding: const EdgeInsets.all(16.0),
//                   alignment: Alignment.center,
//                   child: const Text(
//                     'Group',
//                   ))),
//           GridColumn(
//               columnName: 'totalMarks',
//               label: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: const Text('Total Marks'))),
//           GridColumn(
//               columnName: 'obtained',
//               label: Container(
//                   padding: const EdgeInsets.all(8.0),
//                   alignment: Alignment.center,
//                   child: const Text(
//                     'Obtained',
//                     overflow: TextOverflow.ellipsis,
//                   ))),
       
//         ],
//       ),
//     );
//   }

//   List<Result> getResultData() {
//     return [
//       Result(group: "Jan 23", totalMarks: 200, obtained: 193),
//        Result(group: "Jan 24", totalMarks: 200, obtained: 150),
//           Result(group: "Jan 25", totalMarks: 200, obtained: 13),
//        Result(group: "Jan 26", totalMarks: 200, obtained: 110),
//           Result(group: "Jan 27", totalMarks: 200, obtained: 99),
//        Result(group: "Jan 24", totalMarks: 200, obtained: 90),
//           Result(group: "Jan 28", totalMarks: 200, obtained: 193),
//        Result(group: "Jan 24", totalMarks: 200, obtained: 190),
//           Result(group: "Jan 29", totalMarks: 200, obtained: 173),
//        Result(group: "Jan 21", totalMarks: 200, obtained: 15),
//     ];
//   }
// }

// class Result {
//   Result({required this.group, required this.totalMarks,required this.obtained});
//   final dynamic group;
//   final num totalMarks;
//   final num obtained;
// }
// class ResultDataSource extends DataGridSource {
//   ResultDataSource({required List<Result> resultData}) {
//     _resultData = resultData
//         .map<DataGridRow>((e) => DataGridRow(cells: [
//               DataGridCell<dynamic>(columnName: 'groop', value: e.group),
//               DataGridCell<num>(columnName: 'totalMarks', value: e.totalMarks),
//               DataGridCell<num>(
//                   columnName: 'obtained', value: e.obtained),
              
//             ]))
//         .toList();
//   }

//   List<DataGridRow> _resultData = [];

//   @override
//   List<DataGridRow> get rows => _resultData;

//   @override
//   DataGridRowAdapter buildRow(DataGridRow row) {
//     return DataGridRowAdapter(
//         cells: row.getCells().map<Widget>((e) {
//       return Container(
//         alignment: Alignment.center,
//         padding: const EdgeInsets.all(8.0),
//         child: Text(e.value.toString()),
//       );
//     }).toList());
//   }
// }

