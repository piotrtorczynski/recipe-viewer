# 🍲 Recipe Finder App

A Swift-based iOS application that allows users to search for various recipes and explore details such as ingredients, calories, cuisine type, and cooking time. Users can also view the full recipe in a full-screen web view. This project showcases modern SwiftUI development practices, MVVM architecture, dependency injection, async/await for network requests, and smooth UI animations.

## 🚀 Features

- **Search for Recipes**: Users can search for recipes using keywords.
- **Recipe Details**: Displays detailed information about each recipe, including ingredients, calories, total time, and cuisine type.
- **Full-Screen Modal for Full Recipe**: View the full recipe instructions in a web view, launched in a full-screen modal.
  
## 🛠️ Technology and Frameworks

This project demonstrates several modern iOS development techniques, including:

### 1. **SwiftUI**
   - **Declarative UI**: The app uses SwiftUI to build its user interface declaratively.
   - **`NavigationStack`**: Manages navigation in a stack-based way to navigate between views.

### 2. **MVVM Architecture**
   - **ViewModel-driven views**: Implements the Model-View-ViewModel pattern to separate logic from UI.
   - **ObservableObject & Published**: Uses SwiftUI's `@StateObject` and `@Published` properties to handle state management and updates efficiently.

### 3. **Async/Await for Network Requests**
   - **Concurrency**: Utilizes Swift's `async/await` syntax for network calls to the Edamam API, ensuring a smooth and responsive user experience.
   - **Error Handling**: Gracefully handles any errors in fetching recipe data from the API with the use of Swift’s `do/catch` block.

### 4. **Dependency Injection**
   - **Factory Pattern**: Uses [Factory](https://github.com/hmlongco/Factory) for dependency injection to make the code modular, testable, and maintainable.

### 5. **Unit Testing**
   - **XCTest Framework**: Includes unit tests for ViewModels, ensuring the correctness of core business logic, network calls, and state management.

### 6. **UI Testing**
   - **Swifter and XCUITests**: I am using a local mock server to create a safe environment for testing UI

### 7. **Networking**
   - **API Integration**: Integrates with the [Edamam Recipe Search API](https://developer.edamam.com/), fetching recipe data using an HTTP request.
   - **URLSession**: Uses Swift's native `URLSession` for networking.
