//
//  ContentView.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var globalManager = GlobalManager()
    let title = "Prix Initial"
    
    @State var finalPrice = 00.00
    @State var initialPrice = ""
//    var productsList:[Product]
    @State var validData = 00.00
    
    @State var discount = 0.0
    @State var initialPriceInDouble = 0.0

    var body: some View {
        let discounts: [Discount] = globalManager.discountManager.generateListDiscount()
        VStack{
            Text("Titre").font(.largeTitle)
            TextField(title, text: $initialPrice, prompt: Text("Prix initial"))

            //UICollectionView like
            ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 20){
                        ForEach(discounts, id:\.id) {discount in
                            DiscountView(discount: discount, globalManager: globalManager)
                                .onTapGesture {
                                    if discount.discountLabel == "..%"{
                                        //entrer une reduct perso
                                    }
                                    self.discount = formatDatas(dataInSting: discount.discountLabel)
                                    initialPriceInDouble = formatDatas(dataInSting: initialPrice)
                                    applyDiscountOnPrice(initialPrice: initialPriceInDouble, discount: self.discount)
                            }
                        }
                    }.padding(.all, 10)
            }.frame( height: 100)
            
            VStack{
                Text("\(finalPrice) €").font(.title3).padding()
                HStack{
                    Image(systemName: "cart.badge.plus")
                    Button("J'achète") {
                        //ajout des produit dans la liste
                        // test d'ajout
                        let product = Product(id: 13, name: "test", initialPrice: 12.45, finalPrice: 7.90, discount: 10.00)
                        let product1 = Product(id: 14, name: "test", initialPrice: 12.45, finalPrice: 3.00, discount: 10.00)
                        
                        addProductIntoProductsList(product: product)
                        addProductIntoProductsList(product: product1)
                    }
                }
            }
            
            HStack{
                Text("\(globalManager.productManager.totalChart()) €").padding()
                Image(systemName: "trash.circle.fill")
            }
            
            Spacer()
            
            VStack{
                ListView(globalManager: globalManager, productsList: $globalManager.productManager.productsList)
                HStack{
                    Text("Economie réalisée = ")
                    Text("-\(globalManager.productManager.totalDiscount()) €")
                    Image(systemName: "cart.fill").onTapGesture {
                        //Aller vers la liste des achats classés par catégories
                    }
                }
                
            }
        }
    }
    
    private func formatDatas(dataInSting: String) -> Double
    {
        var validData = 00.00
        guard let dataInDouble = globalManager.formatDatas.formatPrice(dataInString: dataInSting) else { return validData }
        
        validData = dataInDouble
        return validData
    }
    
    private func applyDiscountOnPrice(initialPrice: Double, discount: Double)
    {
        finalPrice = globalManager.productManager.applyDiscountOnInitialPrice(initialPrice: initialPrice, discount: discount)
    }
    
    private func addProductIntoProductsList(product: Product)
    {
        globalManager.productManager.addProductIntoProductsList(product: product)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
