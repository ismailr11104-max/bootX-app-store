# Implementation Plan: Product Search & History

## Technical Context
- Language/Framework: Dart (^3.13.5), Flutter
- State Management: flutter_bloc (Bloc / Cubit)
- Networking: dio via `ApiServiceImpl` (`ApiConstance.search` or `ApiConstance.products` with query params)
- Local Storage: `PrefManger` (SharedPreferences wrapper) for persisting search history locally
- Architecture: Clean Architecture (`Data`, `Domain`, `Presentation` layers) under `lib/features/search/` (or reusing `lib/features/home/` domain/data components)
- Dependency Injection: `get_it` configured in `lib/core/services/service_locator/setup_service_locator.dart`
- Functional Error Handling: `dartz` (`Either<Failure, T>`)

## Constitution Check
- Follows existing feature-based structure and Clean Architecture / SOLID principles.
- Uses `const` constructors where possible.
- Uses BLoC/Cubit exclusively for state management.
- Uses `dartz` (`Either<Failure, T>`) for error handling.
- Reuses existing `ProductEntity`, `ProductModel`, `ProductRepository`, `Dio`, and `PrefManger` without duplication.

## Phase 0: Outline & Research
- **API Endpoint Verification**: Verify search API usage (`ApiConstance.search` or query params on `ApiConstance.products`). Research confirms `ApiConstance.search` endpoint exists (`/api/search`) or query parameter filtering can be performed via product repository.
- **Search History Rules**:
  - Store search history list as a JSON-encoded list of strings or structured items in SharedPreferences.
  - Enforce uniqueness (case-insensitive or exact matching, moving recent duplicate to top).
  - Enforce latest-first ordering (newest query prepended).
  - Configurable history limit (default max 10 items).
- **Error Handling**: Catch specific exceptions and map them to `Failure` objects using `dartz` (`Either<Failure, List<ProductEntity>>`).
- **Testing Strategy**:
  - Unit tests for UseCases and Repositories using `flutter_test` and mocktail.
  - BLoC tests using `bloc_test`.
  - Widget tests for the search screen, history list, and empty/error states.

## Phase 1: Design & Contracts

### 1. Data Models & Entities
- Reuse `ProductEntity` and `ProductModel` from `lib/core/entity/product_entity.dart` and `lib/core/model/product_model.dart`.
- Define `SearchHistoryEntity` / model if needed, or manage string queries with timestamps.

### 2. Interface Contracts (`/contracts` or feature domain repos)
- **SearchRemoteDataSource**: `Future<List<ProductModel>> searchProducts(String query);`
- **SearchHistoryLocalDataSource**: 
  - `Future<List<String>> getSearchHistory();`
  - `Future<void> saveSearchQuery(String query);`
  - `Future<void> clearSearchHistory();`
- **SearchRepository** (can extend or integrate with `ProductRepository`):
  - `Future<Either<Failure, List<ProductEntity>>> searchProducts(String query);`
  - `Future<Either<Failure, List<String>>> getSearchHistory();`
  - `Future<Either<Failure, void>> saveSearchQuery(String query);`
  - `Future<Either<Failure, void>> clearSearchHistory();`

### 3. Quickstart Validation Guide (`quickstart.md`)
- Document steps to run unit/bloc tests and run the app to verify product search and persistent history.
