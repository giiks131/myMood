//
//  NoteView.swift
//  notes
//
//  Created by Andri on 28/10/22.
//

import SwiftUI

struct NoteView: View {
  @EnvironmentObject var notes: Notes
  
  var body: some View {
      NavigationStack {
          VStack {
              List {
                  ForEach(notes.notes) { note in
                      VStack(alignment: .leading) {
                          Text(note.title)
                              .foregroundColor(.red)
                              .font(.headline)
                          Text(note.content)
                              .font(.body)
                              .padding(.vertical)
                          HStack{
                              Spacer()
                              Text("\(note.timeStamp)")
                                  .foregroundColor(.gray)
                                  .italic()
                          }
                          
                      }
                      
                  }
                  .onDelete(perform: deleteNote)
                  
              }
          }
      }

  }
     
    
  func deleteNote(at offsets: IndexSet){
      notes.notes.remove(atOffsets: offsets)
  }
}

struct NoteView_Previews: PreviewProvider {
  static var previews: some View {
      NoteView()
          .environmentObject(Notes())
  }
}
