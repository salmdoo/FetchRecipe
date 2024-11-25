# README

<!--@START_MENU_TOKEN@-->Summary<!--@END_MENU_TOKEN@-->

## Overview

The application provides users with a seamless experience, empowering them to effortlessly explore a diverse array of recipes.

### Snapshots


### Steps to Run the App
1. Clone the Repository
- Clone the project repository to your local using the following command:
```git clone https://github.com/salmdoo/FetchRecipe.git```
2. Open the Project in Xcode
- Navigate to the project directory
- Double-click on the *FetchRecipe.xcodeproj* file
3.Select the Target:
In the center top banner of Xcode, you should see ```"FetchRecipe >"```,  select the target device or simulator where you want to run the app.
4. Run the App
- Click the Run button in Xcode or press ```Cmd + R```.
- The app will launch in the selected simulator or on the connected device.
5. Test the App
- In the left menu, select *"Show the Test nagivator".*
- Click on the test target to run test cases.

### Project Priorities and Focus Areas

#### 1. **Scalable and Maintainable Codebase**
- **Vertical Slice Architecture**:  
  - Adopted this architecture to modularize the application into independent, feature-based components. This approach simplifies feature updates and enables easier testing and maintenance.
- **MVVM Design Pattern**:  
  - Implemented MVVM (Model-View-ViewModel) to separate concerns, ensuring code clarity and maintainability. This design facilitates easier testing and scaling as the project grows.
- **Protocol-Oriented Programming (POP)**:  
  - Leveraged POP to create flexible, reusable components by focusing on protocols over inheritance. This reduces coupling, promotes clean abstractions, and supports better scalability across features.

#### 2. **Swift Concurrency and Combine Framework**
- Integrated Combine for reactive programming, simplifying state management and data flow, particularly for UI updates tied to asynchronous operations.

#### 3. **High-Performance Application**
- **Optimized Image Handling with Kingfisher**:  
  - Used Kingfisher for efficient image loading and caching. It minimizes redundant network calls by loading images from the cache when available, improving speed and reducing bandwidth usage.
- **Efficient UI Rendering with LazyVGrid**:  
  - Displayed lists of recipes using LazyVGrid, which dynamically loads only visible items, reducing memory and computation overhead.
- **On-Demand Element Loading**:  
  - Optimized views to load UI elements only when data is available, preventing unnecessary rendering and enhancing overall application performance.

### Time Spent:
"I worked on this project for approximately **7 hours in 7 days**, dedicating an average of **1 hours per day**."

**Time Allocation**:  
- **Planning & Architecture** (20%): Designed the structure using Vertical Slice Architecture and MVVM.  
- **Development** (60%): Built features, integrated Swift Concurrency, Combine, and optimized performance with Kingfisher and LazyVGrid.  
- **Testing & Refinement** (15%): Debugged, optimized caching, and improved scalability.  
- **Documentation** (5%): Prepared technical documentation and incorporated feedback.


### Trade-offs and Decisions:
Yes, I made a few significant trade-offs to balance development speed, performance, and maintainability
1. **Simplified Scope**: Focused on core features with Vertical Slice Architecture, delaying some advanced functionality for later.  
2. **Concurrency with Combine**: Chose Combine for native integration and reduced dependencies, though it required refactoring and a steeper learning curve.  
3. **UI Optimization**: Used LazyVGrid for performance, sacrificing some customization options.  
 

### Weakest Part of the Project:
1. **Advanced Customization:** Using LazyVGrid for performance limited some UI customization options, which could be enhanced for a more tailored user experience.
2. **Multi-language support:** Adding localization will be a priority in future updates.

### External Code and Dependencies:
**Kingfisher**
Kingfisher is used for efficient image downloading, caching, and asynchronous loading. It helps optimize performance by ensuring that images are loaded from the cache whenever possible, reducing network calls and enhancing the user experience

### Additional Information: Is there anything else we should know? Feel free to share any insights or constraints you encountered.

- **Responsive UI**: The app adjusts the layout based on device orientation, displaying 1 column in portrait and 2 columns in landscape.

- **User-Friendly Interface**: Designed for ease of use with an intuitive layout.

- **Error Handling**: Displays specific error messages for service issues, malformed, or empty data.

- **Testing**:  
  Unit and UI tests are written to ensure functionality and UI reliability.
