
import SwiftUI

struct MoodView: View {
    
    @State private var date = Date()
    @State private var showingSheet = false
    @State var chosenEmoji = "lovely"
    @State var progressBar: Double = 0
    @State var weekendBar: Double = 0
    @State var dayProgress: Double = 0
    @State var weekProgress: Double = 0
    
    
    @EnvironmentObject var listViewModel: ListViewModel
   
    
//    @State var items: [ItemModel] = [
//        ItemModel(title: "This is the first one", isCompleted: true),
//        ItemModel(title: "This is the second", isCompleted: false),
//        ItemModel(title: "Third one here", isCompleted: false)
//    ]
    
    
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
                                Image(chosenEmoji)
                                    .resizable()
                                
                                    .frame(width: 120, height: 120)
                                Circle ()
                                    .stroke(
                                        Color.red.opacity(0.5),
                                        lineWidth: 28
                                    )
                                    .frame(width: 160, height: 160)
                                
                                
                                
                                Circle()
                                    .trim(from: 0, to: self.progressBar)
                                    .stroke (
                                        Color.red,
                                        style: StrokeStyle (
                                            lineWidth: 28,
                                            lineCap: .round
                                            )
                                    )
                                    .rotationEffect(.degrees(-90))
                                    .frame(width: 160, height: 160)
                                    .animation(.easeInOut(duration: 2), value: true)
                                    
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
                            ZStack {
                                VStack {
                                    Circle()
                                        .stroke(
                                            Color.green.opacity(0.5),
                                            lineWidth: 20
                                        )
                                        .frame(width: 120, height: 120)
                                        .padding()
                                }
                                
                                Circle()
                                    .trim(from: 0, to: self.weekendBar)
                                    .stroke (
                                        Color.green,
                                        style: StrokeStyle (
                                            lineWidth: 20,
                                            lineCap: .round
                                        )
                                    )
                                    .rotationEffect(.degrees(-90))
                                    .frame(width: 120, height: 120)
                                    .animation(.easeInOut(duration: 2), value: true)
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
                                ForEach(listViewModel.items) { item in
                                    ListRowView(item: item)
                                        .onTapGesture {
                                            withAnimation(.linear) {
                                                listViewModel.updateItem(item: item)
                                                
//                                                if (progressBar) < 0.99 {
//                                                    self.progressBar += 0.3333
//                                                } else {
//                                                    progressBar -= 0.99
//                                                }
                                                
                                                if item.isCompleted == false {
                                                    self.progressBar += 1/3
                                                    
                                                    if dayProgress < 1 {
                                                        dayProgress += 1/3
                                                    }
                                                    
                                                } else {
                                                    self.progressBar -= 1/3
                                                    
                                                    if dayProgress >= 1 {
                                                        dayProgress -= 1/3
                                                    }
                                                }
                                                
                                                
                                                if dayProgress >= 1 {
                                                    self.weekendBar += 1/7
                                                    
                                                    if weekProgress < 7 {
                                                        weekProgress += 1/7
                                                    }
                                                } else {
                                                    if dayProgress < 1 && dayProgress > 2/3 {
                                                        self.weekendBar -= 1/7
                                                    }
                                                }
                                                
                                                
//                                                    {
//                                                self.weekendBar -= 1/7
//                                                    }
//                                                if progressBar >= 0.99 {
//                                                    self.weekendBar += 1/7
//                                                }
//                                                } else {
//                                                    self.weekendBar -= 1/7
//                                                }
                                            }
                                            
                                        }
                                }
//                                .onDelete(perform: listViewModel.deleteItem)
                                .onMove(perform: listViewModel.moveItem)
                                
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
                                ModalMoodView(mischio: $chosenEmoji)
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
                        Image(chosenEmoji)
                            .resizable()
                    }
                    .fullScreenCover(isPresented: $showingSheet) {
                        ModalMoodView(mischio: $chosenEmoji)
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
    
//    func deleteItem(indexSet: IndexSet) {
//        items.remove(atOffsets: indexSet)
//    }
//    func moveItem(from: IndexSet, to: Int) {
//        items.move(fromOffsets: from, toOffset: to)
//    }
    
}

struct ModalMoodView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var mischio : String
    
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
                        mischio = "triste"
                    } label: {
                        Image("triste")
                            .resizable()
                    }
                    .padding()
                    .frame(width: 165, height: 165)
                    
                    Button {
                        dismiss()
                        mischio = "sick"
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
                        mischio = "Cool"
                    } label: {
                        Image("Cool")
                            .resizable()
                            
                    }
                    .padding()
                    .shadow(radius: 0.3)
                    .frame(width: 165, height: 165)
                    
                    
                    Button {
                        dismiss()
                        mischio = "lovely"
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
        NavigationView {
            MoodView()
        }
//        ModalMoodView()
        .environmentObject(ListViewModel())
    }
        
    
}
