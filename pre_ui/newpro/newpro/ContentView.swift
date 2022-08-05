//
//  ContentView.swift
//  project
//
//  Created by jaehwan on 2021/04/06.
//

import SwiftUI
/*
struct SettingView:View{
    var body:some View{
        NavigationView{
            ZStack{
                
            }.navigationTitle("Setting")
        }
    }
}
*/
struct ContentView:View{
    var body:some View{
        TabView{
            WifiView().tabItem {
                Image(systemName:"wifi")
                Text("Wifi")
            }
            UserInput().tabItem { Image(systemName:"text.book.closed")
                Text("Info")
            }
            user().tabItem { Image(systemName:"waveform.path.ecg.rectangle")
                Text("Graph")
            }
            config().tabItem {
                Image(systemName:"gear")
                Text("Setting")
            }
            
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}

