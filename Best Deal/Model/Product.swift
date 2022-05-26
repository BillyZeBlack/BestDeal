//
//  Porduct.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation

class Product: Identifiable {
    var id = UUID()
    var description: String?
    var initialPrice: Double
    var finalPrice: Double
    var discount: Double
    
    init(description: String?, initialPrice: Double, finalPrice: Double, discount: Double) {
        self.description = description
        self.initialPrice = initialPrice
        self.finalPrice = finalPrice
        self.discount = discount
    }
}

