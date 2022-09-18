# LaunchPad_RainCheck

# Selected prompt:
> iOS
> You're fed up with all the rain this winter, and you decide to write an app that alerts you when it is about to rain. You know that you could just check the weather, but it would be great if the app reminded you ahead of time. How would you build such an app? What are the biggest challenges you foresee when making this rain alert app?


**Technical:**
I would choose to build the app with SwiftUI as my primary UI framework, and Xcode/Swift for my development environment. For accessing the weather/rain forecast, I would access OpenWeatherMap's or tomorrow.io's REST API, and parse this data into a model. Utilizing a simple MVC architecture to display the data in views should work in this case.

For the notifications, I can use Apple's inherent APN system to send local/push notifications directly on the device.


**Design:**
While I understand that the app's sole purpose is to primarily remind you before rain occurs, some extra features must be included to make it a full-fledged app.

For my application, I would build it to include 3 main pages in a TabViewController at the root of the hierarchy: Dashboard, Calendar, Settings.

The Dashboard would display if it's raining today, and a simple rain forecast of the rest of the week.

The Calendar on the other hand, has a calendar view of the month with dots/indicators to depict the days that it's forecasted to rain on.

In Settings, the user can customize their app experience and the notifications to their liking. The main functionality goes on behind the scenes from these inputs. These inputs should be asked to the user on their initial onboarding as well to streamline the process.

**Product/Flow:**

This is where the brunt of the application's flow goes. In Settings, the user can configure when they want their notifications, and how many. Say the want one the night before it's going to rain, the day of in the morning, or an hour or two before it rains. 

Based on these settings, the app should run checks to the REST API in the background and assert whether it's going to rain and alert the user at the set intervals they've specified.

They should also get a notification if the rain forecast does not occur.

**Code Sample**

Simple project to check REST API and determine if it's raining or not. API Key omitted for privacy/safety reasons.
