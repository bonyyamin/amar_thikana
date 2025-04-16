# Amar Thikana (আমার ঠিকানা) - Flutter Rental Accommodation App

**Amar Thikana** is a mobile application built with Flutter, designed to help users, especially students, find rental accommodations like homes, hostels, rooms, and even individual seats (common in mess/hostel systems) near university areas and other locations in Bangladesh. The app connects renters with landlords and property managers, providing a platform for easy searching, filtering, and communication.

**(Current Status: Development / Specify Stage)**

![Placeholder for App Screenshot/GIF](link_to_your_screenshot_or_gif.png)

## Features

### Core Features
* **User Authentication:** Email/Password, Google, Phone Number signup/login.
* **User Profiles:** Separate profiles for Renters and Landlords/Managers. Optional profile verification.
* **Listing Management (Landlord):** Create, edit, manage (activate/deactivate/delete) property listings (Home, Hostel, Room, Seat). Includes details like location (map pinning), price, size, amenities, rules, photo/video uploads.
* **Search & Discovery (Renter):** Search by area/university, interactive map view (`Maps_flutter`), listing feed.
* **Filtering & Sorting:** Filter by location proximity, price, type, amenities, gender preference, etc. Sort by relevance, price, distance, date.
* **Detailed Listing View:** Comprehensive details, photo gallery, map location, landlord info.
* **In-App Messaging:** Secure chat between renters and landlords.
* **Favorites:** Save listings for later viewing.

### Enhanced Features
* **Reviews & Ratings:** Allow verified tenants to rate properties and landlords.
* **Push Notifications:** Alerts for new messages, matching listings, inquiries (using FCM).
* **Real-time Availability:** Landlords can indicate specific booked/unavailable dates.
* **Improved Map Features:** Display nearby POIs (universities, markets), calculate distance/commute time.

### Advanced Features (Potential Future Additions)
* **Online Booking/Reservation:** Request viewings or reserve places.
* **Secure Payment Integration:** Integrate local payment gateways (e.g., bKash, SSLCommerz) for deposits/rent (Requires significant backend security).
* **Roommate Finder:** Dedicated section for users seeking roommates.
* **Virtual Tours:** Support for 360 photos or guided video tours.
* **Landlord Dashboard & Analytics:** Insights on listing performance.
* **Admin Panel:** Backend system for app management (potentially separate web app or role-based access).
* **Safety & Reporting:** Report suspicious listings/users, safety tips.

## Architecture Overview

This application follows a clean, layered architecture combined with a feature-first folder structure for maintainability and scalability:

* **Presentation Layer:** Flutter Widgets, Screens, UI Logic (using `flutter_riverpod` for state binding). Navigation handled by `go_router`.
* **Application Layer:** State Management (`StateNotifierProvider`, `FutureProvider`, `StreamProvider` via Riverpod), Use Case orchestration.
* **Domain Layer:** Core business models/entities (using `freezed`), business rules.
* **Data Layer:** Repository Pattern abstracting data sources (Interfaces + Implementations).
* **Infrastructure Layer:** Wrappers for external services (Firebase, Maps SDK, Payment SDKs, Local Storage, etc.).

**State Management:** [Riverpod](https://riverpod.dev/) is used extensively for dependency injection and reactive state management across the application.

## Technology Stack

* **Framework:** Flutter (v3.x.x or specify)
* **Language:** Dart (v3.x.x or specify)
* **State Management:** Riverpod / flutter_riverpod
* **Backend:** Firebase (Authentication, Firestore, Storage, Cloud Functions [for payments/booking logic], Cloud Messaging)
* **Mapping:** Maps_flutter
* **Routing:** go_router
* **Data Classes:** freezed, json_serializable
* **Local Storage:** shared_preferences or hive
* **HTTP Client:** dio or http (if interacting with custom APIs)
* **Image Handling:** cached_network_image, image_picker
* **Potential Payment Gateways:** SDKs/APIs for bKash, SSLCommerz (requires backend integration)
* **Code Generation:** build_runner

## Target Platforms

* Android
* iOS

## Getting Started

### Prerequisites
* Flutter SDK (specify version if necessary, e.g., 3.19.0)
* Dart SDK (comes with Flutter)
* An editor like VS Code or Android Studio
* Firebase Account and Project configured

### Setup
1.  **Clone the repository:**
    ```bash
    git clone [https://github.com/](https://github.com/)[your_username]/[your_repo_name].git
    cd [your_repo_name]
    ```
2.  **Firebase Setup:**
    * You need to set up a Firebase project (follow Firebase documentation).
    * Configure your Flutter app for both Android and iOS within the Firebase project.
    * Download the configuration files:
        * Android: `google-services.json` place it in `android/app/`.
        * iOS: `GoogleService-Info.plist` place it in `ios/Runner/`.
    * **Important:** The application expects Firebase to be initialized. Ensure `firebase_options.dart` is correctly configured (usually done via FlutterFire CLI: `flutterfire configure`).
3.  **API Keys:**
    * **Google Maps:** You will need API keys for `Maps_flutter` for both Android and iOS. Follow the plugin's documentation to configure them (often in `AndroidManifest.xml` and `AppDelegate.swift`).
    * **Payment Gateways:** If implementing payments, API keys/credentials for bKash/SSLCommerz will be required, likely managed via environment variables or secure backend configuration.
    * **(Recommended):** Use a `.env` file strategy (e.g., using `flutter_dotenv` package) to manage sensitive keys. **Do not commit API keys directly to Git.** Create a `.env.example` file listing required variables.
4.  **Install dependencies:**
    ```bash
    flutter pub get
    ```
5.  **Generate Code:** (Required for `freezed`, `go_router`, etc.)
    ```bash
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
    Run this command whenever you change models or routes that use code generation.

### Running the App
```bash
flutter run
