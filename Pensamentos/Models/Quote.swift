//
//  Quote.swift
//  Pensamentos
//
//  Created by School Picture Dev on 16/05/18.
//  Copyright © 2018 Joao Rocha. All rights reserved.
//

import Foundation

struct Quote: Codable {
    
    let quote: String
    let author: String
    let image: String
    
    var quoteFormatted: String {
        return " ‟" + quote + "” "
    }
    
    var authorFormatted: String {
        return  " - " + author
    }
    
}
