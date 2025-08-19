# Shopping iOS

Monthly shopping app developed in **Swift** with **SwiftUI**, following **MVVM + Clean Architecture** and **Dependency Injection**. It enables adding, editing, deleting products, managing quantities, viewing **subtotal per item** and overall total, and optionally setting a **spending limit** with remaining/over-limit alerts. Local persistence with **Swift Data** (or SQLite/Realm alternative) is supported.

> **Main stack:** Swift · SwiftUI · MVVM · Clean Architecture · SwiftData · Combine/Swift Concurrency · Xcode · Swift Package Manager

---

## ✨ Features

- **Product CRUD**: add, edit, delete items.
- **Quantity & unit price** → auto-calculated **subtotal**.
- **Real-time total** display.
- **Optional spending limit**: shows remaining balance and alerts when exceeded.
- **Local persistence**: Swift Data.
- **Declarative UI** with SwiftUI.
- **Clean Architecture**: Presentation, Domain, and Data layers separated.

---

## 🏗️ Architecture Overview

```
App/
├─ Data/              # Core Data (Entities, Persistence)
│   ├─ Persistence/   # Storage stack
│   ├─ Models/        # DTOs or Managed Objects
│   └─ Repositories/  # Repository implementations
├─ Domain/
│   ├─ Models/        # Domain entities
│   ├─ UseCases/      # Business logic
│   └─ Interfaces/    # Protocol-based abstractions
├─ Presentation/
│   ├─ Views/         # SwiftUI Views
│   ├─ ViewModels/    # ObservableObject-based state + logic
│   └─ Navigation/    # Navigation logic
├─ DI/                # Dependency Injection setup
├─ App.swift          # Entry point (@main)
└─ SceneDelegate.swift (if used)
```

**Core principles**

- **Single source of truth**: data flows repository → use case → ViewModel → View.
- **Side effects** handled in ViewModel.
- **Separation of concerns**: UI is independent of persistence/network.

---

## 🚀 How to Run

1. **Clone**:
   ```bash
   git clone https://github.com/Daztery/shopping_ios.git
   cd shopping_ios
   ```

2. **Open in Xcode**: open the `.xcodeproj` or `.xcworkspace`.

3. **Build & Run**: Select the target device and press ▶️.

---

## 🔧 Technical Setup

### Persistence
Used **SwiftData** : Entities, persistence container, Context injection.

### State Management
Usd **Combine** for reactive data flow.

### Dependency Injection
Configured via Resolver/Swinject or manual protocol-based DI.

---


## 🗺️ Roadmap Ideas

- Swipe-to-delete with animation.
- Product search/filter.
- Multiple shopping lists (e.g., monthly).
- Export/Import shopping lists.
- Cloud sync (iCloud/Realm Sync).
