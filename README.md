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
Click the [Clone or download] button in the upper right corner
```

b) Copy the SimpleCarousel.swift file at the url below into your project

```shell
https://github.com/fauxpaw/Simple-Carousel/blob/master/SimpleCarouselView/SimpleCarousel.swift
```

## Using

To utilize the Simple Carousel, initialize an instance of the SimpleCarousel class with its custom initializer.

```shell
let myCarousel = SimpleCarousel(withCenterPoint: CGPoint(x: 100, y: 100), withRadius: 50, withDuration: 0.7, withResizing: true, withViews: [UIView1, UIView2...etc])
```
Afterwards use the instance method Animate(Clockwise: Bool) to move the views in the direction you wish.

```shell
let myCarousel.animate(Clockwise: true)
```

## Customizable Features

What's all the bells and whistles this project can perform?
* What's the main functionality
* You can also do another thing
* If you get really randy, you can even do this

## Configuration

Here you should write what are all of the configurations a user can enter when
using the project.

#### Argument 1
Type: `String`  
Default: `'default value'`

State what an argument does and how you can use it. If needed, you can provide
an example below.

Example:
```bash
awesome-project "Some other value"  # Prints "You're nailing this readme!"
```

#### Argument 2
Type: `Number|Boolean`  
Default: 100

Copy-paste as many of these as you need.

## Contributing

When you publish something open source, one of the greatest motivations is that
anyone can just jump in and start contributing to your project.

These paragraphs are meant to welcome those kind souls to feel that they are
needed. You should state something like:

"If you'd like to contribute, please fork the repository and use a feature
branch. Pull requests are warmly welcome."

If there's anything else the developer needs to know (e.g. the code style
guide), you should link it here. If there's a lot of things to take into
consideration, it is common to separate this section to its own file called
`CONTRIBUTING.md` (or similar). If so, you should say that it exists here.

## Licensing

Copyright (c) <2017> <Michael Sweeney>

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
