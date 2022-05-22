//
//  DiscountView.swift
//  Best Deal
//
//  Created by williams saadi on 21/05/2022.
//

import SwiftUI

struct DiscountView: View {
   let discount: Discount
    var width: CGFloat = 70
    @State var validData = 00.00
    var globalManager : GlobalManager!
    
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

struct DiscountView_Previews: PreviewProvider {
    static var previews: some View {
        DiscountView(discount: Discount(id: 1, discoutLabel: "25"))
    }
}
