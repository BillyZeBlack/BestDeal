//
//  ContentView.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    var globalManager = GlobalManager()
    let title = "Prix Initial"
    
    @State var finalPrice = 00.00
    @State var initialPrice = "70 €"
    @State var productsList:[Product] = []
    @State var validData = 00.00
    
    @State var discount = 0.0
    @State var initialPriceInDouble = 0.0

    var body: some View {
        
        let discounts: [Discount] = globalManager.discountManager.generateListDiscount()
        VStack{
            Text("Titre").font(.largeTitle)
            TextField(title, text: $initialPrice)

            //UICollectionView like
            ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 20){
                        ForEach(discounts, id:\.id) {discount in
                            DiscountView(discount: discount, globalManager: globalManager)
                                .onTapGesture {
                                    self.discount = formatDatas(dataInSting: discount.discoutLabel)
                                    initialPriceInDouble = formatDatas(dataInSting: initialPrice)
                                    applyDiscountOnPrice(initialPrice: initialPriceInDouble, discount: self.discount)
                            }
                        }
                    }.padding(.all, 10)
            }
            Text("Nouveau prix")
            Text("\(finalPrice)")
            
            Button("J'achète") {
            }
            List{
                ForEach(globalManager.productManager.productsList, id:\.id) {product in
                    HStack{
                        Text("\(product.name) - \(product.finalPrice)€")
                    }
                }
            }
        }
    }
    
    private func formatDatas(dataInSting: String) -> Double
    {
        var validData = 00.00
        guard let dataInDouble = globalManager.formatDatas.formatPrice(dataInString: dataInSting) else { return 00.00 }
        
        validData = dataInDouble
        return validData
    }
    
    private func applyDiscountOnPrice(initialPrice: Double, discount: Double)
    {
        finalPrice = globalManager.productManager.applyDiscountOnInitialPrice(initialPrice: initialPrice, discount: discount)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
