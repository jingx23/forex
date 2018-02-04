//
//  Forex.swift
//  Forex
//
//  Created by Jan Scheithauer on 04.02.18.
//  Copyright © 2018 Jan Scheithauer. All rights reserved.
//

import Foundation

public enum ForexError: Error {
    case noExchangeRatesFound
    case otherError(localizedDescription: String)
}

extension ForexError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .noExchangeRatesFound:
            return NSLocalizedString("No exchange rates could be found.", comment: "")
        case .otherError(let localizedDescription):
            return localizedDescription
        }
    }
}

public struct Exchange {
    public private(set) var value: NSDecimalNumber
    public private(set) var currency: Currency
}

open class Forex: NSObject {
    public static let shared = Forex()
    
    private let fixerDateFormatter = DateFormatter()
    
    private override init() {
        fixerDateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    public func rate(value: NSDecimalNumber, date: Date? = nil, from: Currency, to: Currency, completition:@escaping (Exchange?, ForexError?) -> Void) {
        rate(value: value, date: date, from: from, to: [to]) { (exchanges, error) in
            if error == nil {
                completition(exchanges?.first, nil)
            } else {
                completition(nil, error)
            }
        }
    }
    
    public func rate(value: NSDecimalNumber, date: Date? = nil, from: Currency, to: [Currency], completition:@escaping ([Exchange]?, ForexError?) -> Void) {
        callFixer(date: date, base: from, symbols: to, completition: { (dict, error) in
            if error == nil {
                var exchanges = [Exchange]()
                guard let rates = dict?.value(forKey: "rates") as? NSDictionary else {
                    completition([], ForexError.noExchangeRatesFound)
                    return
                }
                for key in rates.allKeys as! [String] {
                    let rate = NSDecimalNumber(decimal: (rates.value(forKey: key) as! NSNumber).decimalValue)
                    let exchange = Exchange(value: value.multiplying(by: rate), currency: Currency(rawValue: key)!)
                    exchanges.append(exchange)
                }
                completition(exchanges, nil)
            } else {
                completition([], ForexError.otherError(localizedDescription: error!.localizedDescription))
            }
        })
    }
    
    private func callFixer(date: Date? = nil, base: Currency, symbols: [Currency], completition:@escaping (NSDictionary?, ForexError?) -> Void) {
        var exchangeDate = "latest"
        if let date = date {
            exchangeDate = fixerDateFormatter.string(from: date)
        }
        
        URLSession.shared.dataTask(with: URL(string: "https://api.fixer.io/\(exchangeDate)?base=\(base.rawValue)&symbols=\(symbols.map {$0.rawValue}.joined(separator: ","))")!, completionHandler: {(data, _, error) -> Void in
            if error == nil {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! NSDictionary {
                    completition(jsonObj, nil)
                } else {
                    completition(nil, ForexError.otherError(localizedDescription: error!.localizedDescription))
                }
            }
        }).resume()
    }
}
