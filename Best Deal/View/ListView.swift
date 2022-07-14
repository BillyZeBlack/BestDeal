//
//  ListView.swift
//  Best Deal
//
//  Created by williams saadi on 24/05/2022.
//

import SwiftUI

struct ListView: View {
    var globalManager: GlobalManager!
    
    @State var productsList: [Product]
    
    @State var oneProductIsAdded: Bool
    
    var body: some View { // gérer la suppression d'un élément //////
        List{
            ForEach(productsList, id:\.id) {product in
                HStack{
                    Text("\(roundeUpToTwoDecimal(value: product.initialPrice))€ - \(roundeUpToTwoDecimal(value: product.discount))% ")
                    Spacer()
                    Text("\(roundeUpToTwoDecimal(value: product.finalPrice))€")
                    Image(systemName: "tag.fill")
                }
            }.onDelete(perform: globalManager.productManager.removeProductFromProductsList)
        }.onChange(of: globalManager.productManager.oneProductIsAdded) { _ in
            productsList = globalManager.productManager.loadList()
            }
    }
    
    private func roundeUpToTwoDecimal(value: Double)->String
    {
        var valueRounded = ""
        
        if value == 0.00 {
            valueRounded = "0.00"
        }else {
            valueRounded = String(format: "%.2f", value)
        }
        
        return valueRounded
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView(productsList: [], oneProductIsAdded: false)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
