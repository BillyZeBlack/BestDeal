//
//  CategoryEnum.swift
//  Best Deal
//
//  Created by williams saadi on 23/07/2022.
//

import Foundation

enum CategoryEnum: String, CaseIterable {
    case Divers = "Divers"
    case Mode = "Mode"
    case Nourriture = "Nourriture"
    case Electromenager = "Electoménager"
    case Bricolage = "Bricolage"
    case Multimédia = "Multimédia"
    case Meuble_et_deco = "Meuble et déco."
    case Jardin_et_maison = "Jardin et maison"
    case Informatique = "Informatique"
    case Telephonie = "Téléphonie"
    case Jeux_vidéo = "Jeux video"
    case Sport = "Sport"
    
    static let allValues = [
        Divers,
        Mode,
        Nourriture,
        Electromenager,
        Bricolage,
        Multimédia,
        Meuble_et_deco,
        Jardin_et_maison,
        Informatique,
        Telephonie,
        Jeux_vidéo,
        Sport
    ]
}
