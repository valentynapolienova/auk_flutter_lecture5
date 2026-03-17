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

<table>
  <tr>
    <td valign="top" align="left">
      <img
        width="256"
        height="256"
        alt="icon"
        src="https://github.com/user-attachments/assets/80c31805-a5e2-471d-bce0-000d9fde70fd"
      />
    </td>
    <td valign="top" align="left">
      <img
        width="300"
        height="800"
        alt="Simulator Screenshot - iPhone 16 Pro - 2025-11-07 at 14 49 29"
        src="https://github.com/user-attachments/assets/2da6262b-426f-498d-92b6-5a5c1a1f2c0f"
      />
    </td>
  </tr>
</table>
