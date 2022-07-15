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
    @State var initialPriceInDouble = 0.0
    @State var validData = 00.00
    @State var personalDiscount = ""
    @State var discount = 0.0
    @State var totalCart = 0.00
    @State var maximumAmount = ""
    @State var maximumAmountInDouble = 00.00
    
    @State var personalDiscountShowed = false
    @State var showAlert = false
    @State var maximumAmountSet = false
    @State var maximunAmountisHit = false
    
    @State var alertCase: AlertCase = .initialPriceIsEmpty

    var body: some View {
        let discounts: [Discount] = globalManager.discountManager.generateListDiscount()
        let oneProductIsAdded = globalManager.productManager.oneProductIsAdded
        VStack{
            Text("Titre").font(.largeTitle)
            VStack {
                TextField(title, text: $initialPrice, prompt: Text("Entrez le prix initial"))
                    .modifier(TextFieldClearButton(text: $initialPrice))
                    .keyboardType(.decimalPad)
                
                Rectangle()
                    .frame(height: 1)
            }.padding()
            
            if personalDiscountShowed {
                VStack{
                    TextField(title, text: $personalDiscount, prompt: Text("Entrez le %"))
                        .keyboardType(.decimalPad)
                        .modifier(TextFieldClearButton(text: $initialPrice))
                    Rectangle()
                        .frame(height: 1)
                    Button ("Valider"){
                        discount = formatDatas(dataInSting: personalDiscount)
                        initialPriceInDouble = formatDatas(dataInSting: initialPrice)
                        applyDiscountOnPrice(initialPrice: initialPriceInDouble, discount: discount)
                        withAnimation {
                            personalDiscountShowed.toggle()
                            personalDiscount = ""
                        }
                        hideKeyboard()
                    }
                }
                .padding()
                .transition(.slide)
                .frame(width: 180, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(.gray, lineWidth: 2)
                )
            } else {
                HStack{
                    //UICollectionView like
                    ScrollView(.horizontal, showsIndicators: false){
                            LazyHStack(spacing: 20){
                                ForEach(discounts, id:\.id) {item in
                                    DiscountView(discount: item, globalManager: globalManager)
                                        .onTapGesture {
                                            if item.discountLabel == "..%"{
                                                withAnimation {
                                                    personalDiscountShowed.toggle()
                                                }
                                            } else {
                                                self.discount = formatDatas(dataInSting: item.discountLabel)
                                                initialPriceInDouble = formatDatas(dataInSting: initialPrice)
                                                applyDiscountOnPrice(initialPrice: initialPriceInDouble, discount: self.discount)
                                            }
                                            hideKeyboard()
                                    }
                                }
                            }.padding(.all, 10)
                    }.frame( height: 100)
                }.transition(.slide)
            }
             
            VStack{
                if initialPrice == "" || finalPrice == 0.0 && initialPrice == "" {
                    Text("Nouveau Prix").font(.title3).padding()
                } else {
                    if discount == 0 {
                        Text("\(initialPrice)€").font(.title3).padding()
                    }else {
                        Text("\(roundeUpToTwoDecimal(value: finalPrice))€").font(.title3).padding()
                    }
                   
                }
                
                HStack{
                    Image(systemName: "cart.badge.plus")
                    Button("J'ACHETE") {
                        hideKeyboard()
                        if  initialPrice != ""{
                            if(addProductIntoProductsList()){
                                initialaseDatas()
                            }
                        } else {
                            showAlert = true
                            alertCase = .initialPriceIsEmpty
                        }
                    }
                }.alert(isPresented: $showAlert ) {
                    switch alertCase {
                    case .initialPriceIsNotValid:
                        return Alert(title: Text("Erreur"), message: Text("Veuillez vérifier le prix saisi."))
                    case .initialPriceIsEmpty:
                        return Alert(title: Text("Information"), message: Text("Veuillez saisir un prix de départ."))
                    }
                }
            }
            
            HStack{
                if totalCart == 0.00{
                    Text("Total des achats").padding()
                }else {
                    HStack{
                        if maximunAmountisHit {
                            Text("\(roundeUpToTwoDecimal(value: totalCart)) €")
                                .font(.headline).bold().foregroundColor(.red)
                                .padding()
                        } else {
                            Text("\(roundeUpToTwoDecimal(value: totalCart)) €")
                                .font(.headline).bold()
                                .padding()
                        }
                        Image(systemName: "trash.circle.fill")
                            .onTapGesture {
                            //Supprimer l'ensemble de la liste & l'emplacement de la corbeille
                        }
                    }
                }
                Image(systemName: "thermometer")
                    .onTapGesture {
                        withAnimation {
                            maximumAmountSet.toggle()
                        }
                    }
                if maximumAmountSet {
                    VStack{
                        TextField(title, text: $maximumAmount, prompt: Text("Budget max !"))
                            .keyboardType(.decimalPad)
                            .modifier(TextFieldClearButton(text: $maximumAmount))
                        Rectangle()
                            .frame(height: 1)
                        Button ("Valider"){
                            maximumAmountInDouble = formatDatas(dataInSting: maximumAmount)
                            withAnimation {
                                maximumAmountSet.toggle()
                            }
                            hideKeyboard()
                        }
                    }
                    .padding()
                    .transition(.slide)
                    .frame(width: 180, height: 100)
                    .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(.gray, lineWidth: 2)
                    )
                }
            }
            
            Spacer()
            
            VStack{
                ListView(globalManager: globalManager, productsList: globalManager.productManager.productsList, oneProductIsAdded: oneProductIsAdded).listRowBackground(Color.white)//$oneProductIsAdded
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
    
    private func addProductIntoProductsList()->Bool
    {
        initialPriceInDouble = formatDatas(dataInSting: initialPrice)
        if initialPriceInDouble != 00.00 {
            
            applyDiscountOnPrice(initialPrice: initialPriceInDouble, discount: discount)
            
            let product = Product(description: "test", initialPrice: initialPriceInDouble, finalPrice: finalPrice, discount: discount)
            
            globalManager.productManager.addProductIntoProductsList(product: product)
            
            totalCart = globalManager.productManager.totalChart()
            maximunAmountisHit = checkIfMaxAmountIsHit()
            showAlert = false
            return true
        }else {
            showAlert = true
            alertCase = .initialPriceIsNotValid
            return false
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
    
    private func initialaseDatas()
    {   
        globalManager.productManager.oneProductIsAdded.toggle()
        initialPrice = ""
        finalPrice = 0.00
        discount = 0.00
        initialPriceInDouble = 0.00
        showAlert = false
    }
    
    private func checkIfMaxAmountIsHit()->Bool
    {
        if maximumAmountInDouble != 0.0 {
            if totalCart >= maximumAmountInDouble {
                // une animation pour signaler que le budget max a été ateint
                return true
            }
        }
        return false
    }
}

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
    }
}
