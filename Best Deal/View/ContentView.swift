//
//  ContentView.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @StateObject var globalManager = GlobalManager()
    let title = "Prix Initial"
    
    @State var finalPrice = 00.00
    @State var initialPrice = ""
    @State var validData = 00.00
    
    @State var discount = 0.0
    @State var initialPriceInDouble = 0.0
    
    @State var oneProductIsAdded = false
    @State var totalCart = 0.00

    var body: some View {
        let discounts: [Discount] = globalManager.discountManager.generateListDiscount()
        VStack{
            Text("Titre").font(.largeTitle)
            VStack {
                TextField(title, text: $initialPrice, prompt: Text("Entrez le prix initial"))
                    .keyboardType(.numberPad)
                     //gérer la suppression
                Rectangle()
                    .frame(height: 1)
            }.padding()
            
            

            //UICollectionView like
            ScrollView(.horizontal, showsIndicators: false){
                    LazyHStack(spacing: 20){
                        ForEach(discounts, id:\.id) {discount in
                            DiscountView(discount: discount, globalManager: globalManager)
                                .onTapGesture {
                                    if discount.discountLabel == "..%"{
                                        //entrer une reduct perso
                                    } else {
                                        self.discount = formatDatas(dataInSting: discount.discountLabel)
                                        initialPriceInDouble = formatDatas(dataInSting: initialPrice)
                                        applyDiscountOnPrice(initialPrice: initialPriceInDouble, discount: self.discount)
                                    }
                                    hideKeyboard()
                            }
                        }
                    }.padding(.all, 10)
            }.frame( height: 100)
            
            VStack{
                if finalPrice == 0.0 && initialPrice == "" {
                    Text("Nouveau Prix").font(.title3).padding()
                }else {
                    Text("\(roundeUpToTwoDecimal(value: finalPrice))€").font(.title3).padding()
                }
                
                HStack{
                    Image(systemName: "cart.badge.plus")
                    Button("J'ACHETE") {
                        hideKeyboard()
                        if discount == 0.00 && initialPrice != ""{
                            initialPriceInDouble = formatDatas(dataInSting: initialPrice)
                            applyDiscountOnPrice(initialPrice: initialPriceInDouble, discount: discount)
                        }
                        
                        let product = Product(description: "test", initialPrice: initialPriceInDouble, finalPrice: finalPrice, discount: discount)
                        
                        addProductIntoProductsList(product: product)
                        totalCart = globalManager.productManager.totalChart()
                        oneProductIsAdded.toggle()
                        initialPrice = ""
                        finalPrice = 0.00
                        discount = 0.00
                    }
                }
            }
            
            HStack{
                if totalCart == 0.00{
                    Text("Total des achats").padding()
                }else {
                    Text("\(roundeUpToTwoDecimal(value: totalCart)) €").padding()
                    Image(systemName: "trash.circle.fill").onTapGesture {
                        //Supprimer l'ensemble de la liste & l'emplacement de la corbeille
                    }
                }
                
            }
            
            Spacer()
            
            VStack{
                ListView(globalManager: globalManager, productsList: globalManager.productManager.productsList, oneProductIsAdded: $oneProductIsAdded)
                HStack{
                    if 0 == globalManager.productManager.totalDiscount() {
                        Text("Economies réalisées")
                    }
                    
                    Text("\(roundeUpToTwoDecimal(value: globalManager.productManager.totalDiscount())) €")
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

//struct CustomScrollView: View{
//    var globalManager: GlobalManager!
//    let discounts: [Discount] = globalManager.discountManager.generateListDiscount()
//    var body: some View {
//        ScrollView(.horizontal, showsIndicators: false){
//                LazyHStack(spacing: 20){
//                    ForEach(discounts, id:\.id) {discount in
//                        DiscountView(discount: discount, globalManager: globalManager)
//                            .onTapGesture {
//                                if discount.discountLabel == "..%"{
//                                    //entrer une reduct perso
//                                }
//                                self.discount = formatDatas(dataInSting: discount.discountLabel)
//                                initialPriceInDouble = formatDatas(dataInSting: initialPrice)
//                                applyDiscountOnPrice(initialPrice: initialPriceInDouble, discount: self.discount)
//                        }
//                    }
//                }.padding(.all, 10)
//        }.frame( height: 100)
//    }
//}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
