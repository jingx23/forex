//
//  ViewController.swift
//  Example
//
//  Created by Jan Scheithauer on 04.02.18.
//  Copyright © 2018 Jan Scheithauer. All rights reserved.
//

import UIKit
import Forex

class ViewController: UIViewController {
    @IBOutlet weak var from: UILabel?
    @IBOutlet weak var to: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()
        let rate: NSDecimalNumber = 1.0
        let fromCurrency = Currency.EUR
        Forex.shared.rate(value: rate, from: fromCurrency, to: .USD) { [weak self](exchange, error) in
            if error != nil {
                print(error!.localizedDescription)
            } else {
                if let retrievedExchange = exchange {
                    DispatchQueue.main.async {
                        self?.from?.text = "\(rate) \(fromCurrency.rawValue)"
                        self?.to?.text = "\(retrievedExchange.value) \(retrievedExchange.currency.rawValue)"
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
