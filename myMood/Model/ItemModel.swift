//
//  ItemModel.swift
//  myMood
//
//  Created by Aleksandr Shapovalov on 26/10/22.
//

import Foundation

//Immutable struct

struct ItemModel: Identifiable {
    
    let id: String
    let title: String
    let isCompleted: Bool
    
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
    }
    
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
