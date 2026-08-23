# Flutter-related classes (Keep only required ones)
-keep class io.flutter.embedding.engine.** { *; }
-keep class io.flutter.plugins.GeneratedPluginRegistrant { *; }
-keep class io.flutter.view.FlutterMain { *; }

# Keep Firebase-related classes (only if using Firebase)
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.messaging.**
-dontwarn com.google.firebase.iid.**

# Razorpay (or any other payment SDK) - Prevent code stripping
-keep class com.razorpay.** { *; }
-dontwarn com.razorpay.**

# Keep JSON serialization/deserialization (for reflection-based serialization)
-keep class com.google.gson.** { *; }
-keep class kotlinx.serialization.** { *; }

# Keep annotations (important for dependency injection and serialization)
-keepattributes *Annotation*

# Retain classes with native methods (JNI)
-keepclasseswithmembers class * {
    native <methods>;
}

# Prevent method inlining optimization (Reduces APK size but may slightly impact performance)
-optimizations !method/inlining/

# Keep essential Android methods that might be stripped
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}

# Keep Parcelable implementation (important for passing data between activities)
-keepclassmembers class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# Remove logging/debugging information in release mode
-assumenosideeffects class android.util.Log {
    public static *** v(...);
    public static *** d(...);
    public static *** i(...);
    public static *** w(...);
    public static *** e(...);
}

# Allow ProGuard to remove unused classes
-dontwarn io.flutter.embedding.**
-ignorewarnings



# Keep Flutter related classes
#-keep class io.flutter.app.** { *; }
#-keep class io.flutter.plugin.** { *; }
#-keep class io.flutter.util.** { *; }
#-keep class io.flutter.view.** { *; }
#-keep class io.flutter.** { *; }
#-keep class io.flutter.plugins.** { *; }

# Keep Firebase related classes
#-keep class com.google.firebase.** { *; }

# Keep all attributes for annotations
#-keepattributes *Annotation*

# Prevent warnings and keep Razorpay classes
#-dontwarn com.razorpay.**
#-keep class com.razorpay.** { *; }

# Prevent method inlining optimization
#-optimizations !method/inlining/

# Keep classes with specific payment methods (for Razorpay or similar)
#-keepclasseswithmembers class * {
#  public void onPayment*(...);
#}

# Prevent warnings related to Flutter embedding and ignore others
#-dontwarn io.flutter.embedding.**
#-ignorewarnings
