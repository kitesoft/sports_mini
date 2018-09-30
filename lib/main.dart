import 'package:sports_mini/common/base.dart';
//
import 'package:sports_mini/components/home/page.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    League _league = League.fromJson(initLeagueMap);
    return MaterialApp(
        title: '体育+',
        theme:
            ThemeData(primarySwatch: Colors.blue, platform: TargetPlatform.iOS),
        home: HomePage(title: _league.name, league: _league));
  }
}
