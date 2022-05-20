//
//  ContentView.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var globalManager = GlobalManager()
    @State var testToDouble = 0.00
    
    var test: Double {
        guard let test = globalManager.formatDatas.formatPrice(dataInString: "50%") else { return 0.00 }
        return test
    }
    var body: some View {
        
        Text("\(test)")
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
