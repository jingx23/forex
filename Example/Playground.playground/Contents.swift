//
//  Playground.playground
//  Forex
//
//  Copyright © 2018 Jan Scheithauer. All rights reserved.
//

//: Playground - noun: a place where people can play

import UIKit
import Forex
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//Specific exchange rate for a currency
Forex.shared.rate(value: 1.0, from: .EUR, to: .USD) { (exchange, error) in
    print("Name:\(exchange?.currency.description) Rate: \(exchange?.value)")
}

//Specific exchange rates for a currency
Forex.shared.rate(value: 1.0, from: .EUR, to: [.USD, .RUB]) { (exchanges, error) in
        for exchange in exchanges ?? [] {
            print("Name:\(exchange.currency.description) Rate: \(exchange.value)")
        }
}

//Exchange rate for a specific date
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "yyyy-MM-dd"
let exchangeDate = dateFormatter.date(from: "2000-01-03")

Forex.shared.rate(value: 1.0, date: exchangeDate, from: .EUR, to: .USD) { (exchange, error) in
    print("Name:\(exchange?.currency.description) Rate: \(exchange?.value)")
}

//Exchange rates for a specific date
Forex.shared.rate(value: 1.0, date: exchangeDate, from: .EUR, to: [.USD, .RUB]) { (exchanges, error) in
    for exchange in exchanges ?? [] {
        print("Name:\(exchange.currency.description) Rate: \(exchange.value)")
    }
}

