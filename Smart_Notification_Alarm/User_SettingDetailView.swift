//
//  User_SettingDetailView.swift
//  Smart_Notification_Alarm
//
//  Created by SanwanLee on 2020/09/20.
//  Copyright © 2020 SanwanLee. All rights reserved.
//

import SwiftUI
import Firebase

struct User_SettingDetailView: View {
    var PhoneNumber: String
    var UserName : String
    var GuardName : String
    let db = Firestore.firestore().collection("Peripheral")
    
    var body: some View {
        VStack{
            VStack(alignment: .leading, spacing: 4){
                HStack{
                    Image(systemName: "person.circle")
                        .font(.system(size:39))
                    Text("\(GuardName)")
                    Spacer()
                    
                    VStack {
                        Image(systemName: "pencil.circle")
                            .font(.system(size:20))
                        Spacer().frame(height:20)
                    }
                }.padding(.bottom, 10)
                    .padding(.top, 4)
                Text(" Tel. \(PhoneNumber)")
                    .font(.system(size:23))
                Text("메세지 내용")
                Text("\(UserName) 님의 호흡곤란이 발생했습니다.")
                Text("착용자의 상태 확인 후 조치가 필요합니다.")
            }.padding(10)
        }.background(Color(hue: 0.059, saturation: 0.286, brightness: 0.999))
        .cornerRadius(15)    }
}

struct User_SettingDetailView_Previews: PreviewProvider {
    static var previews: some View {
        
        User_SettingDetailView(PhoneNumber: "", UserName: "", GuardName: "")
    }
}
