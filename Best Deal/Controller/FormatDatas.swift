//
//  FormatDatas.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation

class FormatDatas {
    
    func formatPrice(dataInString: String)-> Double?
    {
        var myData = replaceCommaByDot(dataInString: dataInString)
        
        if let i = myData.firstIndex(of: "€") {
            myData.remove(at: i)
        }
        
        if let i = myData.firstIndex(of: " ") {
            myData.remove(at: i)
        }
        
        if let i = myData.firstIndex(of: "%") {
            myData.remove(at: i)
        }
        
        if let dataInDouble = Double(myData){
            return dataInDouble
        }else {
            return nil
        }
    }
    
    private func replaceCommaByDot(dataInString : String)-> String
    {
        let dataFormated = dataInString.replacingOccurrences(of: ",", with: ".")
        return dataFormated
    }
}
