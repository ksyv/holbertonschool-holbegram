<div align="center"><img src="https://github.com/ksyv/holbertonschool-web_front_end/blob/main/baniere_holberton.png"></div>



## Table of Contents :

  - [0. Let’s Begin](#subparagraph0)
  - [1. Text Widget](#subparagraph1)
  - [2. Login Page](#subparagraph2)
  - [3. Signup Page](#subparagraph3)
  - [4. Linking the Pages](#subparagraph4)
  - [5. Let's Create Our Models](#subparagraph5)
  - [6. Auth Methods](#subparagraph6)
  - [7. Upload User Image](#subparagraph7)
  - [8. Passing Data Between Pages](#subparagraph8)
  - [9. Providers](#subparagraph9)
  - [10. Home Page](#subparagraph10)
  - [11. Posts Storge Methods](#subparagraph11)
  - [12. Add a post](#subparagraph12)
  - [13. Search page](#subparagraph13)
  - [14. Favorite page](#subparagraph14)
  - [15. Profile](#subparagraph15)

## Resources
### Read or watch:
* [Dart - Cheatsheet](https://dart.dev/resources/dart-cheatsheet)
* [FlutterFire Overview](https://firebase.flutter.dev/docs/overview/)
* [Getting started with Firebase on Flutter](youtube.com/watch?v=EXp0gq9kGxI&t=780s&ab_channel=Firebase)
* [Get Started with Firebase Authentication on Flutter](https://firebase.flutter.dev/docs/auth/start/)
* [Cloud Storage on Flutter](https://cloudinary.com/documentation/flutter_integration#landingpage)
* [Layouts in Flutter](https://docs.flutter.dev/ui/layout)
* [Introduction to widgets](https://docs.flutter.dev/ui)
* [Cloudinary Storage Images uploading | Flutter](https://cloudinary.com/documentation/flutter_image_and_video_upload)
* [Every Flutter Widget Explained](https://www.youtube.com/watch?v=kj_tldMmu4w&ab_channel=FlutterMapp)

## Dependencies
* [Firebase Database Plugin for Flutter](https://pub.dev/packages/firebase_database)
* [Firebase Auth for Flutter](https://pub.dev/packages/firebase_auth)
* [Cupertino Icons](https://pub.dev/packages/cupertino_icons)
* [Image Picker plugin for Flutter](https://pub.dev/packages/image_picker)
* [BottomNavyBar](https://pub.dev/packages/bottom_navy_bar)
* [provider](https://pub.dev/packages/provider)
* [Uuid](https://pub.dev/packages/uuid)
* [Cached network image](https://pub.dev/packages/flutter_staggered_grid_view)
* [Flutter Pull To Refresh](https://pub.dev/packages/pull_to_refresh#flutter_pulltorefresh)

## Requirements
### General
Create your project :

Open you’re command-line tool
* flutter create holbegram
* cd holbegram
* flutter run

### Step up your Firebase

For the backend, we are going to use Firebase(Firebase is a Backend-as-a-Service (BaaS) app development platform that provides hosted backend services such as (a real-time database, cloud storage, authentication, crash reporting, machine learning, remote configuration) and hosting for your static files. However, for storing and managing images, we will use Cloudinary, which is a cloud service that provides an easy-to-use solution for managing images and videos, including features for storing, transforming, and delivering media content. Cloudinary will handle the storage and retrieval of image files, while Firebase will handle the authentication and database functionalities.

Let’s start…

go to https://firebase.google.com/ and create an account then Let’s create a new project in firebase.

Go to Firebase Console and click Add Project and then you have to go through some steps.

First, we are going to build a fire_base app called holbegram:



Second Disable Google Analytics for this project:



Authentication

Click on Enable the Authentication: Enable the Email/Password







Database

Well done! Now you are going to move to the next task which is creating a database.

To do that follow the following steps:

1- Go to Firestore Database then click on Create Database.

2- Choose “start in test mode”



3- choose the location that is close to you.



4- Go to rules:



Finally, press Publish

Adding Firebase to our App

So now let’s add Firebase to our app:

If you want to use Android Follow the Android Support

If you want to work with iOS follow the iOS Support

Adding Android support
Registering the App

In order to add Android support to our Flutter application, select the Android logo from the dashboard. This brings us to the following screen:



The most important thing here is to match up the Android package name that you choose here with the one inside of our application.

The structure consists of at least two segments. A common pattern is to use a domain name, a company name, and the application name:

com.example.holbegram

Once you’ve decided on a name, open android/app/build.gradle in your code editor and update the applicationId to match the Android package name:

Example of File android/app/build.gradle

...
defaultConfig {
    // TODO: Specify your own unique Application ID (https://developer.android.com/studio/build/application-id.html).
    applicationId 'com.example.holbegram'
    ...
}
...
You can skip the app nickname and debug signing keys at this stage. Select Register app to continue.

Downloading the Config File

The next step is to add the Firebase configuration file into our Flutter project. This is important as it contains the API keys and other critical information for Firebase to use.

Select Download google-services.json from this page:



Next, move the google-services.json file to the android/app directory within the Flutter project.

Adding the Firebase SDK

We’ll now need to update our Gradle configuration to include the Google Services plugin.

Open android/build.gradle in your code editor and modify it to include the following:

Example of File android/build.gradle

buildscript {
  repositories {
    // Check that you have the following line (if not, add it):
    google()  // Google's Maven repository
  }
  dependencies {
    ...
    // Add this line
    classpath 'com.google.gms:google-services:4.3.13'
  }
}

allprojects {
  ...
  repositories {
    // Check that you have the following line (if not, add it):
    google()  // Google's Maven repository
    ...
  }
}
Finally, update the app level file atandroid/app/build.gradle to include the following:

Example of File android/app/build.gradle

apply plugin: 'com.android.application'
// Add this line
apply plugin: 'com.google.gms.google-services'

dependencies {
  // Import the Firebase BoM
 implementation platform('com.google.firebase:firebase-bom:30.2.0')

  // Add the dependencies for any other desired Firebase products
  // https://firebase.google.com/docs/android/setup#available-libraries
}
With this update, we’re essentially applying the Google Services plugin as well as looking at how other Flutter Firebase plugins can be activated such as Analytics.

From here, run your application on an Android device or simulator. If everything has worked correctly, you should get the following message in the dashboard:



Adding iOS support
In order to add Firebase support for iOS, we have to follow a similar set of instructions.

Head back over to the dashboard and select Add app and then iOS icon to be navigated to the setup process.

Registering an App

You Should have Xcode installed in your PC:

Once again, we’ll need to add an “iOS Bundle ID”. It is possible to use the “Android package name” for consistency:



You’ll then need to make sure this matches up by opening the iOS folder up in Xcode



General


Now go back to your firebase and add the iOS Bundle ID

after that Download the configuration file

Downloading the Config File

Drag and Drop the file GoogleService-Info.plist and move this into the root of your Xcode project within Runner:





Be sure to move this file within Xcode to create the proper file references.

## Task
### 0. Let’s Begin <a name='subparagraph0'></a>

Now after we set our Firebase we gonna start build our Application, First we are going to create Three screens <code>Login Page</code> <code>Sign up Page</code> and <code>Upload image Page</code>.

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/11/138de426ea182abb86ae90b76e6517ab4794ba2a.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=9d1afc1c0617753f15bb25814bb1186af5e5f5d49c514adb4928fd27c61ae6a7" style=""/> <img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/11/c8e3e89811dfc10d61c27bf5be23cfbf1eb8ca99.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=3314d78cf62fe9f5e3359758fee603660c2c39abbba61de4db5c1a42455e8635" style=""/> <img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/11/b15f8b2a55c6d8ba52fe0adf343bc5acd40a2ceb.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=7ce7ff26555609f949fa6a2af71c2d64052f858f70e95895e870872fef947622" style=""/>

<strong>In your lib folder</strong>:

* create new folder named <strong>screens</strong>:


  * inside the <strong>screens</strong> folder create 3 files named:


    * login_screen.dart
    * signup_screen.dart
    * upload_image_screen.dart

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/11/09362f244f473704661a68ffa94e15bcd3ecd97d.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=25ebc6f3e3376504c5d68b2a79848400490af1a197f950e90ffa1a52c1317a0a" style=""/>

* create new folder named <strong>widgets</strong>:


  * inside the <strong>widgets</strong> folder create 1 file named:


    * text_field.dart

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/11/c3a2e750023c4588d8e57fe57fb327183a9df5bb.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=a1906f7916040772c3a0f39cfac35ef26e77d35565821b974fd77d8c7c6ba7e0" style=""/>

<strong>Initialization App</strong>

Install these packages:

* <a href="/rltoken/PCtSeP6u5iTMeYF2GCkuQg" target="_blank" title="firebase_auth">firebase_auth</a> : <code>flutter pub add firebase_auth</code>
* <a href="/rltoken/XxBGYPjJR_VnypLH1WKkDw" target="_blank" title="firebase_database">firebase_database</a> : <code>flutter pub add firebase_database</code>
* <a href="/rltoken/Kkv6W9cD9E26zqpnJxR7gg" target="_blank" title="cloudinary_flutter">cloudinary_flutter</a>: <code>flutter pub add cloudinary_flutter</code>

Change the function<code>void main()</code> to:

```
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}
```

---

### 1. Text Widget <a name='subparagraph1'></a>

In the <code>widgets/text_field.dart</code> :

In order to learn how a reusable widget works, we will build this TextField widget .

Create a new <code>StatelessWidget</code> called <code>TextFieldInput</code> with these attributes:

* <code>controller</code>: TextEditingController
* <code>ispassword</code>:  bool
* <code>hintText</code>: String
* <code>suffixIcon</code>: Widget it cloud be <code>null</code>
* <code>keyboardType</code>: TextInputType

After the <code>Widget build</code>

Return <code>TextField()</code>:

* <code>keyboardType</code> takes <code>keyboardType</code>
* <code>controller</code> takes <code>controller</code>
* <code>cursorColor</code> takes <code>Color.fromARGB(218, 226, 37, 24)</code>
* <code>decoration</code> takes <code>InputDecoration</code>:


  * <code>hintText</code> takes <code>hintText</code>
  * <code>border</code> takes <code>OutlineInputBorder</code>:


    * <code>borderSide</code>: <code>BorderSide</code>

      * color : transparent
      * style: none
  * <code>focusedBorder</code>: <code>OutlineInputBorder</code>

    * <code>border</code> takes <code>OutlineInputBorder</code>:


      * <code>borderSide</code>: <code>BorderSide</code>

        * <code>color</code> : <code>transparent</code>
        * <code>style</code>: <code>none</code>
  * <code>enabledBorder</code>: <code>OutlineInputBorder</code>

    * <code>border</code> takes <code>OutlineInputBorder</code>:


      * <code>borderSide</code>: <code>BorderSide</code>

        * <code>color</code> : <code>transparent</code>
        * <code>style</code>: <code>none</code>
  * <code>filled</code> : <code>true</code>
  * <code>contentPadding</code> : <code>EdgeInsets.all(8)</code>
  * <code>suffixIcon</code> takes  <code>suffixIcon</code>
* <code>textInputAction</code> : <code>next</code>
* <code>obscureText</code> takes <code>ispassword</code>

For Example :

If we put the  <code>hintText</code> : <code>Email</code> it’s giong to be like this:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2023/1/9b678015040ae3573a5cec7de257eae6d9992254.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=1ef8c632b54adcd5b0b10756cefdcf5d611556139326bfbc6ea4e27b56f5c98a" style=""/>

Another Example :

If we put the  <code>hintText</code> : <code>Password</code> and <code>ispassword</code>: <code>true</code> it’s giong to be like this:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2023/1/48113af9741c78b783e988135934a252c8da6c61.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=640f36d8c8b360e68d8c13102e9923275844970e7951010a5ec048b566546ae6" style=""/>

---

### 2. Login Page <a name='subparagraph2'></a>

Login Page

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2023/1/e80a4da25022391cd487de3ca468c0ea499bd2b0.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=532d2d2959f78c2a7149fff96db8fd12caf9da27caf38e9b5136a4d23ab9348b" style=""/>

You will need this<a href="/rltoken/7_1UNJISW2XoioyxNbfB_w" target="_blank" title=" Logo"> Logo</a> and this <a href="/rltoken/tuT3KosLdbfQHRl_vZk0OQ" target="_blank" title="Font">Font</a>

After That Create  two folders inside the <code>assets</code> :

* <code>images</code>
* <code>fonts</code>

Put the Logo inside the Images folder and Billabong fonts inside the fonts folder

Inside the <code>pubspec.yaml</code>

* add this <code>- assets/images/</code> under the <code>assets</code>:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/11/75ae4cad40cc06dc44676aa49cbd43ebf32e654c.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=ad45ecfa42500808e6c068953df0f6f5968efbe1ad55acecedc4b5575d63ab7f" style=""/>

* add this under the fonts

```
- family: Billabong
      fonts:
        - asset: assets/fonts/Billabong.ttf
        - asset: assets/fonts/InstagramSans.ttf
```

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/11/be4ca97fb69abb3065edd3587478bef1d7e8ad43.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=8c702b3aca6fda9c8528d3d40e6a5ac351fd7212c30fdd1516ddc5b5aa4db19f" style=""/>

<strong>Now</strong>
Inside <code>login_screen.dart</code> :

* Create a new <code>StatefulWidget</code> called <code>LoginScreen</code> that takes these arguments.


  * <code>emailController</code> : <code>TextEditingController</code>
  * <code>passwordController</code>:  <code>TextEditingController</code>
  * <code>_passwordVisible</code> : <code>bool</code> default takes <code>true</code>

<strong>Dispose</strong> only the <code>TextEditingController</code> arguments

<strong>initState</strong> for the <code>_passwordVisible</code>, before that, you add <code>@override</code> annotation

* <p>Returns: <code>Scaffold()</code> Inside the scaffold add a <code>SingleChildScrollView</code> in the body</p>

  * <code>SingleChildScrollView</code> takes <code>Column</code>:


    * <code>Horizontally of the Column will be : min</code>
    * <code>Verticale of the Column will be : center</code>
  * <p>Inside of the  <code>Column</code> :</p>

    * <p><code>children[]</code>:</p>

      * Set the <code>SizedBox</code> of <code>height</code> to <code>28</code>
      * Create a Text widget that contains the name of the app <code>Holbegram</code> with the <code>Billabong</code> Font and the  font size of <code>50</code>
      * The logo will be inside an Image widget (<code>width: 80,height: 60</code>)
      * Create <code>Padding</code>

        * Set <code>EdgeInsets.symmetric</code> to <code>horizontal</code> : <code>20</code>
        * Child takes a <code>Column</code>
        * Inside the <code>Children</code> of the <code>Column</code> we are going to call the <code>TextFieldInput</code> that we created. First let’s keep our screen Sized
      * <code>SizedBox</code> takes height: <code>28</code>
    * <p>Email <code>TextFieldInput</code></p>
<pre><code>* `controller` : `emailController`

* `ispassword` : flase

* `hintText` : `Email`

* `keyboardType` : `TextInputType.emailAddress`
</code></pre>
  * <p>Set the <code>SizedBox</code> of <code>height</code> to <code>24</code></p>
  * <p>Password <code>TextField</code></p>

    * <code>TextFieldInput</code>

      * <code>controller</code> : <code>passwordController</code>
      * <code>ispassword</code> : <code>!_passwordVisible</code>
      * <code>hintText</code> : <code>Password</code>
      * <code>keyboardType</code> : <code>TextInputType.visiblePassword</code>
      * <code>suffixIcon</code> takes <code>IconButton</code>

        * <code>alignment</code> : <code>bottomLeft</code>
        * If the <code>_passwordVisible</code> is  <code>ture</code> <code>icon</code> takes <code>visibility</code> or  <code>icon</code> takes  <code>visibility_off</code>
        * use setState inside the <code>onPressed: ()</code> to change the <code>_passwordVisible</code> when pressed
* <p>Set the <code>SizedBox</code> of <code>height</code> to <code>28</code></p>
* <p><code>SizedBox</code></p>

  * <code>height</code>:  <code>48</code>
  * <code>width</code> : <code>double.infinity</code>
  * <p><code>child</code> : <code>ElevatedButton</code>:</p>

    * <code>style</code>:


      * <code>ButtonStyle</code>

        * <code>backgroundColor</code> :<code>WidgetStateProperty.all(Color.fromARGB(218, 226, 37, 24),)</code>
    * <code>onPressed</code> leave it empty for the moment
    * <code>child</code> :  <code>Text</code>:


      * <code>Log in</code>
      * <code>style</code>:


        * <code>TextStyle(color: Colors.white)</code>
After this.
* <p>Set the <code>SizedBox</code> of <code>height</code> to <code>24</code></p>
* <p><code>Row</code></p>

  * <code>mainAxisAlignment</code>: <code>center</code>
  * <code>children</code>:


    * <code>Text</code> : <code>Forgot your login details?</code>
    * <code>Text</code> :  <code>Get help logging in</code> with <code>fontWeight</code> : <code>bold</code>
* <p><code>Flexible</code>:</p>

  * <code>flex</code>: <code>0</code>
  * <code>child</code>: <code>Container()</code>
* <p>Set the <code>SizedBox</code> of <code>height</code> to <code>24</code></p>
* <p><code>Divider</code> : <code>thickness</code> to <code>2</code></p>
* <p><code>Padding</code>:</p>
* <p>Set  <code>vertical</code> padding to <code>12</code></p>
* <p><code>child</code> takes <code>Row</code>:</p>

  * <code>mainAxisAlignment</code>: <code>center</code>
  * <code>children</code>:


    * <code>Text</code> : <code>Don't have an account</code>
    * <code>TextButton</code>:


      * <code>onPressed</code> leave it empty for the moment
      * <code>child</code> takes <code>Text</code> with a String <code>Sign up</code> set <code>fontWeight</code> to <code>bold</code> and <code>color</code> to <code>fromARGB(218, 226, 37, 24)</code>
  * Set the <code>SizedBox</code> of <code>height</code> to <code>10</code>
* <p><code>Row</code>:</p>

  * <code>children</code>:


    * Create two <code>Flexible</code> widgets with <code>child</code> takes <code>Divider</code> : <code>thickness</code> to <code>2</code> between the two widget create a <code>Text</code> with string <code>" OR "</code>
* <p>Set the <code>SizedBox</code> of <code>height</code> to <code>10</code></p>
* <p><code>Row</code>:</p>

  * <code>mainAxisSize</code> : <code>min</code>
  * <code>mainAxisAlignment</code> : <code>center</code>
  * <code>children</code>:


    * Takes an Image network with <code>width: 40</code> <code>height: 40</code>

      * Image : <a href="https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png" target="_blank" title="Image Link">Image Link</a>
    * <code>Text</code> :  <code>"Sign in with Google"</code>

---

### 3. Signup Page <a name='subparagraph3'></a>

Signup Page

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2023/1/24850d82e5025b87cfe2401b37504c7f9f729ab7.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=8264df641a6f076e9a8a4541a65b33c552f9a87723440e0b6a70c3e5953f2475" style=""/>

Inside <code>signup_screen.dart</code> create :

* Create a new <code>StatefulWidget</code> called <code>SignUp</code> takes these arguments.


  * <code>emailController</code> : <code>TextEditingController</code>
  * <code>usernameController</code> : <code>TextEditingController</code>
  * <code>passwordController</code>:  <code>TextEditingController</code>
  * <code>passwordConfirmController</code>:  <code>TextEditingController</code>
  * <code>_passwordVisible</code> : <code>bool</code> default takes <code>true</code>

Let’s <code>dispose</code> them like we did in the Login Page and don’t forget <code>initState</code> for the <code>_passwordVisible</code>

Now! we are going to do the <code>Sign Up</code> page. It is very similar to the previous task therefore, I want you to try this on your own.

If you face any difficulties check the previous task or do as any great developer does: Google it!

In the bottom there is a String “Log in”

It’s a <code>TextButton</code> that navigates you to the Log in page

If you want to do it alone it’s a plus too or jump to the next task.

---

### 4. Linking the Pages <a name='subparagraph4'></a>

Inside <code>login_screen.dart</code>:

In the <code>TextButton</code> widget that contains<code>Sign Up</code> as a <code>Text</code>

we will change the <code>onPressed</code> to make it navigate to the Sign Up page:

* Use <code>Navigator.push</code>:


  * Assign <code>SignUp()</code> and don’t forget to import it

Inside <code>signup_screen.dart</code>

In the <code>TextButton</code> widget that contain<code>Log in</code> as a <code>Text</code>

we will change the <code>onPressed</code> to make it navigate to the Log in page:

* Use <code>Navigator.push</code>:


  * Assign <code>LoginScreen()</code> and don’t forget to import it

---

### 5. Let's Create Our Models <a name='subparagraph5'></a>

In the <code>lib</code> folder:

* Create a new folder called <code>models</code> that contains two file :


  * <code>user.dart</code>
  * <code>posts.dart</code>

In the <code>lib/models/user.dart</code> create a class called <code>Users</code>:

* Properties:


  * <code>uid</code>: String
  * <code>email</code>: String
  * <code>username</code>: String
  * <code>bio</code>: String
  * <code>photoUrl</code>: String
  * <code>followers</code>: List<code>&lt;dynamic&gt;</code>
  * <code>following</code>: List<code>&lt;dynamic&gt;</code>
  * <code>posts</code>: List<code>&lt;dynamic&gt;</code>
  * <code>saved</code>: List<code>&lt;dynamic&gt;</code>
  * <code>searchKey</code> : String

Create a new Method called <code>fromSnap</code>  that accepts <code>DocumentSnapshot</code> as parameter

* Prototype :


  * <code>static Userd fromSnap(DocumentSnapshot snap)</code>

Create a variable inside the <code>fromJson</code> called <code>snapshot</code> that is going to take the data from <code>snap</code>

Return every value inside it.

Create a method called <code>toJson()</code> that returns a map representation of the <code>Users</code>

---

### 6. Auth Methods <a name='subparagraph6'></a>

Create a new folder inside the <code>lib</code> called <code>methods</code>:

Inside <code>lib/methods</code> create a new file called <code>auth_methods.dart</code>

Now inside <code>auth_methods.dart</code>:

Start by adding the packages needed :

* <code>Cloud_firestore</code>
* <code>Firebase_auth</code>
* <p><code>http (for Cloudinary API requests)</code></p>
* <p>Create a new Class called <code>AuthMethode</code> that’s going to contain our Methods.</p>

Inside the class, create two arguments:

* <code>_auth</code>  that extends from <code>FirebaseAuth</code>
* <code>_firestore</code> that extends  from <code>FirebaseFirestore</code>

<code>_auth</code> = <code>FirebaseAuth.instance</code>

<code>_firestore</code> = <code>FirebaseFirestore.instance</code>

Create a new instance for Login called <code>login</code> that takes two arguments <code>email</code>: String, <code>password</code>: String. Return a String

* Prototype :


  * <code>Future&lt;String&gt; login({required String email,required String password,})</code>

    * Check if the email or the password are empty:


      * Return <code>Please fill all the fields</code>
    * Use <code>_auth.signInWithEmailAndPassword</code> method from <code>FirebaseAuth</code>
    * Return <code>success</code>

      * On success navigate to the home screen

Now go back to the login screen and edit the submit button to call login() while passing the corresponding parameters and use the function’s return value to show a snackbar with the text “Login” on success

Create a new instance for Sign Up called <code>signUpUser</code> that takes these arguments <code>email</code>: String , <code>password</code>: String , <code>username</code>: String , <code>file</code>: Uint8List. Return a String

* Prototype :


  * <code>Future&lt;String&gt; signUpUser({required String email,required String password,required String username,Uint8List? file,})</code>

    * Check if the <code>email</code> or the <code>password</code>, <code>username</code> are empty:


      * Return <code>Please fill all the fields</code>
    * Use <code>_auth.createUserWithEmailAndPassword</code> method from <code>FirebaseAuth</code>
    * <code>userCredential</code> takes the return of the <code>_auth.createUserWithEmailAndPassword</code>

<strong>Now</strong> right! after using <code>_auth.createUserWithEmailAndPassword</code> put this:

* <code>User</code>takes <code>userCredential.user</code>;

The arguments that we just passed in to Sign Up put it to our <code>Users</code> Class

After that:

* <code>await _firestore.collection("users").doc(user.uid).set(users.toJson());</code>
* Return <code>success</code>

---

### 7. Upload User Image <a name='subparagraph7'></a>

Let’s put our file in the <code>screens</code>  inside a new folder called <code>auth</code> :

Create a new folder inside <code>screens/auth</code> called <code>methods</code>:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2023/1/197d8d071c1bf504f62185889aaeb1e7268a43c7.png?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=65009887fd9040c7a1bd751916a00610c7a48e795b1e32bcf05ae370a38cc69d" style=""/>

Inside <code>methods</code> folder create a new file called <code>user_storage.dart</code>:

Copy and paste the Code into your file

```
import 'dart:typed_data';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class StorageMethods {
  final String cloudinaryUrl = "https://api.cloudinary.com/v1_1/your-cloud-name/image/upload";
  final String cloudinaryPreset = "your-upload-preset";

  Future<String> uploadImageToStorage(
      bool isPost,
      String childName,
      Uint8List file,
  ) async {
    String uniqueId = const Uuid().v1();
    var uri = Uri.parse(cloudinaryUrl);
    var request = http.MultipartRequest('POST', uri);
    request.fields['upload_preset'] = cloudinaryPreset;
    request.fields['folder'] = childName;
    request.fields['public_id'] = isPost ? uniqueId : '';

    var multipartFile = http.MultipartFile.fromBytes('file', file, filename: '$uniqueId.jpg');
    request.files.add(multipartFile);

    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var jsonResponse = jsonDecode(String.fromCharCodes(responseData));
      return jsonResponse['secure_url'];
    } else {
      throw Exception('Failed to upload image to Cloudinary');
    }
  }
}
```

Inside the <code>upload_image_screen.dart</code>:

Create a <code>StatefulWidget</code> Called <code>AddPicture</code> that accepts three arguments :

* <code>final String email</code>
* <code>final String password</code>
* <code>final String username</code>

And contains a variable called <code>_image</code>

* <code>Uint8List? _image</code>

Create two methods:

The first one is Called <code>selectImageFromGallery()</code>:

* Prototype


  * <code>void selectImageFromGallery()</code>
  * Return the value to variable <code>_image</code>
* Use <code>imagepicker</code>

the second one is Called <code>selectImageFromCamera()</code>:

* Prototype


  * <code>void selectImageFromCamera()</code>
  * Return the value to variable <code>_image</code>
* Use <code>imagepicker</code>

<strong>Now</strong>

Let’s Create this UI:

The <a href="https://upload.wikimedia.org/wikipedia/commons/9/99/Sample_User_Icon.png" target="_blank" title="Link To the Icon">Link To the Icon</a>

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/6e67866cb45b4f9a5566e8bdd96434c994e93f85.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=af078f64988ccc97b2ef77de6ab2b7a5a4cc83b18571f686496da85ef054385f" style=""/>

Make the camera icon and the gallery icon linking with these functions

Replace the user icon with your image:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/b20daf8cf9cce7daef82cec6fb3e4170d6e81250.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=e27cc70e3e0a219a88a456673fd1b7616adc3fd1baa84cdf22d2fa86859d3aaa" style=""/>

---

### 8. Passing Data Between Pages <a name='subparagraph8'></a>

We are going to pass the sign up data to our upload picture page:

Inside <code>signup_screen.dart</code>

In the <code>onPressed</code> where the Text contain <code>Sign up</code>

use the <code>Navigator</code>  to move to the <code>AddPicture</code> page and passing :

* <code>email</code>
* <code>username</code>
* <code>password</code>

Inside <code>upload_image_screen.dart</code>:

<strong>Use widget when you want to call the data example</strong>:

<code>widget.email</code> or assign it to a variable <code>var email = widget.email</code>

Replace <code>John Doe</code> with the <code>username</code>

On the Next button call the method <code>signUpUser</code> that we created in the <code>auth_methods.dart</code>

Passing the correct data to the <code>signUpUser</code>

* <code>email</code> takes <code>email</code>
* <code>username</code> takes <code>username</code>
* <code>password</code> takes <code>password</code>
* <code>file</code> takes <code>_image</code>
* on <code>success</code> show a <code>snackbar</code>  with a <code>success</code> on it

---

### 9. Providers <a name='subparagraph9'></a>

Create a new method called <code>getUserDetails</code> inside <code>auth_methods.dart</code> that gets the current user details and return <code>Userd.fromSnap</code> within the details

Inside the <code>lib/</code> create a new folder called <code>providers</code> that contain <code>user_provider.dart</code> file:

Inside <code>user_provider.dart</code> Create a class called <code>UserProvider</code> mixin with the <code>ChangeNotifier</code>

Create privet variables:

* <code>_user</code> takes <code>Userd</code>
* <code>_authMethode</code> takes  <code>AuthMethode()</code>

Create a getter for <code>_user</code>

Create a method called <code>refreshUser</code> prototype:

* Future refreshUser():


  * <code>user</code> takes <code>getUserDetails</code> method from <code>AuthMethode()</code>
  * <code>_userd</code> takes <code>user</code>
  * at the end add <code>notifyListeners()</code>

---

### 10. Home Page <a name='subparagraph10'></a>

We are going to create the Home page now :

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/88520f0e2186e12e41d93b10cb312de6acc83bee.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=a8bd9e1198ea2808828548ac7d4a4b6941de21d6f4f353a428d581c3de74c7d0" style=""/>

<strong>First</strong>  we are going to create all pages:

* <p>Create a new folder inside the screens folder called <code>pages</code>:</p>

  * <code>Feed()</code> : <code>feed.dart</code>
  * <code>Search()</code> : <code>search.dart</code>
  * <code>AddImage()</code>: <code>add_image.dart</code>
  * <code>Favorite()</code> :  <code>favorite.dart</code>
  * <code>Profile()</code> : <code>profile_screen.dart</code>

To start with the bottom navigation bar

Install this package:

* <a href="/rltoken/nQ4YnR5B2dJLE_3MMrbhCQ" target="_blank" title="BottomNavyBar">BottomNavyBar</a>

Inside the <code>widgets</code> folder:

* Create a new file called <code>bottom_nav.dart</code>

  * Create a <code>StatefulWidget</code> called <code>BottomNav</code>
  * <code>_currentIndex</code> : <code>0</code>
  * <code>_pageController</code> assign to <code>PageController</code>
  * <code>initState()</code>:


    * <code>_pageController</code> : PageController()
  * <code>dispose()</code>
  * Return <code>Scaffold</code>body <code>PageView</code>

    * <code>controller</code> : <code>_pageController</code>
  * <code>children</code> takes all the pages:


    * <code>Feed()</code>
    * <code>Search()</code>
    * <code>AddImage()</code>
    * <code>Favorite()</code>
    * <code>Profile()</code>
  * <code>bottomNavigationBar</code> : <code>BottomNavyBar</code>

    * <code>selectedIndex</code> : <code>_currentIndex</code>
    * <code>showElevation</code> : <code>true</code>
    * <code>itemCornerRadius</code> : <code>8</code>
    * <code>curve</code> : <code>Curves.easeInBack</code>
    * <code>onItemSelected</code>: <code>onPageChanged</code> takes an arguments called index 


      * in <code>setState</code> <code>_currentIndex</code> takes <code>index</code>
  * <code>items</code> it’s a list of <code>BottomNavyBarItem</code> we are going to create Five of them and every each one has a different <code>Icon</code> , <code>Text</code>:


    * Inside <code>BottomNavyBarItem</code>:
    * <code>icon</code>: <code>Icons</code>
    * <code>title</code> : <code>Text</code>

      * <code>TextStyle</code>:


        * <code>fontSize</code> : <code>25</code>
        * <code>fontFamily</code>: <code>Billabong</code>
      * <code>activeColor</code> : <code>red</code>
      * <code>textAlign</code>: <code>center</code>
      * <code>inactiveColor</code>: <code>black</code>

<strong>Now</strong>

Inside <code>home.dart</code>

Create <code>StatefulWidget</code> called <code>Home</code> that returns  <code>BottomNav()</code>

Inside <code>feed.dart</code>

Create <code>StatelessWidget</code> called <code>Feed</code> that returns <code>Scaffold()</code>:

* With an <code>AppBar</code> contains <code>Holbegram</code> with <code>Billabong</code> font and the logo like in the Picture and a <code>Row</code> with two Icons
* Body return widget called <code>Posts()</code> that we are going to create later

In the <code>models/post.dart</code>

* Create a class called <code>Post</code>

  * <code>caption</code> : <code>String</code>
  * <code>uid</code>: <code>String</code>
  * <code>username</code> : <code>String</code>
  * <code>likes</code> : <code>List</code>
  * <code>postId</code> : <code>String</code>
  * <code>datePublished</code> : <code>DateTime</code>
  * <code>postUrl</code> : <code>String</code>
  * <code>profImage</code> : <code>String</code>

Create the instance <code>fromSnap</code> like we did in the Users Class

Don’t forget the <code>toJson</code> method

Inside <code>utils/posts.dart</code>:

Create a <code>StatefulWidget</code> Called <code>Posts</code>  using the <code>getUser</code>

<strong>Use the provider and make necessary changes if required</strong>

* Return <code>StreamBuilder</code> :


  * <code>stream</code> : <code>FirebaseFirestore.instance.collection('posts').snapshots()</code>
  * if <code>snapshot.hasError</code> return <code>Error {snapshot.error}</code>
  * if <code>snapshot.hasData</code> return <code>ListView.builder</code>
  * <code>data</code> = <code>snapshot.data.docs</code>

    * Return <code>SingleChildScrollView</code>
    * <code>Child</code> : <code>Container</code>:
    * <code>margin</code>: <code>EdgeInsetsGeometry.lerp(const EdgeInsets.all(8), const EdgeInsets.all(8), 10)</code>
    * <code>height</code> : <code>540</code>
    * <code>decoration</code>: <code>color fromARGB(255, 255, 255, 255), borderRadius circular(25)</code>
    * <code>child</code> : <code>Column</code> > <code>children</code> > <code>Container</code> > <code>child</code> > <code>row</code> > <code>children</code>

      * <code>padding EdgeInsets.all(8.0)</code> > <code>child</code> > <code>Container width: 40, height: 40,</code> > <code>decoration BoxDecoration(shape: BoxShape.circle)</code> > <code>image</code> > <code>data['profImage'] fit : cover</code>
      * <code>Text</code> : <code>username</code>
      * <code>Spacer</code>
      * <code>IconButton</code>:


        * <code>Icon</code> : <code>more_horiz</code>
        * <code>onPressed</code> : Show snack with <code>Text</code> “Post Deleted”
      * <code>SizedBox</code> :


        * <code>child</code> : <code>Text</code> that contain the <code>caption</code>
      * <code>SizedBox</code> :


        * <code>height</code> : <code>10</code>
      * <code>Container</code> : 


        * <code>width</code> : <code>350</code>
        * <code>height</code> : <code>350</code>
        * <code>decoration</code> : <code>BorderRadius.circular</code> <code>25</code>
        * <code>image</code> : <code>postUrl</code>
        * <code>fit</code> : <code>cover</code>

Add the missing <code>Icons</code> that appears in the <code>Picture</code>

Return <code>CircularProgressIndicator()</code> if the data still fetching

---

### 11. Posts Storge Methods <a name='subparagraph11'></a>

Inside the <code>pages</code> folder create a new folder called <code>methods</code>:

Inside the  <code>methods</code> create a new file called <code>post_storage.dart</code>:

* Create a class called <code>PostStorage</code>:


  * <code>_firestore</code> takes : <code>FirebaseFirestore.instance</code>

<strong>Methods</strong>

Create a method Called <code>uploadPost</code> takes <code>caption</code>, <code>uid</code>, <code>username</code>, <code>profImage</code> as a <code>String</code> and <code>image</code> as <code>Uint8List</code>

* Method prototype : <code>Future&lt;String&gt; uploadPost(String caption,String uid,String username,String profImage,Uint8List image)</code>

should use <code>uploadImageToCloudinary</code> from <code>lib\screens\auth\methods\user_storege.dart</code>

Return “<code>Ok</code>” On success else Return the error

Create another method called <code>deletePost</code> that accept <code>postId</code> and <code>publicId</code> as an arguments to delete the post

* Method prototype : <code>Future&lt;void&gt; deletePost(String postId, string publicId)</code>

Inside <code>utils/posts.dart</code>:

* In the <code>onPressed()</code> Before the <code>snackbar</code> that shows “Post Deleted” Call the  the <code>deletePost</code> it should delete your post when you pressed on the icon

---

### 12. Add a post <a name='subparagraph12'></a>

Inside <code>add_image.dart</code> we are going to create this UI:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/ba9288292c9e3260060f022c7a40f0ef94f6ca7d.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=37fb0da795a410d0fb1f98cb37dcaf2deb4a46ad14cbf3c310bf6339c9e4fa71" style=""/>

<a href="https://cdn.pixabay.com/photo/2017/11/10/05/24/add-2935429_960_720.png" target="_blank" title="Link to the Icon ">Link to the Icon </a>

<strong>Make necessary changes if required</strong>

Like we did in the <code>AddPicture</code>

* Use <code>image_picker</code>

  * Using the two option to add an image [<code>gallery</code>, <code>camera</code>]

Call <code>uploadPost</code> when you press on <code>Post</code> and make sure to redirect to the <code>Home page</code>

---

### 13. Search page <a name='subparagraph13'></a>

Inside <code>search.dart</code> we are going to create this UI:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/a22f19f7732ea369bbe4777e0a912e8948b214b4.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=658d1be7479bf3cdc202f3534a5990b0ed31afefe26d7b7e1aea16f3ec30e5da" style=""/>

<strong>Make necessary changes if required</strong>

* Display all images uploaded to <code>Cloudinary</code>.
* Use <code>StaggeredGridView</code>

---

### 14. Favorite page <a name='subparagraph14'></a>

Inside <code>favorite.dart</code> we are going to create this UI:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/e8c14474c9b6315cb5aeff9616b7f5fe9b0054e2.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=150860e7c38495acf3dda0fac696c424cd7ecd6f127f62434304e72afa7fcdf5" style=""/>

<strong>Make necessary changes if required</strong>

when clicking on the <code>Icons.bookmark</code> in the Feed the image get saved and it appears in the Favorite page

---

### 15. Profile <a name='subparagraph15'></a>

Inside <code>profile.dart</code> we are going to create this UI:

<img alt="" loading="lazy" src="https://s3.eu-west-3.amazonaws.com/hbtn.intranet/uploads/medias/2022/12/cb96776b56e542882e5d58b85d19be6869754c5e.jpg?X-Amz-Algorithm=AWS4-HMAC-SHA256&amp;X-Amz-Credential=AKIA4MYA5JM5DUTZGMZG%2F20251216%2Feu-west-3%2Fs3%2Faws4_request&amp;X-Amz-Date=20251216T081817Z&amp;X-Amz-Expires=86400&amp;X-Amz-SignedHeaders=host&amp;X-Amz-Signature=4754d8fee78718fe85c5a0ca96ff2145d16b0c2c8d2619507dc7342ac7a3df65" style=""/>

The icon at the top is for Logout.

<strong>Make necessary changes if required</strong>

Retrieve and display the necessary data, including images stored on Cloudinary.

And <strong>congratulations</strong> you made it

---


## Authors
Ksyv - [GitHub Profile](https://github.com/ksyv)
