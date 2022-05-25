//
//  ListView.swift
//  Best Deal
//
//  Created by williams saadi on 24/05/2022.
//

import SwiftUI

struct ListView: View {
    var globalManager: GlobalManager!
    
//    @Binding var productsList: [Product]
    @Binding var oneProductIsAdded: Bool
    
    var body: some View {
        List{
            ForEach(globalManager.productManager.productsList, id:\.id) {product in
                HStack{
                    Text("\(product.initialPrice) - \(product.discount)% ")
                    Spacer()
                    Text("\(product.finalPrice)€")
                    Image(systemName: "tag.fill")
                }
            }
        }.onChange(of: oneProductIsAdded) { _ in
            loadList()
        }
    }
    
    func loadList()
    {
//        productsList = globalManager.productManager.productsList
        globalManager.productManager.productsList
        oneProductIsAdded = false
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
//        productsList: .constant([]), 
            ListView(oneProductIsAdded: .constant(false))
                .previewInterfaceOrientation(.portrait)
//            ListView(productsList: .constant([]))
//                .previewLayout(.sizeThatFits)
//                .previewInterfaceOrientation(.portrait)
        }
    }
}
