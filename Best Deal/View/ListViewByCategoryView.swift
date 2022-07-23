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
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Divers")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalD)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Nourriture){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Nouriture")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalN)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Multimédia){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Multimédia")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalM)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Mode){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Mode")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalMd)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Electromenager){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Electroménager")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalE)) €")
                            }
                        }
                    }
                    Group{
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Bricolage){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Bricolage")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalB)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Meuble_et_deco){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Meuble et déco.")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalMdc)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Jardin_et_maison){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Jardin et maison")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalJm)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Informatique){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Informatique")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalI)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Telephonie){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Téléphonie")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalT)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Jeux_vidéo){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Jeux vidéo")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalJv)) €")
                            }
                        }
                        Section {
                            ForEach(productList){item in
                                if(item.category == .Sport){
                                    Text("\(String(format: "%.2f", item.finalPrice)) €")
                                }
                            }
                        } header: {
                            Text("Sport")
                        } footer: {
                            HStack {
                                Spacer()
                                Text("\(String(format: "%.2f", totalS)) €")
                            }
                        }
                    }
                }
            }
        }
        .navigationTitle(Text("Détails"))
        .onAppear {
            calculTotalSection(products: productList)
        }
    }
    
    // MARK: Privates functions
    
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
                case .Electromenager  :
                        totalE += item.finalPrice
                case .Bricolage:
                        totalB += item.finalPrice
            case .Meuble_et_deco:
                    totalMdc += item.finalPrice
                case .Jardin_et_maison:
                        totalJm += item.finalPrice
                case .Informatique:
                        totalI += item.finalPrice
            case .Telephonie:
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
