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
    
    var totalCart = 0.0
    
    func applyDiscountOnInitialPrice(initialPrice: Double, discount: Double)->Double
    {
        return (initialPrice * (1 - (discount/100)))
    }
    
    func addProductIntoProductsList(product: Product)
    {
        productsList.append(product)
    }
    
    func removeProductFromProductsList(at offsets: IndexSet)
    {
        productsList.remove(atOffsets: offsets)
        oneProductIsAdded = true
        productsList = loadList()
    }
    
    func totalChart()->Double
    {
        totalCart = 0.00
        for item in productsList {
            totalCart += item.finalPrice
        }
        
        return totalCart
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
        print("nombre d\'élément : \(productsList.count)")
        return productsList
    }
    
    func updateList(itemsList: [Product])
    {
        productsList = itemsList
        totalCart = totalChart()
        print("nombre d\'élément : \(productsList.count)")
    }
    
    func sortProductByCategory()
    {
        
    }
}
