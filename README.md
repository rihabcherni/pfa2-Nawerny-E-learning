# Nawerny E-learning Mobile App (Pfa2)

## Demo  
👉 [Watch the Demo Video](https://drive.google.com/file/d/11vznXPEHPZ8eklsjmKcGLbPguj2wmpET/view?usp=sharing)

**Nawerny E-learning** is an inclusive mobile application specially designed to make digital education **accessible to visually impaired users**.  
The project leverages **Flutter** (mobile frontend), **Django** (backend), and **MongoDB** (database) to deliver a complete, scalable, and accessible learning platform.  

---

## Key Features  
- **Voice Accessibility**: Navigation with screen reader support and voice commands.  
- **Interactive Courses**: Accessible and easy-to-read educational content.  
- **Simplified Interface**: User-friendly design with accessibility-first principles.  
- **Inclusion**: Promotes equal access to education for all.  

---

## Tech Stack  
- **Frontend Mobile**: Flutter  
- **Backend API**: Django REST Framework  
- **Database**: MongoDB  
- **Authentication**: JWT (JSON Web Tokens)  
- **Deployment**: Docker / Heroku / Render (configurable)  

---

## Installation & Setup  

### 1️⃣ Clone the repository  
```bash
git clone https://github.com/username/nawerny-elearning.git
cd nawerny-elearning
````

### 2️⃣ Backend (Django + MongoDB)

```bash
cd backend
pip install -r requirements.txt
python manage.py migrate
python manage.py runserver
```

### 3️⃣ Frontend (Flutter)

```bash
cd frontend
flutter pub get
flutter run
```

---

## Screenshots

### 🔹 App Initialization

<p align="center">
  <img src="screenshots/0-loading.png" width="200" alt="Loading screen"/>
</p>

---

### 🔹 Authentication Flow

<p align="center">
  <img src="screenshots/1-login.png" width="24%" alt="Login screen"/>
  <img src="screenshots/2-error-login.png" width="24%" alt="Error login message"/>
  <img src="screenshots/3-role-access.jpg" width="24%" alt="Role selection"/>
  <img src="screenshots/4-register.png" width="24%" alt="Register form"/>
  <img src="screenshots/5-email-verify.png" width="24%" alt="Email verification"/>
  <img src="screenshots/6-otp.png" width="24%" alt="OTP verification"/>
  <img src="screenshots/7-register-teacher-success.png" width="24%" alt="Successful teacher registration"/>
  <img src="screenshots/8-register-teacher-failed.png" width="24%" alt="Failed teacher registration"/>
  <img src="screenshots/9-forget-password.png" width="24%" alt="Forgot password"/>
  <img src="screenshots/10-logout-success.png" width="24%" alt="Logout success"/>
</p>

---

### 🔹 User Profile & Dashboard

<p align="center">
  <img src="screenshots/11-profil.png" width="200" alt="User profile"/>
  <img src="screenshots/12-welcome-page.png" width="200" alt="Welcome page"/>
</p>

---

### 🔹 Courses & Content

<p align="center">
  <img src="screenshots/13-cours.png" width="200" alt="Courses list"/>
  <img src="screenshots/14-cours-content.png" width="200" alt="Course content"/>
  <img src="screenshots/15-contenu-access.jpg" width="200" alt="Accessible content view"/>
</p>

<p align="center">
  <img src="screenshots/16-account-apprenant.png" width="200" alt="Student account"/>
  <img src="screenshots/17-categories.png" width="200" alt="Course categories"/>
  <img src="screenshots/18-cours-auteur.png" width="200" alt="Author's courses"/>
</p>

---

### 🔹 Admin Panel

<p align="center">
  <img src="screenshots/20-admin-dashboard1.png" width="49%" alt="Admin dashboard view 1"/>
  <img src="screenshots/21-admin-dashboard2.png" width="49%" alt="Admin dashboard view 2"/>
    <img src="screenshots/19-admin-cours.png" width="70%" alt="Admin courses management"/>
  <img src="screenshots/22-admin-gestion.png" width="49%" alt="Admin management panel"/>
  <img src="screenshots/23-admin-gestion2.png" width="49%" alt="Admin management panel 2"/>
</p>