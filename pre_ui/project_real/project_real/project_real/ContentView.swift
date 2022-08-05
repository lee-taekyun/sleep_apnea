//
//  ContentView.swift
//  project
//
//  Created by jaehwan on 2021/04/06.
//

import SwiftUI

struct SettingView:View{
    var body:some View{
        NavigationView{
            ZStack{
                
            }.navigationTitle("Setting")
        }
    }
}

struct ContentView:View{
    var body:some View{
        TabView{
            WifiView().tabItem { Image(systemName: "wifi")
                Text("Wifi")
            }
            UserInput().tabItem { Image(systemName: "text.book.closed")
                Text("Info")
            }
            user().tabItem { Image(systemName: "waveform.path.ecg.rectangle")
                Text("Graph")
            }
            config().tabItem { Image(systemName: "gear")
                Text("Setting")
            }
            
        }
    }
}


struct WifiView: View {
    
    
    var body: some View {
        ZStack{
            
            VStack{
                Text("Bluetooth Devices")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    Spacer()
               
                        WifiSelectButton(buttonText: "wifi1")
                        WifiSelectButton(buttonText: "wifi2")
                        WifiSelectButton(buttonText: "wifi3")
                
                Spacer()
            
                Text("status")
                    .font(Font.system(size:25))
                   
                Text("Bluetooth is switched on")
                    .foregroundColor(Color.red) .font(Font.system(size:20))
                
              
                    WifiButton(buttonText: "Wifi")
               
                
               Spacer()
            }
            
            
        
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
    }
}
