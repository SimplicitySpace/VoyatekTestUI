# VoyatekTestUI

## Overview
VoyatekTestUI is a SwiftUI-based mobile application that allows users to browse and add food items. It features an intuitive UI, API integration, and support for tagging food items.

## Features
- Browse food items with images, descriptions, and calorie counts.
- Add new food items with name, description, category, calories, tags, and images.
- Asynchronous image loading using `AsyncImage`.
- Favorite food items with a heart icon.

## Requirements
- macOS with Xcode installed
- iOS Simulator or a physical iOS device
- Swift 5+
- Apple Developer Account (for distribution)

## Setup Instructions

### Clone the Repository
```sh
https://github.com/SimplicitySpace/VoyatekTestUI.git
cd VoyatekTestUI
```

### Install Dependencies
The project uses Swift Package Manager (SPM). Open the project in Xcode, and dependencies will automatically resolve.

### Configure API
Update `APIService.swift` with your backend API URL and authentication tokens if required.

### Run the Project
1. Open `VoyatekTestUI.xcodeproj` in Xcode.
2. Select the appropriate simulator or connect a physical device.
3. Click **Run (⌘R)** to build and launch the app.

## API Endpoints
### Add a Food Item
**Endpoint:** `POST /food-items`

**Request Body:**
```json
{
  "name": "Grilled Chicken",
  "description": "Delicious grilled chicken with spices.",
  "category_id": 1,
  "calories": 250,
  "tags": ["Protein", "Healthy"],
  "images": ["https://example.com/chicken.jpg"]
}
```

**Response:**
```json
{
  "success": true,
  "message": "Food item added successfully!"
}
```

### Fetch Food Items
**Endpoint:** `GET /food-items`

**Response:**
```json
[
  {
    "id": 1,
    "name": "Grilled Chicken",
    "description": "Delicious grilled chicken with spices.",
    "calories": 250,
    "tags": ["Protein", "Healthy"],
    "foodImages": [
      {
        "imageUrl": "https://example.com/chicken.jpg"
      }
    ]
  }
]
```

## Additional Notes
- Ensure your API server is running before testing API calls.
- Modify `APIService.swift` to match your API's authentication requirements.
- If facing UI issues, check `FoodCardView.swift` for layout adjustments.

## Contributing
1. Fork the repository.
2. Create a new branch (`feature-xyz`).
3. Commit your changes.
4. Open a pull request.

## License
This project is licensed under the MIT License.

