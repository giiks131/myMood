
import SwiftUI

struct MoodView: View {
    @State private var date = Date()
    @State private var showingSheet = false
    
    @State var items: [ItemModel] = [
        ItemModel(title: "This is the first one", isCompleted: true),
        ItemModel(title: "This is the second", isCompleted: false),
        ItemModel(title: "Third one here", isCompleted: false)
    ]
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
//        UINavigationBar.appearance().backgroundColor = UIColor.white
//        UINavigationBar.appearance().backgroundColor = UIColor(Color("appColor"))
    }
    
    var body: some View {
        
        TabView {
            
                NavigationStack {
                    
                    ZStack {
                        
                        VStack(alignment: .center){
                            Spacer()
                            Text("Today Ring")
                                .font(.system(size: 25))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            ZStack {
                                Image("Lol")
                                    .resizable()
                                
                                    .frame(width: 120, height: 120)
                                Circle ()
                                    .stroke(
                                        Color.red.opacity(0.5),
                                        lineWidth: 28
                                    )
                                    .frame(width: 160, height: 160)
                                
                                
                                
                                Circle()
                                    .trim(from: 0, to: 0.25)
                                    .stroke (
                                        Color.red,
                                        style: StrokeStyle (
                                            lineWidth: 28,
                                            lineCap: .round
                                            )
                                    )
                                    .rotationEffect(.degrees(-90))
                                    .frame(width: 160, height: 160)
//                                Spacer()
//                                Spacer()
//                                Spacer()
//                                Spacer()
                            }
                            .padding(.bottom, 30)
                            
                            
                            Text("Week Ring")
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                            
                            VStack {
                                Circle()
                                    .stroke(
                                        Color.green.opacity(0.5),
                                        lineWidth: 20
                                    )
                                    .frame(width: 120, height: 120)
                                    .padding()
                            }
//                            Image("ring")
//                                .resizable()
//                                .frame(width: 100, height: 100, alignment: .center)
                            
                            
                            //                    Form {
                            //                        Section {
                            //
                            //                            Text("hello 1")
                            //
                            //                            Text("hello 2")
                            //                            Text("hello 3")
                            //                            Text("hello 4")
                            //                        }
                            
                            
                            //                    }
                            //                    .background(Color("appColor"))
                            //                    .scrollContentBackground(.hidden)
                            
                            List {
                                ForEach(items) { item in
                                    
                                    ListRowView(item: item)
                                }
                                .onDelete(perform: deleteItem)
                                
                            }
                            .scrollContentBackground(.hidden)
                            .scrollDisabled(true)
                            
                            
                            
                        }
                        .background(Color("appColor"))
                        .navigationTitle("Mood")
                        
                        
                        .toolbar {
                            Button("Show emoji") {
                                showingSheet.toggle()
                            }
                            .fullScreenCover(isPresented: $showingSheet) {
                                ModalMoodView()
                            }
                            
                        }
                        //                .toolbarBackground(.visible, for: .navigationBar)
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                        
                    }
                    
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
                        
                        Spacer()
                        
                        
                        Text("Your current mood: ")
                            .font(.system(size: 35))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Button {
                            showingSheet.toggle()
                        }
                    label: {
                        Image("Lol")
                            .resizable()
                    }
                    .fullScreenCover(isPresented: $showingSheet) {
                        ModalMoodView()
                    }
                    .frame(width: 150, height: 150)
                        
                        //                        .padding(.bottom)
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        
                    }
                    .background(Color("appColor"))
                    .navigationTitle("Calendar")
                    .toolbarBackground(.visible, for: .navigationBar)
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    
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
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
}

struct ModalMoodView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack() {
           
                
                Image("howarechoose")
                    .resizable()
                    
            
                
//                Spacer()
//                Spacer()
                HStack() {
                    Button() {
                        dismiss()
                    } label: {
                        Image("triste")
                            .resizable()
                    }
                    .padding()
                    .frame(width: 165, height: 165)
                    
                    Button {
                        dismiss()
                    } label: {
                        Image("sick")
                            .resizable()
                    }
                    .padding()
                    .frame(width: 165, height: 165)
                }
//                                            .padding(.top, 150)
                
                
                
                HStack() {
                    Button {
                        dismiss()
                    } label: {
                        Image("Cool")
                            .resizable()
                            
                    }
                    .padding()
                    .shadow(radius: 0.3)
                    .frame(width: 165, height: 165)
                    
                    
                    Button {
                        dismiss()
                    } label: {
                        Image("lovely")
                            .resizable()
                    }
                    .padding()
                    .frame(width: 165, height: 165)
                }
                .padding(.bottom, 30)
            
                Spacer()
            }
            .background(Color("appColor"))
        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
        ModalMoodView()
    }
}
