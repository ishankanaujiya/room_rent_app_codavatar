# 🏠 RoomKhoj

[![Flutter](https://img.shields.io/badge/Flutter-3.27.4-blue?logo=flutter&logoColor=white)](https://flutter.dev/)  [![Platform](https://img.shields.io/badge/Platform-Android-green)](https://play.google.com/store)  [![License](https://img.shields.io/badge/License-MIT-orange)](LICENSE)  ![Version](https://img.shields.io/badge/Version-1.0.0-blue)

---

## 🌟 About RoomKhoj

**RoomKhoj** is a modern and intuitive Flutter app designed to help users **post, manage, and view room listings** efficiently. The app allows users to maintain their own listings with multiple images, manage personal details, and interact with other users’ listings.  

> *“Your next home is waiting - explore it with Room Khoj.”*

---

## 🎯 Key Features

### **1. User Authentication 🔒**
- Secure **login and signup** system using Firebase Authentication.  
- Ensures that each user’s room listings and profile data are private and secure.  

### **2. Room Posting & Management 🏢**
- Users can **publish room listings** with detailed descriptions, multiple images, pricing, and amenities.  
- Only the user who posted a room can **view and manage their own listings**.  
- Supports **CRUD operations**: create, read, update, and delete rooms.  
- Each room includes **contact information** so other users can directly reach out for inquiries.  

### **3. Personal Profile Management 👤✏️**
- Users can **update their profile information**, including:  
  - Name  
  - Phone number  
  - Profile picture  
- Ensures user information is always up-to-date and personalized.  

### **4. Room Browsing 🔍**
- Users can view **all rooms posted by themselves** for easy management.  
- Detailed room view displays all images and relevant information.  

---


## ⚙️ Tech Stack

- **Frontend:** Flutter (Dart)  
- **Backend (API):** Node.js, Express.js  
- **API Deployment:** Vercel  
- **Authentication & Database:** Firebase 
- **API Testing:** Postman   
- **Image Storage:** Cloudinary  


---



## 📁 Project Structure

```
ROOM_RENT_APP_CODAVATAR/
│
├── android/                                            # Android native configuration
├── ios/                                                # iOS native configuration
├── linux/
├── macos/
├── web/
├── windows/
│
├── assets/                                             # Static assets (images, icons, etc.)
│
├── lib/
│   ├── provider/                                       # State management (Provider)
│   │   ├── circularLoadingProvider.dart
│   │   ├── multiplePictureDisplayProvider.dart
│   │   ├── roomDetailProvider.dart
│   │   └── sharedPreferenceForUserDetailProvider.dart
│   │
│   ├── screen/                                         # UI Screens
│   │   └── (All app screens)
│   │
│   ├── service/                                        # API & External Services
│   │   ├── deletePictureFromCloudinary.dart
│   │   ├── firebaseAuth.dart
│   │   ├── firebaseService.dart
│   │   └── pictureToCloudinary.dart
│   │
│   ├── util/                                           # Utility classes & helpers
│   │   ├── customColor.dart
│   │   ├── forKeyForTextField.dart
│   │   └── keyForSharedPreference.dart
│   │
│   ├── widget/                                         # Reusable UI components
│   │   ├── buttonWidget.dart
│   │   ├── circularLoading.dart
│   │   └── settingContainer.dart
│   │
│   └── main.dart                                       # App entry point
│
├── pubspec.yaml                                        # Dependencies & app version
├── pubspec.lock
├── analysis_options.yaml
├── devtools_options.yaml
└── .gitignore
```

---

## 🏗️ Architecture Overview

The project follows a **clean and modular structure**:

- **Provider Layer** → Manages application state.
- **Service Layer** → Handles Firebase, Cloudinary, and API operations.
- **Screen Layer** → Contains UI screens.
- **Widget Layer** → Reusable UI components.
- **Util Layer** → Constants, keys, and helper utilities.

**⚠️ This separation ensures scalability, maintainability, and clean code architecture.**

---


## 🛠️ Installation & Setup

**To run this project locally:**

**1. Clone the repository**
```bash
git clone https://github.com/ishankanaujiya/room_rent_app_codavatar
```

**2. Navigate to the project directory**
```bash
cd room_rent_app_codavatar
```

**3. Install dependencies**
```bash
flutter pub get
```
**4. Run the application**
```bash
flutter run
```

---

## 📱 Visual Overview
 ![RoomKhoj](assets/roomKhojPurple.png)
---

## 🤝 Contributing

We welcome contributions to improve **RoomKhoj**.  

**⚠️To maintain code quality and consistency, Please follow the guidelines below**.

---

### 📌 Contribution Guidelines

- Follow the existing project structure and coding standards.
- Write clean, readable, and well-documented code.
- Test your changes thoroughly before submitting.
- Keep pull requests focused on a single feature or bug fix.
- Use clear and meaningful commit messages.
- Do not commit sensitive information (API keys, Secrets, Credentials)⚠️.
- Ensure your changes do not break existing functionality⚠️.
---

### 🚀 Steps to Contribute

**1. Fork the repository**

```bash
 Click the `Fork` button at the top-right corner of the repository page.

```

**2. Clone your fork**

```bash
git clone https://github.com/ishankanaujiya/room_rent_app_codavatar
```
**3. Navigate to the project directory**
```bash
cd room_rent_app_codavatar
```

**4. Create a new branch**

```bash
git checkout -b feature/your-feature-name
```

**5. Track Changes**

```bash
git add .
```

**6. Make your changes and commit**

```bash
git commit -m "Add: short description of your feature"
```

**7. Push your branch**

```bash
git push -u origin feature/your-feature-name
```

**8. Open a Pull Request**

```bash
- Go to the original repository.
- Click on New Pull Request.
- Provide a clear description of your changes.
- Submit for review.

```

---

## 🐛 Reporting Issues

**If you encounter any bugs or unexpected behavior, please report them by following these steps:**

1. Navigate to the **Issues** tab of the repository.
2. Click on **New Issue**.
3. Provide a detailed title and description.
4. Include the following details:
   - Steps to reproduce the issue
   - Expected behavior
   - Actual behavior
   - Screenshots (if applicable)
   - Device details (Android version, device model, etc.)

Providing detailed information helps me resolve issues faster.

---

## 📢 Feature Requests

We appreciate ideas that improve **RoomKhoj**.

When submitting a feature request:

- Clearly describe the proposed feature.
- Explain why it would be beneficial.
- Provide examples, use cases, or mockups if possible.

---

## 📞 Contact

**For any inquiries, feedback, or support:**

- **Developer:** Ishan Kanaujiya  
- **Email:** ishankanaujiya96mail.com  

---


## 🙏 Thank You for Visiting

Thank you for taking the time to explore **RoomKhoj**.

We truly appreciate your interest in this project.  
If you found it helpful or inspiring:

- ⭐ Consider giving the repository a star  
- 🍴 Fork the project to contribute  
- 📢 Share it with others  

Your support motivates me to continuously improve and build better solutions.

---

### 🚀 Happy Coding!

Made with ❤️ using Flutter.

