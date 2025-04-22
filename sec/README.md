# sec

A new Flutter project.


This project demonstrates how to implement a **multi-image picker** feature in a Flutter application using `image_picker` and display the selected images in a scrollable view.

## 🚀 Features

- Open gallery using an icon button.
- Select multiple images from the gallery.
- Display selected images horizontally.
- Remove selected images.
- Re-select additional images.
- Navigate and pass selected images to another screen.

---

## 🛠️ Getting Started

### 1. Add Icon to Open Gallery

In your UI, add an `IconButton` inside a `Container` which will trigger image selection:

```dart
IconButton(
  icon: Icon(Icons.camera),
  onPressed: () => pickMultiImages(),
)

dependencies:
  image_picker: ^1.0.0




📸 Preview

Here’s a preview of the final result:

    Select multiple images from the gallery.

    View them in a scrollable list.

    Remove any image.

    Add more images anytime.

    Send images to the next screen.


    🧠 Notes

    Always test for null values and handle errors gracefully.

    The current setup stores images as File, which works well for local display.

    Don't forget to request storage/gallery access permissions depending on your target platform (Android/iOS).