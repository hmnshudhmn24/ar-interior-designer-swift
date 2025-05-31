# 🛋️ Augmented Reality Interior Designer

Place realistic 3D furniture in your room using your iPhone camera. This ARKit-powered app helps you visualize interior setups and save room layouts for future redesigns.

## 🧾 Project Description

This app uses ARKit, RealityKit, and SceneKit to place scaled 3D furniture models into a user's real environment. It detects planes, matches lighting, and supports saving design layouts to Firebase for persistence and future retrieval.

## 🛠️ Tech Stack

- Swift
- SwiftUI
- ARKit & RealityKit
- SceneKit
- Firebase Firestore

## 🚀 Features

- Place furniture in your real environment using your iPhone's camera
- Detect horizontal surfaces and adapt to real-world lighting
- Save custom layouts to Firebase
- Easy-to-use interface for quick home design

## 🧑‍💻 How to Run

1. **Requirements:**
   - Xcode 14 or higher
   - iOS 15+
   - Real device (ARKit does not run on Simulator)
   - Firebase project with Firestore enabled

2. **Steps:**
   - Clone this repo:
     ```bash
     git clone https://github.com/yourusername/ar-interior-designer-swift.git
     ```
   - Open in Xcode and run `pod install` if using CocoaPods.
   - Add your `GoogleService-Info.plist` to the Xcode project.
   - Build and run on a real device.

## 📂 Folder Structure

- `ARViewModel.swift`: ARKit + Firebase logic
- `ContentView.swift`: Main UI and controls
- `Models/`: 3D furniture models (.usdz)

## ✅ Sample Output

- Place a chair, table, or lamp in your room
- Save the layout with one tap
