# 🎓 Virtual Internship & Certificate Generator App

A Flutter-based mobile application for managing virtual internships and issuing digital certificates using Firebase. The app supports secure authentication, role-based access (Admin/User), certificate upload, storage, and download.

---

## 🚀 Features

### 🔐 Authentication
- User registration and login using Firebase Authentication
- Secure logout functionality

### 👥 Role-Based Access
- Admin and User roles
- Role data stored and managed using Cloud Firestore
- Automatic routing based on user role after login

### 📜 Certificate Management
- Admin can upload internship certificates (PDF format)
- Certificates are stored securely in Firebase Storage
- Certificate metadata is saved in Firestore
- Users can view and download their issued certificates

### 🏗 Clean Architecture
- Separation of UI, services, and business logic
- Scalable and maintainable project structure

---

## 🛠 Tech Stack

| Category | Technology |
|--------|------------|
Frontend | Flutter (Dart)
Authentication | Firebase Authentication
Database | Cloud Firestore
Storage | Firebase Storage
Platform | Android

---

## 📁 Project Structure
```bash
lib/
├── screens/
│ ├── login_screen.dart
│ ├── register_screen.dart
│ ├── home_screen.dart
│ ├── admin_dashboard.dart
│ ├── role_router.dart
│ ├── upload_certificate_screen.dart
│ └── user_certificate_screen.dart
│
├── services/
│ ├── auth_service.dart
│ ├── firestore_service.dart
│ ├── storage_service.dart
│ └── certificate_service.dart
│
└── main.dart
```
---

## 🔄 Application Flow

App Launch
↓
Login / Register
↓
Role Router
↓
Admin Dashboard → Upload Certificate
OR
User Dashboard → Download Certificate

yaml
Copy code

---

## ⚙️ Setup & Installation

### Prerequisites
- Flutter SDK installed
- Android Studio or VS Code
- Firebase project configured
- Android device or emulator

### Steps to Run

```bash
flutter pub get
flutter run
```

Make sure:

Firebase configuration files are added correctly

Internet permission is enabled in AndroidManifest.xml

📌 Future Enhancements
QR code generation & verification for certificates
Certificate expiry and revocation
UI/UX improvements
Multi-certificate support per user

📄 Conclusion
The Virtual Internship & Certificate Generator App demonstrates a real-world implementation of Flutter with Firebase, featuring authentication, role-based access control, and cloud-based certificate management. The project is suitable for academic submission, internships, and further production-level enhancements.
