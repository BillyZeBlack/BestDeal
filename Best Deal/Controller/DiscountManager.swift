//
//  DiscountManager.swift
//  Best Deal
//
//  Created by williams saadi on 22/05/2022.
//

import Foundation

class DiscountManager {
    
    var discountsLabel: [Discount] = []
    
    func generateListDiscount()->[Discount]
    {
        var index = 0
        discountsLabel.append(Discount(id: index, discountLabel: "..%"))
        for i in 5...95 {
            if i%5 == 0{
                index += 1
                discountsLabel.append(Discount(id: index, discountLabel: "\(i)%"))
                
            }
        }
        discountsLabel.append(Discount(id: index, discountLabel: "..%"))
        
        return discountsLabel
    }
}
