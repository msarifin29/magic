# feature

[![Powered by Mason](https://img.shields.io/endpoint?url=https%3A%2F%2Ftinyurl.com%2Fmason-badge)](https://github.com/felangel/mason)

Installation 🚀
```
dart pub global activate mason_cli
```

Initializing 🎯
```
mason init
```

copy in mason.yaml
```
bricks:
  template:
    git:
      url: https://github.com/msarifin29/magic.git
      path: bricks/template
```

Next 🍺
```
mason get
```

Usage

```
 mason make template
```
<!-- Structure Folder template
 ```
src/
├─ common_widgets/
│  ├─ responsive_layout_builder.dart
├─ constant/
│  ├─ app_string.dart
│  ├─ base_assets.dart
│  ├─ breakpoint.dart
│  ├─ sizes.dart
│  ├─ themes/
│  │  ├─ app_color.dart
│  │  ├─ font_manager.dart
├─ routing/
│  ├─ app_route.dart
├─ utils/
├─ exceptions/
├─ features/
``` -->
