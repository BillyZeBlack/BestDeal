//
//  ListView.swift
//  Best Deal
//
//  Created by williams saadi on 24/05/2022.
//

import SwiftUI

struct ListView: View {
    var globalManager: GlobalManager!
    @Binding var productsList: [Product]
    var body: some View {
        List{
//            globalManager.productManager.productsList
            ForEach(productsList, id:\.id) {product in
                HStack{
                    Text("\(product.name) - \(product.discount)% ")
                    Spacer()
                    Text("\(product.finalPrice)€")
                    Image(systemName: "tag.fill")
                }
            }
        }.refreshable{
            loadList()
        }
    }
    
    func loadList()
    {
        productsList = globalManager.productManager.productsList
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(productsList: .constant([]))
    }
}
