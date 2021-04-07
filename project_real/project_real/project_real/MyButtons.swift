//
//  MyButtons.swift
//  project
//
//  Created by jaehwan on 2021/04/06.
//

import SwiftUI

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
}
struct MyButtons_Previews: PreviewProvider {
    static var previews: some View {
        WifiButton()
        WifiSelectButton()
    }
}
