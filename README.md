


# Swift ToDo App with Firebase Integration

## Table of Contents
1. [Description](#description)
2. [Technologies Used](#technologies-used)
3. [Installation Guide](#installation-guide)
4. [Features](#features)
5. [Screenshots](#screenshots)

## Description
This ToDo application is developed using Swift and Xcode, with Firebase serving as the backend for storing and managing ToDo items. It allows users to create, read, update, and delete (CRUD) tasks with seamless synchronization across devices. The user-friendly interface and efficient storage solution ensure a smooth and reliable experience.

## Technologies Used
- **Swift**: Programming language used for developing the app.
- **Xcode**: Integrated development environment (IDE) used for app development.
- **Firebase**: Backend platform used for storing ToDo items.

## Features
- **Add ToDo Items**: Users can add new tasks with a title and description.
- **Edit ToDo Items**: Users can update existing tasks.
- **Delete ToDo Items**: Users can remove tasks they no longer need.
- **View ToDo Items**: Users can see all their tasks in a list.
- **Sync with Firebase**: All tasks are stored in Firebase for real-time synchronization across devices.
- **User Authentication**: Optional feature for users to sign in and manage their own tasks.

## Installation Guide

## Step 1: Clone the Repository
1. Open **Xcode**.
2. Go to **Source Control** > **Clone**.
3. Enter the repository URL provided to you (e.g., `https://git@github.com:tsiory17/Todo.gitt`).
4. Choose a directory to save the project locally and click **Clone**.
5. Once the cloning process is complete, open the project in Xcode.

---

## Step 2: Set Up Firebase

### 1. Create a Firebase Project

a. Go to the [Firebase Console](https://console.firebase.google.com/) and click **Add Project**.  
b. Enter the project name and click **Continue**.  
c. Disable Google Analytics (for simplicity) and click **Create Project**.  
d. Once the project is created, click **Continue** to open the project dashboard.  

### 2. Add iOS App to Firebase

a. In the Firebase project dashboard, click the **iOS icon** to add an iOS app.  
b. Enter the following details:  
   - **iOS bundle ID**: This must match the bundle identifier of your Xcode project (e.g., `com.yourname.FirebaseTodoApp`).  
   - **App nickname**: `FirebaseTodoApp` (optional).  
c. Click **Register App**.  
d. Download the `GoogleService-Info.plist` file.  
e. Drag and drop the `GoogleService-Info.plist` file into your Xcode project, ensuring it is added to all targets.  

---

## Step 3: Add Firebase to the Xcode Project Using Swift Package Manager

1. In Xcode, go to **File** > **Add Packages**.  
2. Enter the following URL in the search bar: `https://github.com/firebase/firebaseios-sdk`.  
3. Choose the latest version and click **Add Package**.  
4. In the list of Firebase modules, select the following:  
   - `FirebaseFirestore`  
   - `FirebaseAuth`  
5. Click **Add Package** to integrate Firebase into your project.  

---

## Step 4: Verify Firebase Installation

1. Build and run the project in Xcode.  
2. Ensure there are no errors related to Firebase.  
3. Test Firebase functionality by initializing Firebase in your app's entry point (e.g., `AppDelegate.swift` or `SceneDelegate.swift`):  

```swift
import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
```

## Screenshots

### Homepage & Firebase Connection
![Homepage](./ScreenshotsTodo/Main%20Screen.png) 
### Add Todo 
![Add](./ScreenshotsTodo/2-Add%20save%20button%20disable%20.png) 

![Add1](./ScreenshotsTodo/3-Add%20save%20button%20enable%20.png) 

![Add2](./ScreenshotsTodo/4-Add%20is%20not%20completed.png) 
### Update status
![Update](./ScreenshotsTodo/5-Update%20status.png) 

### Delete Todo 
![Delete](./ScreenshotsTodo/6-Delete%201.png) 
![Delete1](./ScreenshotsTodo/7-Delete%202.png) 



