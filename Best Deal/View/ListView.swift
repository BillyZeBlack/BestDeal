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
    
    @Binding var totalCart: Double
    @Binding var maximunAmountisHit: Bool
    @Binding var maximumAmountInDouble: Double
        
    var body: some View {
        // gérer la mise à jour du "total" lors de la suppression //////
        List{
            ForEach(productsList.indices, id:\.self) {product in
                HStack{
                    Text("\(roundeUpToTwoDecimal(value: productsList[product].initialPrice))€ - \(roundeUpToTwoDecimal(value: productsList[product].discount))% ")
                    Spacer()
                    Text("\(roundeUpToTwoDecimal(value: productsList[product].finalPrice))€")
                    Image(systemName: "tag.fill")
                }.swipeActions(allowsFullSwipe: false) {
                    Button(role: .destructive) {
                        productsList.remove(at: product)
                        globalManager.productManager.updateList(itemsList: productsList)
                        totalCart = globalManager.productManager.totalChart()
                        checkMaxAmount(totalCart: totalCart, maximumAmountInDouble: maximumAmountInDouble, maximunAmountisHit: maximunAmountisHit)
                     } label: {
                         Label("Delete", systemImage: "trash.fill")
                     }
                }
            }
        }.onChange(of: globalManager.productManager.oneProductIsAdded ) { _ in
                        productsList = globalManager.productManager.loadList()}
    }
    
    // MARK: privates function
    
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
    
    private func remove(indexSet: IndexSet)
    {
        globalManager.productManager.removeProductFromProductsList(at: indexSet)
    }
    
    private func checkMaxAmount(totalCart: Double, maximumAmountInDouble: Double, maximunAmountisHit: Bool)
    {
        if totalCart >= maximumAmountInDouble {
            self.maximunAmountisHit = true
        } else {
            self.maximunAmountisHit = false
        }
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView(productsList: [], oneProductIsAdded: false, totalCart: .constant(0.0), maximunAmountisHit: .constant(false), maximumAmountInDouble: .constant(0.0))
                .previewInterfaceOrientation(.portrait)
        }
    }
}
