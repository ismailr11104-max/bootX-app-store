# Implementation Tasks: Product Search & History

**Feature**: Product Search & History
**Spec**: [spec.md](../spec.md)
**Plan**: [plan.md](../plan.md)

## Execution Phases & Dependency Graph

```
Phase 1: Setup & Foundational Prerequisites
   │
   ├─► Phase 2: User Story 1 - Product Search (P1)
   │     └─► Phase 3: User Story 2 - Search History Persistence & Reuse (P2)
   │           └─► Phase 4: Dependency Injection, Routing & Testing
```

---

## Phase 1: Foundational Prerequisites (Shared Layer Alignment)

- [ ] T001 Verify existing Dio API client setup in `lib/core/services/network/api_service_impl.dart`, API base config in `lib/core/services/network/api_dio_config.dart`, and endpoints in `lib/core/services/network/api_constance.dart` (confirming `ApiConstance.search` or query parameters).
- [ ] T002 Verify existing `PrefManger` (SharedPreferences wrapper) in `lib/core/services/shared_preferences/shared_pref_manger.dart` for local persistence.
- [ ] T003 Verify existing `ProductEntity` (`lib/core/entity/product_entity.dart`) and `ProductModel` (`lib/core/model/product_model.dart`) to ensure search results reuse them without duplication.
- [ ] T004 Verify existing `ProductRepository` and `ProductRemoteDataSource` (`lib/features/home/domain/repo/product_repository.dart`, `lib/features/home/data/data_source/product_remote_data_source.dart`, `lib/features/home/data/repo/product_repository_impl.dart`) to reuse product retrieval logic.

---

## Phase 2: User Story 1 - Product Search (`[US1]`)
**Goal**: Allow shoppers to search products by keywords using the existing API and Dio, displaying matching product results with loading/error/empty states using Clean Architecture and SearchCubit.
**Independent Test Criteria**: User can enter a search query, submit, see a loading indicator, and view matching products or a friendly empty/error state.

- [ ] T005 [US1] Create search remote data source contract in `lib/features/search/data/data_source/search_remote_data_source.dart`.
- [ ] T006 [US1] Implement `SearchRemoteDataSourceImpl` using existing `ApiServiceImpl` and verified search endpoint/query parameters in `lib/features/search/data/data_source/search_remote_data_source_impl.dart`.
- [ ] T007 [US1] Create search repository abstract contract returning `Either<Failure, List<ProductEntity>>` in `lib/features/search/domain/repo/search_repository.dart`.
- [ ] T008 [US1] Implement `SearchRepositoryImpl` utilizing search remote data source and mapping errors to `Either<Failure, List<ProductEntity>>` in `lib/features/search/data/repo/search_repository_impl.dart`.
- [ ] T009 [US1] Create search products use case (`SearchProductsUseCase`) in `lib/features/search/domain/usecase/search_products_usecase.dart`.
- [ ] T010 [US1] Create `SearchCubit` managing product search state (Initial, Loading, Success, Empty, Error) in `lib/features/search/presentation/controller/search_cubit.dart`.
- [ ] T011 [US1] Create Product Search screen UI widgets (search input bar, product grid/list reusing `ProductItemCard`, loading indicator, empty/error state views) in `lib/features/search/presentation/page/search_page.dart`.

---

## Phase 3: User Story 2 - Search History Persistence & Reuse (`[US2]`)
**Goal**: Persist recent search queries locally via `PrefManger`, display them chronologically (latest-first) with uniqueness, allow tapping to re-run searches, and clear history.
**Independent Test Criteria**: User recent searches are saved locally, shown upon opening/focusing search, re-run upon tapping, and cleared when requested.

- [ ] T012 [US2] Create search history local data source contract in `lib/features/search/data/data_source/search_history_local_data_source.dart`.
- [ ] T013 [US2] Implement `SearchHistoryLocalDataSourceImpl` using `PrefManger` with JSON persistence, deduplication, latest-first ordering, and configurable history limit in `lib/features/search/data/data_source/search_history_local_data_source_impl.dart`.
- [ ] T014 [US2] Create separate `SearchHistoryRepository` abstract contract and implementation in `lib/features/search/domain/repo/search_history_repository.dart` and `lib/features/search/data/repo/search_history_repository_impl.dart`.
- [ ] T015 [US2] Create search history use cases (`GetSearchHistoryUseCase`, `SaveSearchQueryUseCase`, `ClearSearchHistoryUseCase`) in `lib/features/search/domain/usecase/`.
- [ ] T016 [US2] Update `SearchBloc` to integrate search history operations and states alongside product search in `lib/features/search/presentation/controller/search_bloc.dart`.
- [ ] T017 [US2] Add search history UI components (recent search chips/list, tap-to-search action, clear history button) to `lib/features/search/presentation/page/search_page.dart`.

---

## Phase 4: Dependency Injection, Routing & Comprehensive Testing

- [ ] T018 Register search data sources, repositories, use cases, and `SearchCubit` in GetIt service locator setup in `lib/core/services/service_locator/setup_service_locator.dart`.
- [ ] T019 Configure route generation for the Product Search screen in `lib/core/helper_functions/on_generate_routes.dart` and wire navigation entry points (e.g., search icon in home app bar).
- [ ] T020 [P] Write unit tests for `SearchProductsUseCase` and search history use cases using `flutter_test` and mocktail in `test/features/search/domain/usecase/`.
- [ ] T021 [P] Write repository tests for `SearchRepositoryImpl` and `SearchHistoryRepositoryImpl` in `test/features/search/data/repo/`.
- [ ] T022 [P] Write BLoC/Cubit tests for `SearchCubit` states using `bloc_test` in `test/features/search/presentation/controller/search_cubit_test.dart`.
- [ ] T023 [P] Write widget tests for `SearchPage` UI interactions, loading, empty states, and history reuse in `test/features/search/presentation/page/search_page_test.dart`.
- [ ] T024 Run `flutter analyze` and `dart format` across all modified and new files.

---

## Parallel Execution Examples

- **For User Story 1 (`[US1]`)**:
  - Developer A implements remote data source (`T005`, `T006`) and search repository (`T007`, `T008`).
  - Developer B implements search use case (`T009`), `SearchCubit` (`T010`), and UI page (`T011`) once repository contracts are established.
- **For User Story 2 (`[US2]`)**:
  - Developer A implements history local data source (`T012`, `T013`) and history repository (`T014`).
  - Developer B implements history use cases (`T015`), Cubit updates (`T016`), and UI components (`T017`).
- **For Testing (`Phase 4`)**:
  - Developer A writes unit & repository tests (`T020`, `T021`).
  - Developer B writes Cubit & widget tests (`T022`, `T023`) in parallel.

## Suggested MVP Scope
- **MVP**: Phase 1 + Phase 2 + Phase 4 (DI & Routing parts of T018-T019) (User Story 1 - Product Search with GetIt & Routing)
- **Fast Follow**: Phase 3 (User Story 2 - Search History Persistence & Reuse) + Comprehensive Testing (`T020`-`T024`)
