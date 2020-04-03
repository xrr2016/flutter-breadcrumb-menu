# flutter breadcrumb menu

![Test](https://github.com/xrr2016/flutter-breadcrumb-menu/workflows/Test/badge.svg)

![example](./example/example.gif)

## Install

```yml
dependencies:
  flutter_breadcrumb_menu: ^0.1.2
```

## Usage

```dart
// defined routes
MaterialApp(
  routes: {
    Dev.routeName: (_) => Dev(),
    FrontEnd.routeName: (_) => FrontEnd(),
    ColdStone.routeName: (_) => ColdStone(),
    FlutterDev.routeName: (_) => FlutterDev(),
  },
);

// create breads
List<Bread> breads = [
  Bread(label: "冷石科技有限公司 ", route: ColdStone.routeName),
  Bread(label: "研发部", route: Dev.routeName),
  Bread(label: "大前端组", route: FrontEnd.routeName),
  Bread(label: "Flutter 开发", route: FlutterDev.routeName),
];

// render
Breadcrumb(breads: breads)
```

### Config

| property | type | default | description | required |
| :- | :---: | :---: | :---: | :-: |
| breads | List<Bread> | `null` | bread crumbs | true |
| color |  Colors | `Colors.blue` | bread color  | false |
| height | double | `40.0` | menu height  | false|
| separator | Widget | `Icon()` | bread separator  | false |

## Contribute

1. Fork it (https://github.com/xrr2016/flutter-breadcrumb.git)
2. Create your feature branch (git checkout -b feature/foo)
3. Commit your changes (git commit -am 'Add some foo')
4. Push to the branch (git push origin feature/foo)
5. Create a new Pull Request

## License

[MIT](./LICENSE)

