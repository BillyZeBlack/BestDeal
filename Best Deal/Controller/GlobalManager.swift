//
//  GlobalManager.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation

class GlobalManager: ObservableObject {
    
    @Published var discountManager = DiscountManager()
    @Published var productManager = ProductManager()
    @Published var categoryManager = CategoryManager()
    @Published var formatDatas = FormatDatas()
    
}
