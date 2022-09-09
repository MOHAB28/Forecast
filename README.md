# **Forecast app**

I have made this app with clean architecture and I used cubit as state management at the presentation layer.

## Brief explanation

With this app you can know your current location forecast or you can search for a specific city to know about its forecast. You can see a video [in this link](https://drive.google.com/drive/folders/14vNogiX-oLrAu958Bxm9Qx3aVG7NA9YY?usp=sharing).


## Screenshots

  Welcome Page                 |   Home Page        |  Next Forecast Page | Search For city Page | Search view Page
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
![](https://github.com/MOHAB28/algoriza_phase_2/blob/master/screenshoots/1.jpg?raw=true)|![](https://github.com/MOHAB28/algoriza_phase_2/blob/master/screenshoots/2.jpg?raw=true)|![](https://github.com/MOHAB28/algoriza_phase_2/blob/master/screenshoots/3.jpg?raw=true)|![](https://github.com/MOHAB28/algoriza_phase_2/blob/master/screenshoots/4.jpg?raw=true)|![](https://github.com/MOHAB28/algoriza_phase_2/blob/master/screenshoots/5.jpg?raw=true)

## Dependencies

```yaml
  shared_preferences: ^2.0.15
  get_it: ^7.2.0
  flutter_bloc: ^8.1.1
  dartz: ^0.10.1
  internet_connection_checker: ^0.0.1+4
  geolocator: ^9.0.1
  intl: ^0.17.0
  path: ^1.8.1
  lottie: ^1.4.1
  sqflite: ^2.0.3
  equatable: ^2.0.3
  dio: ^4.0.6
  another_flushbar: ^1.10.29
```

## Directory Structure

```
├───core
│   ├───api
│   ├───error
│   ├───network
│   ├───presentation
│   ├───services
│   └───usecase
└───features
    ├───forcastDatabase
    │   ├───data
    │   │   ├───datasources
    │   │   ├───models
    │   │   └───repositories
    │   ├───domain
    │   │   ├───entities
    │   │   ├───repositories
    │   │   └───usecases
    │   └───presentation
    │       └───cubit
    └───getForcast
        ├───data
        │   ├───datasources
        │   ├───models
        │   └───repositories
        ├───domain
        │   ├───entities
        │   ├───repositories
        │   └───usecases
        └───presentation
            ├───cubit
            │   └───bottom_nav_cubit
            ├───pages
            │   ├───layout
            │   │   ├───home
            │   │   ├───next_forcast
            │   │   └───search
            │   ├───search
            │   └───welcome
            └───widgets
```

### Why i used sqflite ?

I used sqflite to store the cities that I want to save at home screen locally.

### Inspirational designs

1. [Welcome page](https://dribbble.com/shots/16361858-Weather-Forecast-Mobile-application)
2. [Home page](https://dribbble.com/shots/15736238-Weather-App-Design-Exploration)