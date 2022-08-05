//
//  RecvInfo.swift
//  Smart_Notification_Alarm
//
//  Created by SanwanLee on 2020/10/09.
//  Copyright © 2020 SanwanLee. All rights reserved.
//

import SwiftUI
import CoreBluetooth
import Firebase
import FirebaseMessaging


struct GuardInfo: View {

    let fcmtoken = Messaging.messaging().fcmToken
    @ObservedObject var bleManager:BLEManager
    @State var PhoneNumber = ""
    @State var peripheral: CBPeripheral
    @State var UserName = ""
    @State var GuardName = ""
    
    let db = Firestore.firestore()
    var body: some View {
        
            VStack {
                
                Text("보호자 성함")
                    .font(.system(size: 30))
                    .font(.headline)
                
                TextField("",text: $GuardName)
                    .font(.system(size:30))
                    .font(.subheadline)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                    .padding(.trailing)
                
                Text("보호자 전화번호")
                    .font(.system(size: 30))
                    .font(.headline)
                
                TextField("-를 제외하고 입력해주세요.", text: $PhoneNumber)
                    .font(.system(size:30))
                    .font(.subheadline)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                    .padding(.trailing)
                    .keyboardType(.numberPad)
                                
                Spacer()
               
                    HStack {
                        Spacer()
                        NavigationLink(destination: UserView(PhoneNumber: PhoneNumber, UserName: UserName ,GuardName : GuardName, bleManager : self.bleManager).navigationBarHidden(true)){
                            Text("확인")
                                .font(.system(size: 23))
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(20)
                        }.simultaneousGesture(TapGesture().onEnded(){
                            bleManager.connectToDevice(peripheral: peripheral)
                            db.collection("Peripheral").document(peripheral.identifier.uuidString).setData(["Guardian": GuardName, "PhoneNumber": PhoneNumber, "GuardToken": fcmtoken ?? ""], merge: true)
                            GuardName = ""
                            PhoneNumber = ""
                           print("clicked")
                        })

                        Spacer()
                    }
                Spacer()
            }
            .padding(.top)
        }
    
    
}


struct GuardInfo_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
