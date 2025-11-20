# lecture3

Simple to-do app that lets user add/remove tasks.

## Steps

0. Edit linter rules in analysis_options.yaml to add const and print warnings.
1. Add `flutter_slidable` package to `pubspec.yaml`: (https://pub.dev/packages/flutter_slidable)
2. Create a text_style.dart file to define common text styles.


```yaml
dependencies:
  flutter:
    sdk: flutter

  flutter_slidable: ^4.0.3
```
3. Create a TodoTask class with title and isDone fields.
4. Create main page.
5. Handle user interactions.
6. Optionally set a custom icon (https://pub.dev/packages/flutter_launcher_icons)