plugins { id("com.android.application"); id("org.jetbrains.kotlin.android"); id("dev.flutter.flutter-gradle-plugin") }
android { namespace = "com.rahyar.study_tracker"; compileSdk = flutter.compileSdkVersion; ndkVersion = flutter.ndkVersion
 defaultConfig { applicationId = "com.rahyar.study_tracker"; minSdk = flutter.minSdkVersion; targetSdk = flutter.targetSdkVersion; versionCode = flutter.versionCode; versionName = flutter.versionName } }
flutter { source = "../.." }
