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


struct RecvInfo: View {

    let fcmtoken = Messaging.messaging().fcmToken
    @ObservedObject var bleManager:BLEManager
    @State var PhoneNumber = ""
    @State var peripheral: CBPeripheral
    @State var UserName = ""
    @State var GuardName = ""
    
    let db = Firestore.firestore()
    var body: some View {
            VStack {
                Text("사용자 성함")
                    .font(.system(size: 30))
                    .font(.headline)
                
                TextField("", text: $UserName)
                    .font(.system(size:30))
                    .font(.subheadline)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.leading)
                    .padding(.trailing)
                
                
                                
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
                            db.collection("Peripheral").document(peripheral.identifier.uuidString).setData(["UserName": UserName, "UserToken": fcmtoken ?? ""], merge: true)
                            UserName = ""
                           print("clicked")
                            self.getData(uuid: peripheral.identifier.uuidString)
                        })
                        .navigationBarHidden(true)
                        

                        Spacer()
                    }
                Spacer()
            }
            .padding(.top)
        }
    func getData(uuid : String) {
        let docRef = db.collection("Peripheral").document(uuid)

        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                UserName = document.get("UserName") as! String
                GuardName = document.get("Guardian") as! String
                PhoneNumber = document.get("PhoneNumber") as! String
                print("Document data: \(UserName)")
            } else {
                print("Document does not exist")
            }
        }

    }
}


struct RecvInfo_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
