<p align="center">
  <img src="https://raw.githubusercontent.com/abdoulrl2028-cloud-Dev/abdoulrl2028-cloud-Dev/main/assets/projects/sales.jpg" alt="Sales Force Flutter app" width="100%">
</p>

# Sales Force Mobile Flutter

A field-sales mobile app built with Flutter and Clean Architecture.

## Documentation

- [SETUP.md](SETUP.md) — setup and how to run
- [TECHNOLOGIES.md](TECHNOLOGIES.md) — libraries and tools

## Architecture

```
lib/
 ├── core/
 │    ├── theme/          # themes, colors, and text styles
 │    ├── utils/          # validators, formatters, and helpers
 │    └── constants/
 ├── features/
 │    ├── auth/           # data, domain, and presentation (BLoC, pages, widgets)
 │    └── sales/          # data, domain, and presentation
 └── main.dart
```

## Features

### Authentication

- Login, registration, password recovery, and logout

### Sales

- Sales list and details
- Create a sale
- Filters, search, and reports

### Products

- Product list and details
- Search and category filters
- Stock control

## Technologies

- **Flutter** for the mobile UI
- **BLoC** for state
- **HTTP/Dio** for requests
- **SharedPreferences** for local storage
- **Intl** for formatting

## Design patterns

- Clean Architecture
- Repository pattern
- BLoC
- Dependency injection

## Run

Requirements: Flutter SDK 3.0.0 or newer, Android Studio or Xcode, and a device or emulator.

```bash
git clone https://github.com/abdoulrl2028-cloud-Dev/sales-force-mobile-flutter.git
cd sales-force-mobile-flutter
flutter pub get
flutter run
```

See [SETUP.md](SETUP.md) for the full steps.

## Layers

1. **Domain** — business rules: entities, repository interfaces, and use cases.
2. **Data** — remote and local data sources, models, and repository implementations.
3. **Presentation** — BLoC, pages, and reusable widgets.

## Project status

- 37 Dart files
- Clean Architecture and BLoC in place
- Ready for further feature work

## Useful commands

```bash
flutter clean
flutter pub upgrade
flutter analyze
flutter format lib/
flutter test
```

## Notes

- This is a clean template.
- API URLs are examples.
- Add the product-specific behavior, tests, and CI before a store release.

## Next steps

- [ ] Connect real authentication to a backend
- [ ] Add unit, widget, and integration tests
- [ ] Finish internationalization
- [ ] Add cache and offline sync
- [ ] Add analytics and crash reporting
- [ ] Set up CI/CD
- [ ] Publish on Google Play and the App Store

## Contact

GitHub: [@abdoulrl2028-cloud-Dev](https://github.com/abdoulrl2028-cloud-Dev)
