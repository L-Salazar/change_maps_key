import 'package:args/args.dart';

import 'package:change_maps_key/change_maps_key.dart' as changer;

void main(List<String> args) async {
  final parser = ArgParser();

  parser.addOption('key', abbr: 'k', help: 'Google Maps API Key to be changed');
  parser.addFlag('help', abbr: 'h', help: 'See instructions');

  final results = parser.parse(args);

  if (results.wasParsed('help')) {
    print('''
change_maps_key: Help you change the Google Maps API key

${parser.usage}

''');
  }

  if (results.wasParsed('key')) {
    final key = results['key'] as String;

    //ANDROID
    changer.changeAndroidKey(key);

    //IOS
    changer.changeIosKey(key);

    //WEB
    changer.changeWebKey(key);
  }
}
