# LogMeInByGPS

A demo project showcasing the setup of the SwiftUI app with MVVM Architecture consuming a Spring RESTful services in JAVA.

<img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/swift/swift-original.svg" alt="swift" width="40" height="40"/> <img src="https://www.vectorlogo.zone/logos/springio/springio-icon.svg" alt="spring" width="40" height="40"/> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/java/java-original.svg" alt="java" width="40" height="40"/> <img src="https://raw.githubusercontent.com/bestofjs/bestofjs-webui/8665e8c267a0215f3159df28b33c365198101df5/public/logos/realm.svg" alt="realm" width="40" height="40"/>

![platforms](https://img.shields.io/badge/platforms-iPhone%20%7C%20iPad%20%7C%20macOS-lightgrey) 

<p align="center">
SCREENSHOT  PLACE_HOLDER
</p>

## Key features
* Vanilla **SwiftUI** + **CoreLocation** framework
* Spring RESTFul service in JAVA
* Data persistence with **Realm**

## Architecture overview

<p align="center">
SCREENSHOT  PLACE_HOLDER
</p>

### Presentation Layer

**SwiftUI views** that contain no business logic and are a function of the state.

Side effects are triggered by the user's actions (such as a tap on a button) or view lifecycle event `onAppear` and are forwarded to the `ViewModel`.

`ViewModel` also serves as the data source for the View. `ViewModel` is injected into the view as a constructor parameter.

### Business Logic Layer

Business Logic Layer is represented by `ViewModels` and `Services`.

`Services` receive requests  to perform work, like *clock-in*/*punch out* users from an ipotetical ERP or making computations, but they never directly return data back.

`ViewModel` works as an intermediary between `View` and `Services`, encapsulating business logic. 

### Data Access Layer

Data Access Layer is represented by a RESTFul Spring JAVA service that simulate Clock-in, Punch-out users operations.

---
 <a href="https://twitter.com/@bhemot" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/twitter.svg" alt="@bhemot" height="30" width="40" /></a> <a href="https://linkedin.com/in/marco-spicciani-07a5776" target="blank"><img align="center" src="https://raw.githubusercontent.com/rahuldkjain/github-profile-readme-generator/master/src/images/icons/Social/linked-in-alt.svg" alt="marco-spicciani-07a5776" height="30" width="40" /></a> 



