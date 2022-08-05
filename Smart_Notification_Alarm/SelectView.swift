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


struct SelectView: View {

    let fcmtoken = Messaging.messaging().fcmToken
    @ObservedObject var bleManager:BLEManager
    @State var PhoneNumber = ""
    @State var peripheral: CBPeripheral
    @State var UserName = ""
    @State var GuardName = ""
    
    let db = Firestore.firestore()
    var body: some View {
        
            HStack {
                NavigationLink(
                    destination: GuardInfo(bleManager: bleManager, peripheral: peripheral),
                    label: {
                        Text("보호자")
                    })
                NavigationLink(
                    destination: RecvInfo(bleManager: bleManager, peripheral: peripheral),
                    label: {
                        Text("사용자")
                    })
               
            }
            .padding(.top)
        //.navigationBarHidden(true)
    }
}


struct SelectView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
