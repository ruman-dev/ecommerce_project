# 🛒 Flutter E-Commerce App with MVC & BLoC

## Overview
A Flutter e-commerce app featuring:
- ✅ Search & filter (by Title, Price Sorting-> High → Low / Low → High, Rating)  
- ✅ Clean MVC architecture with BLoC state management  
- ✅ Responsive UI  
- ✅ DummyJSON API integration for product data  

## 📱 Screenshots
<div align="center">
  <img src="https://github.com/user-attachments/assets/365718b2-fa9d-4f6a-82c2-101fbf1b7e91" width="250" style="margin: 10px;">
  <img src="https://github.com/user-attachments/assets/957b4092-e045-43fb-9393-c3a63e28558b" width="250" style="margin: 10px;">
  <img src="https://github.com/user-attachments/assets/69110afe-b591-43e7-b62c-7843721769f2" width="250" style="margin: 10px;">
  <br/>
  <img src="https://github.com/user-attachments/assets/84e3c9b2-c740-4673-8dd0-9b28eb051e70" width="250" style="margin: 10px;">
  <img src="https://github.com/user-attachments/assets/b3b32967-f822-4240-97ac-9173b8af7712" width="250" style="margin: 10px;">
  <img src="https://github.com/user-attachments/assets/8d98a694-d6a5-43f2-b8a8-c3b70b9ddda9" width="250" style="margin: 10px;">
</div>

## 🛠 Packages Used

| Package                 | Purpose                |
|-------------------------|------------------------|
| flutter_bloc            | State management       |
| http                    | API requests           |
| equatable               | Value equality         |
| flutter_screenutil      | Responsive UI          |
| google_fonts            | Load text fonts        |
| flutter_svg             | SVG image rendering    |

## 🔌 API Used

**DummyJSON**  
Endpoint:  https://dummyjson.com/products

## 🎯 Key Features
- ✔ **Pagination**: Loads 10 products at a time
- ✔ **Search**: Real-time product search
- ✔ **Sorting**: By price (low→high) (high→low) and rating
- ✔ **BLoC Pattern**: Clean state management
- ✔ **MVC Separation**: Business logic ↔ UI decoupling

## 📝 Notes
- BLoC Events Used:
- LoadProducts (initial load)
- SearchProducts
- SortProducts

## 🚀 How to Run
Clone the repo:

```bash
git clone https://github.com/ruman-dev/ecommerce_project.git
cd ecommerce_project
```
Install dependencies:
```bash
flutter pub get
```
Run the app:
```bash
flutter run
```
