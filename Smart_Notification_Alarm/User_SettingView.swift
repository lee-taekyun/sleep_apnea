//
//  User_SettingView.swift
//  Smart_Notification_Alarm
//
//  Created by SanwanLee on 2020/09/20.
//  Copyright © 2020 SanwanLee. All rights reserved.
//

import SwiftUI

struct User_SettingView: View {
    var PhoneNumber: String
    var UserName : String
    var GuardName : String
    var body: some View {
        VStack(spacing: 30){
            User_SettingDetailView(PhoneNumber: PhoneNumber, UserName: UserName ,GuardName : GuardName)
            
            Spacer()
            
            Button(action:{
                print("Add the Guardian")
            }){
                Text("보호자 추가")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal, 40)
                    .padding(.vertical, 5)
                    .background(Color(hue: 0.059, saturation: 0.286, brightness: 0.999))
                    .cornerRadius(20)
                
            }
        }.padding(30)
    }
}

struct User_SettingView_Previews: PreviewProvider {
    
    static var previews: some View {
        User_SettingView(PhoneNumber: "", UserName: "",GuardName: "")
    }
}
