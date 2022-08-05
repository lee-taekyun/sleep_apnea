//
//  UserView.swift
//  Smart_Notification_Alarm
//
//  Created by SanwanLee on 2020/09/20.
//  Copyright © 2020 SanwanLee. All rights reserved.
//

import SwiftUI


struct UserView: View {
    var PhoneNumber : String
    var UserName : String
    var GuardName : String
    @State private var index: Int = 1
    @ObservedObject var bleManager:BLEManager
    
    func changeView(tabindex: Int) -> some View {
        switch tabindex{
        case 0:
            return AnyView(User_SettingView(PhoneNumber: PhoneNumber, UserName: UserName ,GuardName : GuardName))
        case 1:
            return AnyView(User_DetailView(bleManager: bleManager))
        default:
            return AnyView(User_DetailView(bleManager: bleManager))
        }
    }
    var body: some View{
            ZStack {
                Color(hue: 0.55, saturation: 0.213, brightness: 0.944)
                VStack(spacing: 0){
                    Text("HMSoft")
                        .font(.system(size:30))
                        .fontWeight(.bold)
                        .padding()
                        .padding(.top, 50)
                    ScrollView(.horizontal) {
                        HStack(spacing: 0){
                            Button(action:{
                                print("사용자1")
                                self.index = 1
                            }){
                                Text("사용자1")
                                    
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(width:60)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 5)
                                    .background(self.index == 1 ? Color(hue: 0.586, saturation: 0.521, brightness: 0.795) : Color(hue: 0.059, saturation: 0.286, brightness: 0.999))
                                    .cornerRadius(10)
                                    
                            }
                            Button(action:{
                                print("설정")
                                self.index = 0
                                
                            }){
                                Text("설정")
                                    
                                    .fontWeight(.bold)
                                    .foregroundColor(.black)
                                    .frame(width:60)
                                    .padding(.horizontal, 30)
                                    .padding(.vertical, 5)
                                    .background(self.index == 0 ? Color(hue: 0.586, saturation: 0.521, brightness: 0.795) : Color(hue: 0.059, saturation: 0.286, brightness: 0.999))
                                    
                                    .cornerRadius(10)
                            }
                            
                        }
                        .padding(0.0)
                    } //Hstack
                  // showsetttingView(tabindex: self.index)
                    ScrollView{
                        VStack {
                            changeView(tabindex: self.index)
                        }
                    }.background(Color(hue: 0.586, saturation: 0.521, brightness: 0.795))
                        .edgesIgnoringSafeArea(.bottom)
                }
                
            }            .edgesIgnoringSafeArea(.all)
            
            
    }// vstack
    // navigation
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(PhoneNumber: "",UserName: "",GuardName: "", bleManager: BLEManager())
    }
}
