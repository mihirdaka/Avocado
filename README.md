# Avocado


# **Avocado – Recipe App**  

## **Summary**  
Avocado is a SwiftUI-based recipe app that fetches and displays a list of recipes from a remote API. Users can view recipe details, including the name, cuisine type, and an image. The app supports refreshing the list and allows users to open the recipe source and video tutorial links when available.  

### **Screenshots / Video Demo**  
![Screenshot 1] <img src="https://github.com/user-attachments/assets/23cd921f-70e9-4e47-a08c-a587fbc92afb" width="480">


![IMG_5673](https://github.com/user-attachments/assets/a24235fc-d408-4085-905c-480ebd9e0edc)


https://github.com/user-attachments/assets/6372d16f-6e71-4b49-a0f8-0c73aec79c4f

---

## **Focus Areas**  
### **1. User Experience & Performance**  
- Ensured a clean and simple UI with a minimalistic design for a smooth user experience.  
- Implemented a caching system for images to reduce network requests and improve performance.  

### **2. Network Handling & Data Fetching**  
- Used `async/await` for efficient and structured concurrency in fetching recipe data.  
- Implemented error handling to manage failed requests and display appropriate messages.  

### **3. Code Maintainability & Scalability**  
- Followed a structured MVVM architecture to separate UI logic from data handling.  
- Used `@StateObject` to manage state changes efficiently within the app.  

---

## **Time Spent**  
### **Total Time: ~6-8 Hours**  
- **UI Development:** 2-3 hours (Building layouts, styling, and navigation)  
- **Networking & Data Handling:** 2 hours (Fetching, decoding JSON, and error handling)  
- **Image Caching Implementation:** 1.5 hours  
- **Testing & Debugging:** 1.5 hours  

---

## **Trade-offs and Decisions**  
- **Used an in-memory cache for images** instead of storing them persistently to keep things lightweight.  
- **Kept UI minimalistic** instead of adding extra animations to maintain simplicity.  

---

## **Weakest Part of the Project**  
- **Error Handling:** While basic error messages are displayed, a more detailed error-handling mechanism (e.g., retry logic, network status detection) could improve resilience.  
- **UI Enhancements:** Could improve the layout further by adding more detailed recipe information, better typography, or different list styles.  

---

## **Additional Information**  
- **Future Improvements:**  
  - Implement search & filtering options for a better user experience.  
  - Add offline support using CoreData to store fetched recipes locally.  
  - Enhance UI with smooth animations for better visual appeal.  
- **Challenges:**   
  - Deciding between a pull-to-refresh mechanism and an automatic update strategy for fetching new recipes.  

---
