//
//  ContentView.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    
    var globalManager = GlobalManager()
    @State var initialPrice = "00,00 €"
    let title = "Prix Initial"

    var body: some View {
        
        let discounts: [Discount] = globalManager.generateListDiscount()
        
            ScrollView(.horizontal){
                LazyHStack(spacing: 20){
                    ForEach(discounts, id:\.id) {discount in
                        DiscountView(discount: discount)
                    }
                }.padding(.all, 10)
            }
        Divider()
        
//        VStack{
//            Text("My Best Deal")
//                .font(.largeTitle)
//            Spacer()
//            TextField(title, text: $initialPrice)
//                .frame(width: 300.0)
//                .textFieldStyle(RoundedBorderTextFieldStyle())
//            Spacer()
//        }
    }
}

 struct DiscountView: View {
    let discount: Discount
     var width: CGFloat = 70
    var body: some View {
        VStack{
            Text(discount.discoutLabel)
                .scaledToFit()
                .frame(width: width)
                .overlay(
                    Circle().stroke(Color.red, style: StrokeStyle(lineWidth: 2))
                        .frame(width: width + 5, height: width + 5)
                )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
