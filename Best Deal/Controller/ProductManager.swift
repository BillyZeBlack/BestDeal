//
//  ProductManager.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation
import SwiftUI

class ProductManager {
    
    var productsList: [Product] = []
    
    func applyDiscountOnInitialPrice(initialPrice: Double, discount: Double)->Double
    {
        return (initialPrice * (1 - (discount/100)))
    }
    
    func addProductIntoProductsList(product: Product)
    {
        productsList.append(product)
    }
    
    func removeProductFromProductsList()->[Product]
    {
        return []
    }
    
    func totalChart(products: [Product])->Double
    {
        var totalPrice = 0.00
        
        for item in products {
            totalPrice += item.finalPrice
        }
        return totalPrice
    }
    
    
}
