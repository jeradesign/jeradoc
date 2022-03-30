# Unreal Cheat Sheet

## Basics

* Left-handed Z-up coordinate system (forward = +x, right = +y)
* Default units: centimeters


## Listen Server

## Packaging iOS Apps


Upload to App Store with Transporter app.

On iOS, you will need to create a Distribution Certificate and MobileProvision on Apple's developer website. Install the Distribution Certificate the same way as your Development certificate, and name your distribution provision with a "Distro_" prefix, next to your other one (so you would have both `Distro_MyProject.mobileprovision` and `MyProject.mobileprovision`).

----

I discovered this clue in the "Packaging Projects" page:

"On iOS, you will need to create a Distribution Certificate and MobileProvision on Apple's developer website. Install the Distribution Certificate the same way as your Development certificate, and name your distribution provision with a "Distro_" prefix, next to your other one (so you would have both `Distro_MyProject.mobileprovision` and `MyProject.mobileprovision`)."
[https://docs.unrealengine.com/4.26/en-US/Basics/Projects/Packaging/](https://docs.unrealengine.com/4.26/en-US/Basics/Projects/Packaging/)

So...
* I created a distribution profile called "Distro_AvatarChat.mobileprovision", to go along with the development profile "File:AvatarChat.mobileprovision" that I was already using.
* I switched the build configuration to "Shipping" from the Package Project / Build Configuration menu.
* Built successfully (via Package Project / iOS menu item).
* Tried to upload to App Store using Transporter.
* Transporter failed with the following message: 

ERROR ITMS-90161: "Invalid Provisioning Profile. The provisioning profile included in the bundle com.jera.AvatarChat [Payload/AvatarChat.app] is invalid. [Missing code-signing certificate]. A Distribution Provisioning profile should be used when submitting apps to the App Store. For more information, visit the iOS Developer Portal."

This leads me to believe it didn't use the deployment profile, like the documentation said it would. A quick check of the build logs backs up this suspicion.

----

## Memory Management

### Reference Counting
* `TSharedPtr<AActor>`
* Constructing increments reference count
* Destructing decrements reference count

### Garbage Collection
* All `UObject`s are automatically in the “set”
* Unreal starts from the “root set”
* Unreal walks all the `UProperty` pointer
* Any `UObject` not found can be deleted.
