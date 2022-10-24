
import SwiftUI

struct MoodView: View {
    var body: some View {
     
        NavigationStack {
            TabView {
                
                
                VStack(alignment: .leading){
                    Text("Today Ring")
                        .font(.system(size: 25))
                        .fontWeight(.bold)
                    Image("emoji")
                        .resizable()
                        
                        .frame(width: 200, height: 200)
                    Text("Week Ring")
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                    Image("ring")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    List {
                        Text("hello 1")
                        Text("hello 2")
                        Text("hello 3")
                        
                        
                    }
                    .background(Color("appColor"))
                    .scrollContentBackground(.hidden)
                    
                    
                    
                }
                
                .navigationTitle("Mood")
                .padding()
                .background(Color("appColor"))

            }
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
