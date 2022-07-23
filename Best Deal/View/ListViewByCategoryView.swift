//
//  ListViewByCategoryView.swift
//  Best Deal
//
//  Created by williams saadi on 17/07/2022.
//

import SwiftUI

struct ListViewByCategoryView: View {
    @State var globalManager : GlobalManager!
    @Binding var productList: [Product]
    
    @State var totalD = 0.0
    @State var totalN = 0.0
    @State var totalM = 0.0
    @State var totalMd = 0.0
    @State var totalE = 0.0
    @State var totalB = 0.0
    @State var totalMdc = 0.0
    @State var totalJm = 0.0
    @State var totalI = 0.0
    @State var totalT = 0.0
    @State var totalJv = 0.0
    @State var totalS = 0.0
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Group{
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Divers || item.category == nil){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Divers")
                        } footer: {
                            Text("Total : \(totalD)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Nourriture){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Nouriture")
                        } footer: {
                            Text("Total : \(totalN)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Multimédia){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Multimédia")
                        } footer: {
                            Text("Total : \(totalM)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Mode){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Mode")
                        } footer: {
                            Text("Total : \(totalMd)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Electroménager){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Electroménager")
                        } footer: {
                            Text("Total : \(totalE)")
                        }
                    }
                    Group{
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Bricolage){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Bricolage")
                        } footer: {
                            Text("Total : \(totalB)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Meuble_et_déco){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Meuble et déco.")
                        } footer: {
                            Text("Total : \(totalMdc)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Jardin_et_maison){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Jardin et maison")
                        } footer: {
                            Text("Total : \(totalJm)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Informatique){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Informatique")
                        } footer: {
                            Text("Total : \(totalI)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Téléphonie){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Téléphonie")
                        } footer: {
                            Text("Total : \(totalT)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Jeux_vidéo){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Jeux vidéo")
                        } footer: {
                            Text("Total : \(totalJv)")
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Sport){
                                    Text("\(item.finalPrice)€")
                                }
                            }
                        } header: {
                            Text("Sport")
                        } footer: {
                            Text("Total : \(totalS)")
                        }
                    }
                }
            }
        }
        
        .navigationTitle(Text("TITRE"))
        .onAppear {
            calculTotalSection(products: productList)
        }
    }
    
    private func getAllProducts()
    {
        productList = globalManager.productManager.productsList
    }
    
    private func calculTotalSection(products: [Product])
    {
        for item in products{
            switch item.category {
                case .Divers:
                        totalD += item.finalPrice
                case .Nourriture:
                        totalN += item.finalPrice
                case .Multimédia:
                        totalM += item.finalPrice
                case .Mode:
                        totalMd += item.finalPrice
                case .Electroménager:
                        totalE += item.finalPrice
                case .Bricolage:
                        totalB += item.finalPrice
                case .Meuble_et_déco:
                    totalMdc += item.finalPrice
                case .Jardin_et_maison:
                        totalJm += item.finalPrice
                case .Informatique:
                        totalI += item.finalPrice
                case .Téléphonie:
                        totalT += item.finalPrice
                case .Jeux_vidéo:
                        totalJv += item.finalPrice
                case .Sport:
                        totalS += item.finalPrice
                default:
                    totalD += item.finalPrice
            }
        }
    }
}

struct ListViewByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewByCategoryView(productList: .constant([Product(description: "test", initialPrice: 0.0, finalPrice: 0.0, discount: 0.0, category: nil)]))
            .previewDevice("iPhone 11")
    }
}
