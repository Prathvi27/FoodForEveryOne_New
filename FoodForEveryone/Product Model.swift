//
//  File.swift
//  FoodForEveryone
//
//  Created by Ketaki Ekatpure on 13/5/2024.
//

import Foundation
struct Product: Identifiable{
    let id = UUID()
    var name: String
    var description: String
    var price: String
    var imageName: String
}
