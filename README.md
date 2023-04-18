Change Maps Key helps you change the Google Maps Key inside Android and iOS folder

## Installation

To use Change Maps Key on the command line, install using `pub global activate`:

```bash
$ pub global activate change_maps_key
```

To update Change Maps Key, use the same `pub global activate` command.

## Usage

A simple usage example:

```bash

dart pub global run change_maps_key --key="111111111"

Output:

-> Android key updated to: 111111111
-> iOS key updated to: 111111111

```
The key on Android is changed in the following path: `android\\app\\src\\main\\AndroidManifest.xml`

The key on iOS is change in the following path:  `ios\\Runner\\AppDelegate.swift`

## Attention

Make sure your `AndroidManifest` file is with the key writted in 2 lines, example:

```bash
<meta-data android:name="com.google.android.geo.API_KEY"
                        android:value="000000"/>
```

If the key is 1 line only, `it's not going to work properly`, example:

```bash
<meta-data android:name="com.google.android.geo.API_KEY" android:value="000000"/>
```
