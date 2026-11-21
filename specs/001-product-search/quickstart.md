# Quickstart: Product Search & History

## Prerequisites
- Flutter SDK (^3.13.5) installed
- Dependencies installed via `flutter pub get`

## Validation Scenarios
1. **Search Flow**:
   - Open app and navigate to Product Search screen.
   - Type query in search bar and submit.
   - Verify matching products are displayed from API via Dio.
2. **History Persistence**:
   - Perform multiple searches.
   - Reopen search screen or focus search bar to view recent searches list.
   - Tap a history item and verify search re-executes.
   - Clear history and verify list empties.
