## Lab 4

### App Description
This lab deals with styling and animation within the app. There's an animation when the user goes to the next or prevevious flashcard. There is also an animation when the card and multiple choice options appear upon opening the app. There is also a splashscreen and logo for the app. In addtion, multiple size screen support has been implemented for all of the screens in the app, in that the items, buttons, and logos on the app scale dynamically to the size of the user's device.

Besides the animations, multiple choice options have been added to the flashcard. Like the flashcard, these are also animated. The multiple choice answers are randomized, and can be modified in the card creation/modification screen.

### App Walk-though
Here is a walkthrough of the app on three devices; the iPhone 8 Plus, the iPhone 11, and the iPad Pro.

### iPhone 8 Plus
<img src="/Demos/Lab4/iPhone8.gif" width=200><br>

### iPhone 11
<img src="/Demos/Lab4/iPhone11.gif" width=200><br>

### iPad Pro 12.9 Inch
<img src="/Demos/Lab4/iPadPro.gif" width=200><br>

## Required
- [x] User should see the app icon 
- [x] User should see a splash screen
- [x] User should see an flip animation when revealing the answer
- [x] User should see a slide animation when going to the next flashcard
- [x] User should see a slide animation when going to the previous flashcard
- [x] Push code to GitHub
## Optional
- [x] User should see a nicer flaschard with rounded corners, shadows, and animating when showing the first time
- [x] User should see all views properly layout when using the app on a phone of different sizes
- [x] Correct answer in multiple choice should be random

## Lab 3

### App Description
Building off the last lab, the user can tap the "Add New Card" button to add a new card. Now, the app is able to create a new card without overwriting the data of the old card and add it to card deck. This is done by making each individual card a struct (a data structure with properties) and storing them in an array. When making a new card, the card and its data are appended onto the array. The user can browse through multiple cards by clicking the "Prev" button to go to the previous card and the "Next" button to go to the next card. Also, the user can edit an existing card by tapping the pencil icon on the lower righthand corner of the card. The user can also delete a card by tapping the "x" button on the upper lefthand corner of the card. This will bring up a dialog box which the user can either cancel to prevent the card being deleted, or accept to delete the card. The cards the user made are saved on their device.

### App Walk-though
<img src="/Demos/Lab3.gif" width=200><br>

## Required
- [x] User can browse through multiple flashcards
- [x] User can re-open the app and see previously created flashcards
- [x] Push code to GitHub
## Optional
- [x] User can delete a flashcard
- [x] User can edit existing flashcard (Implemented March 22, 2022)
- [x] User can store multiple choice questions (Implemented April 1, 2022)

## Lab 2

### App Description
The user can tap the "Add New Card" button to add a new flashcard. From there, they are brought to the screen where they can enter a question and answer for that card. They can either click the "Cancel" button to exit the screen or the "Done" button to make their new card with the data they entered. If they don't enter a question and/or an answer, an error appears, indicating the user must fill out both fields.

Note: The data of the old card is overwritten in the process of "creating" a new card. The process of saving data from multiple cards will be dealt with in Lab 3.

### App Walk-though
<img src="/Demos/Lab2.gif" width=200><br>


## Required
- [x] User can open the creation screen
- [x] User can cancel out of the creation screen
- [x] User can enter a new question and answer in the creation screen to then show it on the flashcard
- [x] Push code to GitHub
## Optional
- [x] User gets an error if they try to create a new flashcard with no question or answer
- [x] User can edit existing flashcard (Implemented March 22, 2022)
- [x] User can add multiple choice answers in the creation screen (Implemented April 1, 2022)

## Lab 1

### App Description
This app is a flashcard app. Initally, the user sees a question in a blue box that they must answer. Form there, the user can tap the question to see the answer. They can tap it again to hide the answer and see the question again.

### App Walk-though
<img src="/Demos/Lab1.gif" width=200><br>

## Required
- [x] Create New Project in Xcode
- [x] Add a view for the front side of the flashcard to display the question
- [x] Add a view for the back side of the flashcard to display the answer
- [x] Build in logic to show the answer side when the card is tapped
- [x] Push code to GitHub
## Optional
- [x] Toggle the flashcard between the question side and the answer side
- [x] Style the question and answer side of the card to better distinguish between the two sides (Implemented April 6, 2022)
- [x] Add selectable multiple choice answers beneath the card (Implemented April 1, 2022)
