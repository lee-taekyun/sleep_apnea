//
//  user1.swift
//  whdvm2
//
//  Created by ltg9612 on 2021/04/05.
//  Copyright © 2021 ltg9612. All rights reserved.
//

import SwiftUI

struct user: View {
    var body: some View
    {
            ZStack
            {
                Color(#colorLiteral(red: 0.262745098, green: 0.6039215686, blue: 0.7843137255, alpha: 1)).edgesIgnoringSafeArea(.all)
                VStack
                {
                    Text("사용자")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundColor(Color(#colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)))
                    
                    Spacer()
                }
                VStack
                {
                    VStack(alignment: .leading, spacing: 0)
                    {
                        Divider().opacity(0)
                        Rectangle().frame(height: 0)
                        Text("날짜:")
                        .fontWeight(.bold)
                        .padding(.bottom,10)
                        Text("총 수면시간:")
                            .fontWeight(.bold)
                            .padding(.bottom,10)
                        Text("총 무호흡 횟수:")
                        .fontWeight(.bold)
                        .padding(.bottom,10)
                        Text("총 무호흡 시간:")
                        .fontWeight(.bold)
                        .padding(.bottom,10)
                    }
                    .foregroundColor(Color(#colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)))
                    .padding(.leading, 50)
                    .offset(y:100)
                        

                }
                .frame(width: 415, height: 770)
                .background(Color(#colorLiteral(red: 0.1490196078, green: 0.4078431373, blue: 0.6039215686, alpha: 1)))
                .offset(y: 70)
                
                /*
                HStack(alignment: .bottom)
                {
                    Divider()
                    
                    Button()
                        .padding(.leading,70)
                        .padding(.bottom,50)
                        .opacity(0.5)
                    
                    Spacer()
                    
                    Button2()
                        .padding(.trailing,70)
                        .padding(.bottom,50)
                    
                 
                }
                */
            }
        
        
    }
}

struct user1_Previews: PreviewProvider {
    static var previews: some View {
        user()
    }
}

struct Button: View {
    var body: some View {
        Text("사용자")
            .font(.system(size:20))
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}

struct Button2: View {
    var body: some View {
        Text("기록")
            .font(.system(size:20))
            .padding()
            .background(Color.blue)
            .foregroundColor(Color.white)
            .cornerRadius(20)
    }
}
