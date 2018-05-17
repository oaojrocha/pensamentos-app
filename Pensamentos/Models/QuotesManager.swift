//
//  QuotesManager.swift
//  Pensamentos
//
//  Created by School Picture Dev on 16/05/18.
//  Copyright © 2018 Joao Rocha. All rights reserved.
//

import Foundation

class QuotesManager {
    
    let quotes: [Quote]
    
    init() {
        let fileURL = Bundle.main.url(forResource: "quotes", withExtension: "json")!
        let jsonData = try! Data.init(contentsOf: fileURL)
        let jsonDecoder = JSONDecoder()
        quotes = try! jsonDecoder.decode([Quote].self, from: jsonData)
        
    }
    
    func getRandomQuote() -> Quote {
        let index = Int(arc4random_uniform(UInt32(quotes.count)))
        return quotes[index]
    }
    
}
