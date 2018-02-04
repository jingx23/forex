//
//  CurrencyCodes.swift
//  Forex
//
//  Created by Jan Scheithauer on 04.02.18.
//  Copyright © 2018 Jan Scheithauer. All rights reserved.
//

public enum Currency: String, CustomStringConvertible {
    
    case AUD
    case BGN
    case BRL
    case CAD
    case CHF
    case CNY
    case CZK
    case DKK
    case EUR
    case GBP
    case HKD
    case HRK
    case HUF
    case IDR
    case ILS
    case INR
    case JPY
    case KRW
    case MXN
    case MYR
    case NOK
    case NZD
    case PHP
    case PLN
    case RON
    case RUB
    case SEK
    case SGD
    case THB
    case TRY
    case USD
    case ZAR
    
    public var description: String {
        switch self {
        case .AUD:
            return "Australia Dollar"
        case .BGN:
            return "Bulgaria Lev"
        case .BRL:
            return "Brazil Real"
        case .CAD:
            return "Canada Dollar"
        case .CHF:
            return "Switzerland Franc"
        case .CNY:
            return "China Yuan Renminbi"
        case .CZK:
            return "Czech Republic Koruna"
        case .DKK:
            return "Denmark Krone"
        case .EUR:
            return "Euro Member Countries"
        case .GBP:
            return "United Kingdom Pound"
        case .HKD:
            return "Hong Kong Dollar"
        case .HRK:
            return "Croatia Kuna"
        case .HUF:
            return "Hungary Forint"
        case .IDR:
            return "Indonesia Rupiah"
        case .ILS:
            return "Israel Shekel"
        case .INR:
            return "India Rupee"
        case .JPY:
            return "Japan Yen"
        case .KRW:
            return "Korea (South) Won"
        case .MXN:
            return "Mexico Peso"
        case .MYR:
            return "Malaysia Ringgit"
        case .NOK:
            return "Norway Krone"
        case .NZD:
            return "New Zealand Dollar"
        case .PHP:
            return "Philippines Peso"
        case .PLN:
            return "Poland Zloty"
        case .RON:
            return "Romania Leu"
        case .RUB:
            return "Russia Ruble"
        case .SEK:
            return "Sweden Krona"
        case .SGD:
            return "Singapore Dollar"
        case .THB:
            return "Thailand Baht"
        case .TRY:
            return "Turkey Lira"
        case .USD:
            return "United States Dollar"
        case .ZAR:
            return "South Africa Rand"
        }
    }

}
