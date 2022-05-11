# Flutter Presence.

## Introduction

Open Source Flutter Presence App integrated with geolocation (GPS) that can help your company or you as a developer to build a presence app. beauty user interface and have a multi user ( admin and employee ). You can also change the appearance of this application easily or add new features. Using Getx and Firebase.

## App Screenshot

<img src="https://github.com/mrezkys/flutter_presence/blob/main/demo/banner.jpg" width="auto" height="auto" >
<img src="https://github.com/mrezkys/flutter_presence/blob/main/demo/shot.jpg" width="auto" height="auto" >
<img src="https://github.com/mrezkys/flutter_presence/blob/main/demo/details.jpg" width="auto" height="auto" >

## Demo

You can try the demo (only android, because i dont have mac to build the ios) by downloading this apk : <a href="https://github.com/mrezkys/flutter_presence/tree/main/demo/application">Download Demo</a> .

**Admin Login**

Email : mrezkysulihin@gmail.com
Password : 123456789

**Employee Login** :

Email : mrezkysulihin12@gmail.com
Password : 123456789



## Installation

**Step 1:**

Download or clone this repo by using the link below and do flutter pub get.

```
https://github.com/mrezkys/flutter_presence.git
cd flutter_presence
flutter pub get
```

**Step 2:**

Rename the app package name ( because this can affect the firebase ) . You can do it manually or using this package <a href="https://pub.dev/packages/rename">Rename Package</a> or look at this <a href="https://stackoverflow.com/questions/51534616/how-to-change-package-name-in-flutter">Stackoverflow Question</a>

**Step 3:**

Re init the firebase cli. <a href="https://firebase.google.com/docs/flutter/setup">See Documentation</a>

**Step 4:**

Enable firebase email/password authentication

**Step 5:**

Create Firestore Database

**Step 6:**

This time, we will set up the database and admin account. The first thing that you need to do is add user at firebase console authentication menu
<br><img src="https://github.com/mrezkys/flutter_presence/blob/main/demo/tutor/step 1.JPG" width="400" height="auto" ><br>
copy the User UID. Next, you need to start a collection like this : *use the User UID as Document id
<br><img src="https://github.com/mrezkys/flutter_presence/blob/main/demo/tutor/step 2.JPG" width="400" height="auto" ><br>
role is the important field, in this application there are 2 role ( admin and employee ). Also, the created_at field is using Iso8601String, but you can use this dummy date
```
2022-05-10T12:34:58.274129
```

**Step 7:**

Run the flutter app

**Step 8:**

Change the company data at lib/company_data.dart

## About the Author

Flutter Presence is Developed by [mrezkys](https://www.facebook.com/mrezkys12)
The User Interface are designed by [mrezkys](https://dribbble.com/mrezkys)

## Thanks To
Iconly, icons that i used on this project, created by [Piqo Design](https://www.figma.com/@piqodesign)

## License
Flutter Presence is under MIT License.

## Donate
You can support me at [trakteer](https://trakteer.id/mrezkys) <br>
<a href="https://trakteer.id/mrezkys" target="_blank"><img id="wse-buttons-preview" src="https://cdn.trakteer.id/images/embed/trbtn-red-5.png" height="45" style="border: 0px; height: 45px;" alt="Trakteer Saya"></a>

## Announcement

Now Flutter Presence already relased v1.0.0
