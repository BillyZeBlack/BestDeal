//
//  ProductManager.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation
import SwiftUI

class ProductManager: ObservableObject {
    
    @Published var productsList = [Product]()
    var oneProductIsAdded = false
    var listView : ListView!
    
    func applyDiscountOnInitialPrice(initialPrice: Double, discount: Double)->Double
    {
        return (initialPrice * (1 - (discount/100)))
    }
    
    func addProductIntoProductsList(product: Product)
    {
//        objectWillChange.send()
        productsList.append(product)
    }
    
    func removeProductFromProductsList(at offsets: IndexSet)
    {
//        objectWillChange.send()
        productsList.remove(atOffsets: offsets)
        oneProductIsAdded = true
        productsList = loadList()
    }
    
    func totalChart()->Double
    {
        var totalPrice = 0.00
        
        for item in productsList {
            totalPrice += item.finalPrice
        }
        
        return totalPrice
    }
    
    func totalDiscount()->Double
    {
        var totalDiscount = 0.00
        
        for item in productsList {
            totalDiscount += item.initialPrice - item.finalPrice
        }
        
        return totalDiscount
    }
    
    func loadList()->[Product]
    {
        oneProductIsAdded = false
        return productsList
    }
}
