//
//  ContentView.swift
//  apnea
//
//  Created by ltg9612 on 2021/04/06.
//  Copyright © 2021 ltg9612. All rights reserved.
//

import SwiftUI

struct ContentView: View
{
    @State var userName = ""
    @State var guadianName = ""
    @State var guadianTel = ""
    var body: some View
    {
        
        NavigationView
        {
            VStack {
                VStack
                {
                    Text("사용자 이름")
                        .fontWeight(.bold)
                    TextField("-를 제외하고 입력해주세요", text: $userName)
                        .padding(.bottom,10)
                    Text("보호자 이름")
                    .fontWeight(.bold)
                    TextField("-를 제외하고 입력해주세요", text: $guadianName)
                    .padding(.bottom,10)
                    Text("보호자 전화번호")
                    .fontWeight(.bold)
                    TextField("-를 제외하고 입력해주세요", text: $guadianTel)
                    
                }
                .font(.system(size: 30))
                .offset(y: -150)
                
                NavigationLink(destination: myTabView())
               {
                   Text("확인")
                    .fontWeight(.bold)
                    .font(.system(size: 25))
                .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                .cornerRadius(25)
                   
               }
                .offset(y: -120)
                
            }
            
           
        }
        
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
