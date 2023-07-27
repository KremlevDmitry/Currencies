//
//  Constance.swift
//  Currencies
//
//  Created by Дмитрий Кремлев on 24.07.2023.
//

import Foundation

enum Constants {
    enum Urls {
        private static let mainAPI = "https://exchange-rates.abstractapi.com/v1/live/"
        private static let primaryKey = "759eb00ffdb9476cac13461e4d3ca821"
        static func getAllCurrencies(shortName: String) -> String {
            "\(mainAPI)?api_key=\(primaryKey)&base=\(shortName)"
        }
        
        static func getFlagImage(countryName: String) -> String {
            "https://flagcdn.com/128x96/\(countryName).png"
        }
    }
    
    enum Currencies {
        static let Data: [(shortName: String, fullName: String, countryName: String)] = [
            ("USD", "US dollar", "us"),
            ("EUR", "Euro", "eu"),
            ("RUB", "Russian ruble", "ru"),
            ("JPY", "Japanese yen", "jp"),
            ("GBP", "The pound sterling", "gb"),
            ("AUD", "Australian dollar", "au"),
            ("CAD", "Canadian dollar", "ca"),
            ("CHF", "Swiss franc", "ch"),
            ("HKD", "Hong Kong dollar", "hk"),
            ("NZD", "New Zealand dollar", "nz")
        ]
    }
}
