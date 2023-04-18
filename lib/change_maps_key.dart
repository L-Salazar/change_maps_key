library change_maps_key;

import 'dart:io';

String androidManifestPath = '.\\android\\app\\src\\main\\AndroidManifest.xml';

String iosPath = '.\\ios\\Runner\\AppDelegate.swift';

String indexWebPath = '.\\web\\index.html';

Future<void> changeAndroidKey(String key) async {
  try {
    final androidManifest = File(androidManifestPath).readAsStringSync();
    final androidManifestByLine = androidManifest.split('\n');

    for (var i = 0; i < androidManifestByLine.length; i++) {
      if (androidManifestByLine[i].contains(
          '<meta-data android:name="com.google.android.geo.API_KEY')) {
        androidManifestByLine[i + 1] =
            '                       android:value="$key"/>';
        break;
      }
    }
    File(androidManifestPath)
        .writeAsStringSync(androidManifestByLine.join('\n'));

    print('Android key updated to: $key');
  } catch (e) {
    print('''
    Android key could not be change because,
    The AndroidManifest file could not be found in that path: $androidManifestPath
''');
  }
}

Future<void> changeIosKey(String key) async {
  try {
    final appDelegateSwift = File(iosPath).readAsStringSync();
    final appDelegateSwiftByLine = appDelegateSwift.split('\n');

    for (var i = 0; i < appDelegateSwiftByLine.length; i++) {
      if (appDelegateSwiftByLine[i].contains('GMSServices.provideAPIKey')) {
        appDelegateSwiftByLine[i] = '    GMSServices.provideAPIKey("$key")';
        break;
      }
    }
    File(iosPath).writeAsStringSync(appDelegateSwiftByLine.join('\n'));

    print('IOS key updated to: $key');
  } catch (e) {
    print('''
    iOS key could not be change because,
    The AppDelegate file could not be found in that path: $iosPath

''');
  }
}

Future<void> changeWebKey(String key) async {
  try {
    final indexFile = File(indexWebPath).readAsStringSync();
    final indexFileByLine = indexFile.split('\n');

    for (var i = 0; i < indexFileByLine.length; i++) {
      if (indexFileByLine[i]
          .contains('https://maps.googleapis.com/maps/api/js')) {
        indexFileByLine[i] =
            '  <script src="https://maps.googleapis.com/maps/api/js?key=$key"></script>';
        break;
      }
    }
    File(indexWebPath).writeAsStringSync(indexFileByLine.join('\n'));

    print('Web key updated to: $key ');
  } catch (e) {
    print('''
    Web key could not be change because,
    The index.html file could not be found in that path: $indexWebPath

''');
  }
}
