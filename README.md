Fixes:Like button (liked & unliked) #94

📌 **Description of the Work Done:**

- **Purpose**: A custom like button widget that allows users to toggle the like state and visually update the like count.
  
-** Stateful Widget**: 
  - Uses `StatefulWidget` to manage dynamic changes in UI, specifically the like state and count.
  
- **Constructor Parameters**:
  - `initialIsLiked` (bool): Initial state of whether the button is liked or not.
  - `initialLikeCount` (int): Initial like count displayed on the button.
  - `onToggle` (Future<void> Function(bool)): Callback function triggered when the like state changes (returns a `Future` to handle async actions like updating a database).

- **State Management**:
  - The button's state (`isLiked` and `likeCount`) is stored in the `State` class (`_SmashedLikeButtonState`).
  - `initState` initializes the state based on the passed-in values (`initialIsLiked` and `initialLikeCount`).

- **Behavior**:
  - When the button is tapped, the `handleTap` function is called.
  - The `handleTap` function toggles the `isLiked` state and updates the `likeCount` accordingly.
  - The button visually updates, showing the new like count and changing the icon color.
  
- **Error Handling**:
  - If the `onToggle` callback fails (e.g., database update fails), the UI is rolled back to the previous state to ensure consistency.




**Screenshot (if UI was created or updated):**


<img width="311" alt="Screenshot 2025-05-05 at 13 54 13" src="https://github.com/user-attachments/assets/bc2f6452-b1e9-46d8-abbd-2cc99912cb6f" />
