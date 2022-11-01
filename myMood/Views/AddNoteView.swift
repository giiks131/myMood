//
//  AddNew.swift
//  notes
//
//  Created by Andri on 28/10/22.
//

import SwiftUI

struct AddNew: View {
    
    @State private var title = ""
    @State private var content = ""
    @EnvironmentObject var notes: Notes
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        
        NavigationStack {
            
            Form {
                Section {
                    TextField("Give your note a title", text: $title )
                    ZStack{
                        
                        TextField("Text...", text: $content)
                            .frame(height: 100)
                        
                        VStack{
                            Spacer()
                            HStack{
                                Spacer()
                                Text("\(content.count)/120")
                                    .foregroundColor(.gray)
                                    .padding()
                                
                                
                            }
                        }
                        
                    }
                    
                    HStack{
                        Spacer()
                        
                        Button("Add note") {
                            notes.addNote(title: title, content: content)
                            dismiss()
                        }
                        Spacer()
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    
                
                Button() {
                    dismiss()
                }
                label: {
                    Image(systemName: "xmark")
                        .resizable()
                }
            }
            }
        }
        
    }
    
}
struct AddNew_Previews: PreviewProvider {
    static var previews: some View {
        AddNew()
            .environmentObject(Notes())
    }
}

