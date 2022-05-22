//
//  Porduct.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation

struct Product: Identifiable {
    var id: Int
    var name: String
    var initialPrice: Double
    var finalPrice: Double
    var discount: Double
}

