//
//  Webservice.swift
//  Currencies
//
//  Created by Дмитрий Кремлев on 24.07.2023.
//

import Foundation
import UIKit

class Webservice {
    
    static var currencies = [Currency]()
    static var multiplier = 1.0
    static var isCurrenciesFilled = false
    
    static func updateCurrencyValues() async throws {
        if currencies.isEmpty {
            currencies = Currency.createCurrencies()
        }
        try await loadRates()
        try await loadCurrencyImages()
        isCurrenciesFilled = true
    }
    
    private static func loadRates() async throws {
        let url = URL(string: Constants.Urls.getAllCurrencies(shortName: Constants.Currencies.Data[0].shortName))!
        
        if let (data, _) = try? await URLSession.shared.data(from: url) {
            if let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                for i in currencies.indices {
                    if let rates = dictionary["exchange_rates"] as? [String: Double] {
                        if let value = rates[currencies[i].shortName] {
                            currencies[i].value = value
                        }
                    }
                }
            }
        }
    }
    
    private static func loadCurrencyImages() async throws {
        for i in currencies.indices {
            let url = URL(string: Constants.Urls.getFlagImage(countryName: Constants.Currencies.Data[i].countryName))!
            
            if let image = UIImage(data: try! Data(contentsOf: url)) {
                currencies[i].image = image
            }
        }
    }
    
}
