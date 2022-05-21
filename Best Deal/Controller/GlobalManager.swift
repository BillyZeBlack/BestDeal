//
//  GlobalManager.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation

class GlobalManager: ObservableObject {
    @Published var discountsLabel: [Discount] = []
    @Published var productManager = ProductManager()
    @Published var categoryManager = CategoryManager()
    @Published var formatDatas = FormatDatas()
    
    func generateListDiscount()->[Discount]
    {
        var index = 0
        for i in 5...95 {
            if i%5 == 0{
                discountsLabel.append(Discount(id: index, discoutLabel: "\(i)%"))
                index += 1
            }
        }
        return discountsLabel
    }
}
