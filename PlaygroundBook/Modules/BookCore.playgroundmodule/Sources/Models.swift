//
//  Models.swift
//  BookCore
//
//  Created by Naomi Nakanishi on 19/04/21.
//

import Foundation
enum Bottoms{
    case crepeTrousers
    case skinnyJeans
    case tailorPants
    static let worst = Bottoms.crepeTrousers
    static let best = Bottoms.tailorPants
}
enum Tops{
    case capSleeveShirt
    case cottonTshirt
    case knitPullover
    static let worst = Tops.knitPullover
    static let best = Tops.cottonTshirt
}
