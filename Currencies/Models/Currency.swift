//
//  Currency.swift
//  Currencies
//
//  Created by Дмитрий Кремлев on 24.07.2023.
//

import Foundation
import UIKit

struct Currency {
    var shortName: String
    var fullName: String

    var value: Double
    var image: UIImage? = nil
    
    
    static func createCurrencies() -> [Currency] {
        var currencies: [Currency] = []
        for data in Constants.Currencies.Data {
            currencies.append(Currency(shortName: data.shortName, fullName: data.fullName, value: 1.0))
        }
                
        return currencies
    }
}
