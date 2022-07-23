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
    
    @State var oneProductIsAdded: Bool
    @Binding var totalCart: Double
    @Binding var maximunAmountisHit: Bool
    @Binding var maximumAmountInDouble: Double
    @State var isRowSelected = false
    @State var rowSelected: Int
    
    var body: some View {
        VStack{
            if !isRowSelected {
                List{
                    ForEach(productsList.indices, id:\.self) {product in
                        HStack{
                            Text("\(roundeUpToTwoDecimal(value: productsList[product].initialPrice))€ - \(roundeUpToTwoDecimal(value: productsList[product].discount))% ")
                            Spacer()
                            Text("\(roundeUpToTwoDecimal(value: productsList[product].finalPrice))€")
                            Image(systemName: "tag.fill")
                        }.onTapGesture {
                            rowSelected = product
                            withAnimation{
                                isRowSelected = true
                            }
                        }
                        .swipeActions(allowsFullSwipe: false) {
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
                        productsList = globalManager.productManager.loadList()
                    }
            } else {
                VStack{
                    List{
                        ForEach(CategoryEnum.allValues, id:\.self){item in //globalManager.categoryManager.namesList
                            HStack{
                                Text("\(item.rawValue)")
                            }.onTapGesture {
                                addCategoryToProduct(category: item)
                                withAnimation{
                                    isRowSelected.toggle()
                                }
                            }
                        }
                    }
                    Button("OK"){
                        withAnimation{
                            isRowSelected.toggle()
                        }
                    }
                }.padding()
                .transition(.scale)
                .overlay(RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 4))
            }
        }
        
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
        if maximumAmountInDouble > 0 {
            if totalCart >= maximumAmountInDouble {
                self.maximunAmountisHit = true
            } else {
                self.maximunAmountisHit = false
            }
        }
    }
    
    private func addCategoryToProduct(category: CategoryEnum)
    {
        productsList[rowSelected].category = category
    }

}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ListView(productsList: .constant([Product(description: "test", initialPrice: 0.0, finalPrice: 0.0, discount: 0.0, category: nil)]),oneProductIsAdded: false, totalCart: .constant(0.0), maximunAmountisHit: .constant(false), maximumAmountInDouble: .constant(0.0), rowSelected: 0)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
