# Forex

<p align="left">
<a href="https://travis-ci.org/jingx23/forex"><img src="https://travis-ci.org/jingx23/forex.svg?branch=master" alt="Build status" /></a>
<img src="https://img.shields.io/badge/platform-iOS-blue.svg?style=flat" alt="Platform iOS" />
<a href="https://developer.apple.com/swift"><img src="https://img.shields.io/badge/swift4-compatible-4BC51D.svg?style=flat" alt="Swift 4 compatible" /></a>
<a href="https://github.com/Carthage/Carthage"><img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" alt="Carthage compatible" /></a>
<a href="https://cocoapods.org/pods/XLActionController"><img src="https://img.shields.io/cocoapods/v/Forex.svg" alt="CocoaPods compatible" /></a>
<a href="https://raw.githubusercontent.com/jingx23/Forex/master/LICENSE"><img src="http://img.shields.io/badge/license-MIT-blue.svg?style=flat" alt="License: MIT" /></a>
</p>

By [Jan Scheithauer](http://jingx23.com).

## Introduction

Foreign exchange rates and currency conversion framework. Small swift wrapper around [Fixer](http://fixer.io/)

## Usage

```swift
import Forex
//Specific exchange rate for a currency
Forex.shared.rate(value: 1.0, from: .EUR, to: .USD) { (exchange, error) in
    print("Name:\(exchange?.currency.description) Rate: \(exchange?.value)")
}

Forex.shared.rate(value: 1.0, from: .EUR, to: [.USD, .RUB]) { (exchanges, error) in
        for exchange in exchanges ?? [] {
            print("Name:\(exchange.currency.description) Rate: \(exchange.value)")
        }
}

//Same goes with date option
//Exchange rate for a specific date
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let exchangeDate = dateFormatter.date(from: "2000-01-03")

Forex.shared.rate(value: 1.0, date: exchangeDate, from: .EUR, to: .USD) { (exchange, error) in
    print("Name:\(exchange?.currency.description) Rate: \(exchange?.value)")
}

```

## Getting involved

* If you **want to contribute** please feel free to **submit pull requests**.
* If you **have a feature request** please **open an issue**.
* If you **found a bug** or **need help** please **check older issues before submitting an issue**.

Before contribute check the [CONTRIBUTING](https://github.com/jingx23/forex/blob/master/.github/CONTRIBUTING.md) file for more info.

If you use **Forex** in your app We would love to hear about it! Drop us a line on [Twitter](https://twitter.com/jingx23).

## Examples

Follow these 3 steps to run Example project: clone Forex repository, open Forex workspace and run the *Example* project.

You can also experiment and learn with the *Forex Playground* which is contained in *Forex.workspace*.

## Installation

### CocoaPods

[CocoaPods](https://cocoapods.org/) is a dependency manager for Cocoa projects.

To install Forex, simply add the following line to your Podfile:

```ruby
pod 'Forex', '~> 1.0'
```

## Author

* [Jan Scheithauer](https://github.com/jingx23) ([@jingx23](https://twitter.com/jingx23))

# Changelog

See [CHANGELOG](CHANGELOG.md).
