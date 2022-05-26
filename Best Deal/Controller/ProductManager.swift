//
//  ProductManager.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation
import SwiftUI

class ProductManager: ObservableObject {
    
    @Published var productsList: [Product] = [
//        Product(id: 1, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 2, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 3, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 4, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 5, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 6, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 7, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 8, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 9, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 10, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 11, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00),
//        Product(id: 12, name: "pdt 1", initialPrice: 10.00, finalPrice: 5.0, discount: 50.00)
    ]
    
    func applyDiscountOnInitialPrice(initialPrice: Double, discount: Double)->Double
    {
        return (initialPrice * (1 - (discount/100)))
    }
    
    func addProductIntoProductsList(product: Product)
    {
//        objectWillChange.send()
        productsList.append(product)
    }
    
    func removeProductFromProductsList()->[Product]
    {
        return []
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
}
