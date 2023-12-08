//
//  App.swift
//  
//
//  Created by Adriano Gimenez on 24/11/2023.
//

import Foundation

struct App: Decodable, Equatable, Hashable {
    var name: String
    var iconPath: String
    var carouselImagesPath: [String]
}
