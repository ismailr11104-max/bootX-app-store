# bootx_app

## Commands
- **Run/Build:** `flutter run`
- **Lint / Static Analysis:** `flutter analyze`
- **Test:** `flutter test`
- **Install Dependencies:** `flutter pub get`
- **Clean Build Cache:** `flutter clean`

## Architecture & Guidelines

### Directory Structure (`lib/`)
```
lib/
├── core/
│   ├── error/                 # Custom Exception and Failure classes
│   ├── helper_functions/      # Navigation and route generation (on_generate_routes.dart)
│   ├── model/                 # Shared data models
│   ├── services/
│   │   ├── network/           # Dio API client, config, and service implementations
│   │   ├── service_locator/   # Dependency injection setup (GetIt)
│   │   └── shared_preferences/# Local key-value storage manager
│   ├── utils/                 # App colors, fonts, images, text styles, and validators
│   └── wigets/                # Reusable cross-feature widgets
└── features/
    ├── auth/                  # Authentication feature
    │   ├── data/              # Data sources, models, and repository implementations
    │   ├── domain/            # Entities, abstract repository contracts, and use cases
    │   └── presentation/      # BLoC state management, pages, and UI widgets
    ├── home/                  # Home dashboard feature
    ├── onboarding/            # Onboarding flow feature
    └── splash/                # Splash screen feature
```

### Clean Architecture Layers & Dependency Direction
- **Layers:**
    1. **Data Layer:** Remote/local data sources, models/DTOs, repository implementations, API requests, data mapping.
    2. **Domain Layer:** Entities, abstract repository contracts, use cases (business logic independent of Flutter and external packages).
    3. **Presentation Layer:** Screens, widgets, BLoC/Cubit for state management, UI states, user interactions.
- **Dependency Direction:** `Presentation → Domain ← Data`

### Feature Modules
- **Modular Structure:** Each feature in `lib/features/` (e.g., `auth`, `home`, `onboarding`, `splash`) encapsulates its own domain, data, and presentation layers.
- **Isolation & Independence:** Features should be self-contained and avoid tight coupling or circular dependencies between different features.
- **Core Sharing:** Common widgets (`lib/core/widgets/`), services (`lib/core/services/`), utilities (`lib/core/utils/`), and error/routing logic (`lib/core/error/`, `lib/core/helper_functions/`) are shared globally across all feature modules.
- **Feature Anatomy:**
    - `data/`: Data sources (`date_sourse/`), models (`model/`), and repository implementations (`repo/`).
    - `domain/`: Entities (`entity/`), abstract repository contracts (`repo/`), and use cases.
    - `presentation/`: BLoCs/Cubits (`bloc/`), screens/pages (`page/`), and feature-specific widgets (`widget/`).

### Tech Stack & Packages
- Language: Dart (`^3.13.5`)
- Framework: Flutter
- State Management: `flutter_bloc` (`Bloc` / `Cubit`)
- Networking: `dio`
- Dependency Injection: `get_it` (configured in `lib/core/services/service_locator/setup_service_locator.dart`)
- Local Storage: `shared_preferences`
- Functional Error Handling: `dartz` (`Either<Failure, T>`)
- Other: `flutter_svg`, `smooth_page_indicator`, `device_preview`, `equatable`

### Conventions
- Naming: `snake_case` for files/folders, `PascalCase` for classes/enums, `camelCase` for variables/methods/parameters.
- Single responsibility per class.

### Do's
- Follow existing feature-based structure and Clean Architecture / SOLID principles.
- Use `const` constructors where possible.
- Write unit tests for use cases and repositories using `flutter_test`.
- Register dependencies via `get_it` setup service locator.
- Handle errors using specific exceptions and failures via `dartz`.
- Use BLoC/Cubit exclusively for state management.

### Don'ts
- Don't add new packages without asking first.
- Don't modify existing public APIs.
- Don't use `print()` — use Logger.
- Don't use `setState()` — use BLoC/Cubit only.
- Don't catch generic `Exception` — catch specific exception types.
- Don't use `dynamic` — always specify explicit types.
- Don't put business logic inside UI widgets.
- Don't make network requests directly from the presentation layer.
- Don't bypass the existing dependency injection setup.
- Don't duplicate existing functionality or create unnecessary abstractions.

## AI Workflow
- Before implementing any feature, read AGENTS.md and inspect the relevant existing code.
- Understand the existing architecture and follow the closest matching implementation.
- Never assume file paths or class names; inspect the project first.
- Identify the required Data, Domain, and Presentation changes before implementation.
- Make only the necessary changes.
- Preserve existing functionality and avoid unrelated modifications.
- Run `dart format` on modified Dart files.
- Run `flutter analyze` after implementation.
- Run relevant unit tests and fix introduced failures.
- Never claim that tests or analysis passed without actually running them.
- Report changed files and summarize the implementation.
