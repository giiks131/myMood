//
//  ItemModel.swift
//  myMood
//
//  Created by Aleksandr Shapovalov on 26/10/22.
//

import Foundation


struct ItemModel: Identifiable {
    
    let id: String = UUID().uuidString
    let title: String
    let isCompleted: Bool
}
