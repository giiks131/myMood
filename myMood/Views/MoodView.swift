
import SwiftUI

struct MoodView: View {
    @State private var date = Date()
    @State private var showingSheet = false

    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
        UINavigationBar.appearance().backgroundColor = UIColor.white
    }
    
    var body: some View {
        
        TabView {
            
                NavigationStack {
                
                VStack(alignment: .center){
                    Spacer()
                    Text("Today Ring")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Image("emoji")
                        .resizable()
                        
                        .frame(width: 150, height: 150)
                   
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    Text("Week Ring")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Image("ring")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                    
                    
                    Form {
                        Section {
                            
                            Text("hello 1")
                                
                            Text("hello 2")
                            Text("hello 3")
                            Text("hello 4")
                        }
                        
                        
                    }
                    .background(Color("appColor"))
                    .scrollContentBackground(.hidden)
                    
                    
                   
                }
                .background(Color("appColor"))
                .navigationTitle("Mood")
                .toolbar {
                    Button("Show emoji") {
                        withAnimation { showingSheet.toggle() }
//                        presentationMode.wrappedValue.dismiss()
                    }
                    
                }
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
            
                

            }
                .tabItem {
                    Image(systemName: "trophy.fill")
                    Text("Activity")
                }
            
            
            
//            NavigationStack {
//                VStack() {
//                    Text("hello world")
//                }
//            }
//            .sheet(isPresented: $showingSheet) {
//                self
//            }
        
            
            
            NavigationStack {
                VStack() {
                    DatePicker(
                            "Start Date",
                            selection: $date,
                            displayedComponents: [.date]
                        )
                    .datePickerStyle(.graphical)
                    .background(.white)
                    .padding(.all)
                    .cornerRadius(65)
                   
//                    Spacer()
                    
                    Text("Your current mood: ")
                        .font(.system(size: 30))
                        .fontWeight(.bold)
                   
                    Image("emoji")
                        .resizable()

                        .frame(width: 150, height: 150)
//                        .padding(.bottom)
                    Spacer()
                    
                }
                .background(Color("appColor"))
                .navigationTitle("Calendar")
                .toolbarBackground(.visible, for: .navigationBar)
                .navigationBarTitleDisplayMode(.inline)
               
            }
            .background(Color("appColor"))
            .tabItem {
                Image(systemName: "calendar")
                Text("Calendar")
                    
                
            }
           
        }
                    
//            NavigationStack {
//                VStack() {
//                    Text("hello world")
//                    Button("Press to dismiss") {
////                              dismiss()
//                          }
//                          .font(.title)
//                          .padding()
//                          .background(.black)
//                }
//            }
//                .sheet(isPresented: $showingSheet) {
//                    self
//                }
        
        
  
    }
        
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
