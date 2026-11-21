# Data Model: Product Search & History

## Entities
1. `ProductEntity` (Domain)
   - `id`: String / int
   - `title`: String
   - `price`: double
   - `imageUrl`: String
   - `description`: String

2. `SearchHistoryItem` (Domain / Value Object)
   - `query`: String
   - `timestamp`: DateTime

## Models (Data DTOs)
1. `ProductModel` extending `ProductEntity`
   - `fromJson`, `toJson`
2. `SearchHistoryModel` (JSON serialization for shared_preferences if needed, or plain string list)
