# Flutter Expense Management App 💰

A comprehensive Flutter application designed to help users efficiently manage and organize their expenses with an intuitive interface and powerful features.

## 📱 Overview

This expense management application provides a complete solution for tracking expenses, managing invoices, and maintaining financial records. Built with Flutter and following clean architecture principles, the app offers a seamless user experience for personal expense tracking.

## ✨ Features

### Core Functionality
- **Add Expenses**: Create new expense entries using an intuitive bottom sheet interface
- **Multi-Item Support**: Add multiple items within each expense entry for detailed tracking
- **Sales Expense View**: Comprehensive screen to view all recorded expenses
- **Item Confirmation**: Review and confirm items before saving through a dedicated bottom sheet
- **History Access**: View previous expense entries through a convenient history bottom sheet

### Smart Calculations
- **Auto-Calculate Totals**: Automatically compute total bill amounts from itemized lists
- **Balance Management**: Track amount paid and calculate remaining balance automatically

### Invoice Management
- **Screenshot Upload**: Capture and store invoice screenshots for record-keeping
- **Visual Documentation**: Maintain visual proof of expenses alongside data entries

## 🛠 Tech Stack

- **Framework**: Flutter & Dart
- **State Management**: Provider pattern for efficient state handling
- **Architecture**: Clean Architecture with feature-based modular structure

## 📁 Project Structure

```
lib/
├── core/
│   ├── constants/    # App-wide constants and configurations
│   ├── theme/        # Application theming and styling
│   └── routing/      # Navigation and route management
├── features/
│   └── sales_expense/
│       ├── application/  # Use cases and business logic
│       ├── data/        # Data sources and repositories implementation
│       ├── domain/      # Entities, repositories interfaces, and business rules
│       └── presentation/ # UI screens, widgets, and view logic
└── shared/
    ├── providers/    # Shared state management providers
    └── widgets/      # Reusable UI components across features
```

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / VS Code with Flutter extensions
- Android/iOS device or emulator

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/KrishBawangade/expense_management_assignment_app
   cd flutter-expense-management
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Run the application**
   ```bash
   flutter run
   ```

## 📖 How to Use

1. **Adding Expenses**
   - Tap the add button to open the expense entry bottom sheet
   - Fill in expense details and add individual items
   - Use the confirm items sheet to review before saving

2. **Viewing Expenses**
   - Navigate to the Sales Expense Screen to see all entries
   - Access the history bottom sheet for previous records

3. **Managing Payments**
   - Enter the amount paid for each expense
   - The app automatically calculates remaining balance

4. **Invoice Documentation**
   - Upload screenshots of invoices for each expense
   - Keep visual records alongside data entries

## 🏗 Architecture

The application follows **Clean Architecture** principles with a feature-based modular structure:

### Core Layer
- **Constants**: App-wide configuration values and static data
- **Theme**: Centralized styling and theming system
- **Routing**: Navigation management and route definitions

### Features Layer (sales_expense)
- **Domain**: Contains business entities, repository interfaces, and business rules (innermost layer)
- **Application**: Implements use cases and orchestrates business logic
- **Data**: Handles data sources, API calls, and repository implementations
- **Presentation**: Manages UI components, screens, and view-related logic

### Shared Layer
- **Providers**: State management providers used across multiple features
- **Widgets**: Reusable UI components that can be shared between features

This architecture ensures separation of concerns, testability, and maintainability by keeping business logic independent of external frameworks and UI implementations.

## 📱 Screenshots

*Add screenshots of your app here to showcase the user interface*

## 🤝 Contributing

This is an assignment project. If you'd like to suggest improvements:

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Submit a pull request

## 📄 License

This project is created for educational purposes as part of a Flutter development assignment.

## 📞 Contact

📧 krishbawangade08@gmailcom

---

*Built with ❤️ using Flutter*
