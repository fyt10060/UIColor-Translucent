# UIColor-Translucent
An extension to generate the same color with the navigation bar's translucent color

## What's this extension work for?

When we set a color to the navigationbar's barTintColor, the navigation will light it and show a different color on screen. Use this extension you can simply get the modified color that is shown on the navigation bar.

## How to use
Copy this file into your project and it's over...

```swift

let newColor = yourColor.getTranslucentColor()
// Or if you know the RGB values of your color
let newColor = getTranslucentColor(R: 255, G: 255, B: 255)

```