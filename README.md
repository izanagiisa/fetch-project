# fetch-project
## _Fetch - iOS Coding Challenge_

![Swift](https://img.shields.io/badge/swift-F54A2A?style=for-the-badge&logo=swift&logoColor=white) ![Xcode](https://img.shields.io/badge/Xcode-007ACC?style=for-the-badge&logo=Xcode&logoColor=white) ![iOS](https://img.shields.io/badge/iOS-000000?style=for-the-badge&logo=ios&logoColor=white) ![Git](https://img.shields.io/badge/git-%23F05033.svg?style=for-the-badge&logo=git&logoColor=white)

- App: FetchEX
- version: 1.0
- xCode: Version 15.3 (15E204a)

Native iOS app that allows users to browse recipes using the following API:
https://themealdb.com/api.php
There are 2 endpoints that this app is utilize:
- https://themealdb.com/api/json/v1/1/filter.php?c=Dessert for fetching the fetching the meal details by its ID.
- https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID for fetching the meal details by its ID.

## Features

- The user should be shown the list of meals in the Dessert category, sorted 
alphabetically.
- When the user selects a meal, they should be taken to a detail view that 
includes: Meal name, Instructions, Ingredients, measurements

## Coding Challenge Guidelines
- Be sure to filter out any null or empty values from the API before displaying
them.
- UI/UX design is not what you’re being evaluated on, but the app should be
user friendly and should take basic app design principles into account.
- Project should compile using the latest version of Xcode.
