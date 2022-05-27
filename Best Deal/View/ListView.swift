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
    @Binding var oneProductIsAdded: Bool
    
    var body: some View { // gérer la suppression d'un élément
        List{
            ForEach(productsList, id:\.id) {product in
                HStack{
                    Text("\(roundeUpToTwoDecimal(value: product.initialPrice))€ - \(roundeUpToTwoDecimal(value: product.discount))% ")
                    Spacer()
                    Text("\(roundeUpToTwoDecimal(value: product.finalPrice))€")
                    Image(systemName: "tag.fill")
                }
            }
        }.onChange(of: oneProductIsAdded) { _ in
            loadList()
        }
        
    }
    
    func loadList()
    {
        productsList = globalManager.productManager.productsList
        oneProductIsAdded = false
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
            ListView(productsList: [], oneProductIsAdded: .constant(false))
                .previewInterfaceOrientation(.portrait)
        }
    }
}
