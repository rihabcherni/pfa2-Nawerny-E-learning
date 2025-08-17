# Nawerny E-learning Mobile App (Pfa2)

**Nawerny E-learning** is an inclusive mobile application specially designed to make digital education **accessible to visually impaired users**.  
The project leverages **Flutter** (mobile frontend), **Django** (backend), and **MongoDB** (database) to deliver a complete, scalable, and accessible learning platform.  

---

## ✨ Key Features  
- 🎧 **Voice Accessibility**: Navigation with screen reader support and voice commands.  
- 📚 **Interactive Courses**: Accessible and easy-to-read educational content.  
- 🛠 **Simplified Interface**: User-friendly design with accessibility-first principles.  
- 🌍 **Inclusion**: Promotes equal access to education for all.  

---

## 🛠️ Tech Stack  
- **Frontend Mobile**: Flutter  
- **Backend API**: Django REST Framework  
- **Database**: MongoDB  
- **Authentication**: JWT (JSON Web Tokens)  
- **Deployment**: Docker / Heroku / Render (configurable)  

---

## 🚀 Installation & Setup  

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

## 📸 Screenshots

| Home Screen                                   | Course Screen                                   | Voice Navigation                               | Settings                                          |
| --------------------------------------------- | ----------------------------------------------- | ---------------------------------------------- | ------------------------------------------------- || 
<img src="screenshots/home.png" width="200"/> | 
<img src="screenshots/course.png" width="200"/> | 
<img src="screenshots/voice.png" width="200"/> | 
<img src="screenshots/settings.png" width="200"/> |

---

## 🎯 Project Goal

To empower visually impaired learners by providing them with an **accessible and inclusive e-learning platform**, enabling independent access to online courses and digital education resources.

---

## 🤝 Contribution

Contributions are welcome!

1. Fork the project
2. Create a new branch (`git checkout -b feature/my-feature`)
3. Commit your changes (`git commit -m 'Add my feature'`)
4. Push the branch (`git push origin feature/my-feature`)
5. Open a Pull Request