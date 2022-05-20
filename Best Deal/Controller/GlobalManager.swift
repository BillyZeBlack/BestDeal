//
//  GlobalManager.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation

class GlobalManager: ObservableObject {
    @Published var discountsLabel: [String] = []
    @Published var productManager = ProductManager()
    @Published var categoryManager = CategoryManager()
    @Published var formatDatas = FormatDatas()
    
    func generateListDiscount()->[String]
    {
        for i in 5...95 {
            if i%5 == 0{
                discountsLabel.append("\(i)%")
            }
        }
        return discountsLabel
    }
}
