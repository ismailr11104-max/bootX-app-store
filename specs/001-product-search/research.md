# Research: Product Search & History

## Decisions & Rationale
- **State Management**: Use `ProductCubit` or `SearchBloc` following standard BLoc patterns in the project.
- **Local Storage**: Use `shared_preferences` to store a list of search query strings (e.g. `recent_searches`) with a maximum of 10 items, deduplicating on new searches.
- **API Integration**: Extend or use existing Dio client to call the search endpoint (e.g. `/products/search` or query parameter `?search=`).
