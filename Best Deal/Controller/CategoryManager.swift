//
//  CategoryManager.swift
//  Best Deal
//
//  Created by williams saadi on 20/05/2022.
//

import Foundation

class CategoryManager {
    var CategoriesList : [Category] = []
    
    let namesList : [String] = ["Divers","Mode","Nourriture","Electroménager","Bricolage","Multimédia","Meuble et déco.","Jardin et maison","Informatique","Téléphonie","Jeux vidéo","Sport"]
    
    func loadCategoriesList () -> [Category]
    {
        for item in namesList {
            let cat = Category(name: item, imageName: item)
            CategoriesList.append(cat)
        }
        
        return CategoriesList
    }
}
