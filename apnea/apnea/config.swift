//
//  config.swift
//  whdvm2
//
//  Created by ltg9612 on 2021/04/03.
//  Copyright © 2021 ltg9612. All rights reserved.
//

import SwiftUI

struct config: View
{
    var body: some View
    {
        ZStack
        {
            Color(#colorLiteral(red: 0.262745098, green: 0.6039215686, blue: 0.7843137255, alpha: 1)).edgesIgnoringSafeArea(.all)
            VStack
            {
                Text("설정")
                    .font(.system(size: 35))
                    .fontWeight(.bold)
                    .foregroundColor(Color(#colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)))
                
                Spacer()
            }
            
            
            VStack
            {
                    VStack(alignment: .leading)
                    {
                        HStack()
                        {
                            Image(systemName: "person.fill")
                                .font(.system(size: 30))
                            Text("이름")
                            Spacer()
                            Image(systemName: "pencil.circle")
                            
                        }
                        .padding(.bottom,10)
                        .frame(width: 300)
                        Text("Tel. 1234567890")
                            .padding(.bottom,5)
                        Text("내용")
                        Text("내용")
                        Text("내용")
                    }
                    .padding(40)
                    .background(Color(#colorLiteral(red: 0.262745098, green: 0.6039215686, blue: 0.7843137255, alpha: 1)))
                    .cornerRadius(25)
                    .padding(.top, 15)
                    .foregroundColor(Color(#colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)))
                
                    VStack(alignment: .leading)
                    {
                        HStack()
                        {
                            Image(systemName: "person.fill")
                                .font(.system(size: 30))
                            Text("이름")
                            Spacer()
                            Image(systemName: "pencil.circle")
                            
                        }
                        .padding(.bottom,10)
                        .frame(width: 300)
                        Text("Tel. 1234567890")
                            .padding(.bottom,5)
                        Text("내용")
                        Text("내용")
                        Text("내용")
                    }
                    .padding(40)
                    .background(Color(#colorLiteral(red: 0.262745098, green: 0.6039215686, blue: 0.7843137255, alpha: 1)))
                    .cornerRadius(25)
                    .padding(.top, 15)
                    .foregroundColor(Color(#colorLiteral(red: 0.8509803922, green: 0.8509803922, blue: 0.8509803922, alpha: 1)))
                
                
                    Spacer()
                
                
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

struct config_Previews: PreviewProvider {
    static var previews: some View {
        config()
    }
}
