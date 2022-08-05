//
//  WifiView.swift
//  project_real
//
//  Created by ltg9612 on 2021/04/23.
//

import SwiftUI

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

struct WifiButton: View {
    var buttonText="text"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width:150,height: 50).foregroundColor(.green).shadow(color:.green, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
            HStack{
                Text(buttonText).bold().padding(.horizontal).foregroundColor(.white)
                Image(systemName: "wifi").foregroundColor(.white)
            }
            
        }
   

}
}

struct WifiSelectButton: View {
    var buttonText="text"
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 5)
                .frame(width:280,height: 50).foregroundColor(.gray)
            HStack{
                Text(buttonText).bold().padding(.horizontal).foregroundColor(.white)
                Image(systemName: "chevron.right").foregroundColor(.white)
            }
            
        }
   

}

struct WifiView_Previews: PreviewProvider {
    static var previews: some View {
        WifiView()
    }
}
}

