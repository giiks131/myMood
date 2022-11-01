//
//  NotesData.swift
//  notes
//
//  Created by Andri on 28/10/22.
//

import SwiftUI
import Foundation

struct Note: Codable, Identifiable{
    var id = UUID()
    var title: String
    var content: String
    var timeStamp: String
}
@MainActor class Notes: ObservableObject{
    private let NOTES_KEY = "cairocodernotesky"
    let date = Date()
    var notes: [Note]{
        didSet{
        saveData()
            objectWillChange.send()
        }
    }
    init() {
        if let data = UserDefaults.standard.data( forKey: NOTES_KEY){
            if let decodedNotes = try? JSONDecoder().decode([Note].self, from: data) {
                notes = decodedNotes
                return
            }
            
        }
        notes = [Note(title: "Test Note", content: "Tap add button. You can delete swiping left", timeStamp: date.getFormatteDate(format: "dd-MM-yyyy hh:mm"))]
    }
    func addNote(title: String, content: String){
     let tempNote = Note(title: title, content: content, timeStamp: date.getFormatteDate(format: "dd-MM-yyyy hh:mm"))
        notes.insert(tempNote, at: 0)
        saveData()
    }
    private func saveData() {
        if let encodeNotes = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(encodeNotes, forKey: NOTES_KEY)
        }
    }
    
}
extension Date{
    func getFormatteDate(format: String) -> String{
        let dateformat = DateFormatter()
        dateformat.dateFormat = format
        return dateformat.string(from: self)
    }
}
