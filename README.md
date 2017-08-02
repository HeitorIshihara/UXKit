# UXKit

UXKit is an animation framework. It contains a lot of easy to use animations to help you improve the user experience of your application.

## Requirements

* Xcode 8+
* Swift 3

## Getting Started

There are two ways to include UXKit in your project. If the first one doesn't work for you please try the other one.

### #1

-Open the .xcodeproj file
-Expand the Products group
-Right click on UXKit.framework and click Show in Finder
-Drag and Drop the UXKit.framework file into your project and add it to the Embedded Binaries of your main project and Build
-Import UXKit and done

### #2

-Drag and drop the UXKit project into your project
-Create a new workspace with both the framework and your project inside
-Go to your scheme settings at the Build tab
-Add the UXKit framework on top of your projects as a target
-Uncheck the Parallelize Build
