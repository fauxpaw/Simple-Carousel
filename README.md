![Logo of the project](https://raw.githubusercontent.com/jehna/readme-best-practices/master/sample-logo.png)

# Simple Carousel
> Because no thanks to presentation layers...

Do you need to present content in a rotating circular view? Not having much luck with animation paths and bezier curves? This is the project for you. Short. Sweet. Simple. Carousel.

## Installing / Getting started

Two simple ways to get started.
a) Get the completed project via your terminal by running
```shell
 git clone https://github.com/fauxpaw/Simple-Carousel
```

                      -- or --


```shell
Click the [Clone or download] button at the upper right corner
```

b) Copy the SimpleCarousel.swift file at the url below into your project

```shell
https://github.com/fauxpaw/Simple-Carousel/blob/master/SimpleCarouselView/SimpleCarousel.swift
```

## Using

To utilize the Simple Carousel, you will need an array of objects that are or inherit from UIView. Initialize an instance of the SimpleCarousel class with its custom initializer. See below for an explanation of the arguments in the initializer.

```shell
let myCarousel = SimpleCarousel(withCenterPoint: CGPoint(x: 100, y: 100), withRadius: 50, withDuration: 0.7, withResizing: true, withViews: [UIView1, UIView2...etc])
```
Afterwards use the instance method Animate(Clockwise: Bool) to move the views in the direction you wish.

```shell
let myCarousel.animate(clockwise: true)
```

## Customizable Features

Moving is great but what else can I do with this?
* You can change the animation time
* You can modify the size and location of the carousel via its center point and radius attributes.
* You can specify if and by how much views should change size when in and not in the foreground.

## Class initializer Arguments

#### withCenterPoint
Type: `CGPoint`  

Specifies the location of the center of the Carousel in terms of screen pixels.

Example:
```bash
let deviceScreenCenter: CGPoint = UIScreen.main.bounds
myCarousel.centerPoint = deviceScreenCenter                  #will set the carousel to the center of the screen.
```

#### withRadius
Type: `CGFloat`

Example:
```bash
let goodValue: CGFloat = deviceScreenCenter.width/2          #will place outermost views at edge of screen.
myCarousel.radius = goodValue
```

#### withDuration
Type: `CGFloat`

Example:
```bash
let oneSec: Double = 1.0                                    #will set each animations time to be 1 second.
myCarousel.animationTime = oneSec
```

#### withResizing
Type: `Bool`
Default: `True`

Example:
```bash
myCarousel.resizeViews = no                                #will keep the views scale static as they move
```

#### withViews
Type: `[UIView]`

Example:
```bash

let array = [UIImageView1, UIImageView2, UIImageView3...]                           #will set the current views to animate as the content of 'array'
myCarousel.objects = array
```

#### Additional Customization

For more options check the documentation provided in code comments via SimpleCarousel.swift.

## Contributing

If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome.

## Licensing

Copyright (c) <2017> Michael Sweeney

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
