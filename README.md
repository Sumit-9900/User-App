# Users App

## 📌 Project Description

Users App is a Flutter application that fetches a list of users from a public API. Users can search for specific users using the search bar, and tapping on a user tile navigates to a detailed screen displaying user information. The app supports both light and dark modes and includes a pull-to-refresh feature to reload the user list.

---

## 🚀 Features

- Fetch users from a public API.
- Display user details on a separate screen.
- Search functionality to filter users by name.
- Dark mode and light mode support.
- Pull-to-refresh feature to reload the user list.

---

## 📲 Screenshots

| Home Screen (Light) | Home Screen (Dark) | User Details (Light) | User Details (Dark) |
|---------------------|--------------------|----------------------|---------------------|
| ![Home Light](screenshots/home_light.png) | ![Home Dark](screenshots/home_dark.png) | ![Details Light](screenshots/details_light.png) | ![Details Dark](screenshots/details_dark.png) |

---

## 🛠️ How to Run the App

### Prerequisites:
- Ensure you have [Flutter](https://flutter.dev/docs/get-started/install) installed.
- An emulator or physical device set up.

### Steps:
1. **Clone the repository:**
   ```sh
   git clone https://github.com/yourusername/users_app.git

2. **Navigate to the project folder:**
    ```sh
    cd users_app

3. **Get dependencies:**
    ```sh
    flutter pub get

## 📌 Assumptions & Decisions

- The app follows the **MVVM (Model-View-ViewModel) Architecture** to maintain a clean and scalable code structure.  
- **fpdart** is used to implement functional programming concepts such as `Either` for handling failures effectively.  
- **get_it** is used for **dependency injection**, making it easier to manage and inject dependencies across the app.  
- **Bloc (Business Logic Component)** is used for **state management**, ensuring a predictable and testable state flow.  
- The app supports **both dark and light themes**, providing a better user experience based on system preferences. 

## 🎯 Conclusion

Users App is a simple yet functional Flutter application that demonstrates fetching data from an API, implementing search functionality, and supporting dark mode.
