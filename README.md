# CherryMVP
 
## Project Structure

lib/ ├── assets/ │ ├── images/ # Stores image assets  │ └── fonts/ # Custom fonts ├── core/ # Core functionalities shared across the app │ ├── config/ # App constants │ │ ├── app_colors.dart # Colors used in the app │ │ ├── app_strings.dart # App strings (for localization readiness) │ │ ├── app_icons.dart # Icon paths │ │ ├── app_fonts.dart # Font setup │ │ ├── config.dart # Simplified imports for config files │ ├── models/ │ │ └── user.dart # General User model │ ├── services/ # Services to interact with Firebase/Auth │ │ ├── firebase_auth_service.dart │ │ ├── firestore_service.dart │ ├── utils/ # Helper utilities │ │ ├── status.dart # Status management class │ │ ├── dependency.dart # Dependency Injection setup │ ├── widgets/ # Shared reusable widgets │ │ ├── custom_button.dart # Custom button widget │ │ ├── custom_form_field.dart # Custom text form field │ └── router/ # Handles navigation │ ├── nav_routes.dart # Defines named routes │ ├── router.dart # Exports navigation files ├── features/ # Each feature is modularized │ ├── login/ # Login Feature │ │ ├── models/ │ │ │ ├── login_model.dart # Holds login data │ │ ├── repository/ │ │ │ ├── login_repository.dart # Handles login logic │ │ ├── viewmodel/ │ │ │ ├── login_viewmodel.dart # Manages login state │ │ ├── ui/ │ │ │ ├── login_screen.dart # Login UI │ ├── register/ # Similar structure for register feature │ ├── home/ # Home Feature │ ├── dashboard/ # Dashboard Feature │ ├── profile/ # Profile Feature └── main.dart # Entry point

### Key Points:
- **MVVM Architecture**: The project uses the **MVVM approach** for clean code and separation of concerns.
- **Provider**: The project uses **Provider** for state management and dependency injection, ensuring consistent and efficient dependency management across the app.
- **Feature Consistency**: Other features should follow the same approach as the **Login feature**, ensuring consistency in structure across **Models, Repositories, ViewModels, and UI components**.
- **Welcome Page/LoginForm**: The **Pages** provide a good example of how to navigate between screens and use other dependencies/resources within the app, providing a good starting point for understanding the project structure and flow.

---

## Setup and How to Contribute
### Prerequisites

Make sure you have the following installed:

- Flutter SDK (latest stable version)
- Android Studio (Recommended) / VS Code
- An emulator or a real device

### Step 1: Pick Up an Issue
- Before you start working on a feature or bug fix, check the issues tab and pick one that you’d like to work on.

### Step 1: Clone the Repository
- git clone https://github.com/your-repo/flutter-mvvm-project.git
- cd flutter-mvvm-project

### Step 2: Create a Feature Branch from main
- git checkout -b feature-new-feature

### Step 3: Install Dependencies
- Create a .env file and update it with necessary credentials in the root directory
- flutter clean (optional)
- flutter pub get

### Step 4: run the project
- flutter run

### Step 5: Submit a Pull Request
- Once you’re done with your changes, submit a pull request from your feature branch to the main branch of the CherryMVP repository

### Step 6: Follow the PR Guidelines
- Add screenshots or images of any UI changes.
- Provide a clear description of the changes made.
- Ensure that the code follows the project's coding standards

### Understanding the Project Architecture
To better understand the architecture of this project, it may be helpful to read the official Flutter documentation using the links below: 
- UI: https://docs.flutter.dev/ui/layout
- Flutter App Architecture Guide: https://docs.flutter.dev/app-architecture/concepts
- Compass App case study:https://docs.flutter.dev/app-architecture/case-study
- Navigation: https://docs.flutter.dev/cookbook/navigation/navigation-basics
- State Management: https://docs.flutter.dev/data-and-backend/state-mgmt/simple

### Few House Keeping Notes
- Please avoid using relative imports for any items within the core folder. It's best to use the package-based import structure to ensure clarity and maintainability. For example:
<pre> import 'package:cherry_mvp/core/utils/utils.dart';  </pre>

- Avoid using relative imports, such as:
<pre> import '../../core/utils/result.dart'; </pre>

- Avoid hardcoding strings, images, and colors directly in the widgets. They should be referenced from AppColors, AppImages, and AppStrings.