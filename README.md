# 🏟️ Sports Hub App

## Description
Sports Hub is an application designed to provide users with access to information about various sports, leagues, and teams. The app offers a user-friendly interface with intuitive navigation to help users explore their favorite sports content.

## Features

### Main Screen
The main screen of the app consists of two tabs: "Sports" and "Favorite Leagues".

#### Sports Tab 🏀
- Displays all available sports in a CollectionView.
- Each row contains two sports with their respective images and names.
- Users can select a sport to view its associated leagues.

#### Favorite Leagues Tab ⭐
- Utilizes CoreData to store and display user-selected favorite leagues.
- UI layout is similar to the Leagues ViewController.
- Online users can access league details directly by tapping on a row.
- Offline users are prompted with an alert indicating no internet connection.

### Leagues ViewController 🏆
- Presents a list of leagues related to the selected sport.
- Each row displays the league badge, name, and a button to view the league video.
- Tapping on a row directs the user to the LeagueDetails ViewController.

### LeagueDetails ViewController 📅
- Provides detailed information about a specific league.
- Users can add the league to their favorite list from the top right corner.
- Divided into three sections: Upcoming Events, Latest Results, and Teams.
  - Upcoming Events: Horizontal scrolling of event names, dates, and times.
  - Latest Results: Vertical scrolling of match details including teams, scores, dates, and times.
  - Teams: Horizontal scrolling of team circular images, tapping on an image directs the user to TeamDetails ViewController.

### TeamDetails ViewController 🏃‍♂️
- Displays detailed information about a specific team.
- UI design emphasizes elegance and user-friendliness.
- Contains relevant team details without overwhelming the user.

## Technologies Used 🛠️
- Swift
- MVVM Architecture: The app follows the Model-View-ViewModel (MVVM) architecture to separate concerns and improve     code maintainability.
- Lottie: For smooth and visually appealing animations.
  ![Lottie](https://img.shields.io/badge/Lottie-Animations-brightgreen)
- Kingfisher: For efficient image downloading and caching.
  ![Kingfisher](https://img.shields.io/badge/Kingfisher-Image%20Caching-blue)
- Alamofire: For networking and API requests.

https://github.com/abdelrhman-mamdouh/Sport-App/assets/63111171/da9b17d1-c6bc-48c9-aa17-edc2456e75d4


  ![Alamofire](https://img.shields.io/badge/Alamofire-Networking-orange)
- CoreData
- CollectionView
- TableView
- Orthogonal Scrolling

