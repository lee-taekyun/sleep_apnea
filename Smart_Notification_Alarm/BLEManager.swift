//
//  BLEManager.swift
//  Blooth_test
//
//  Created by SanwanLee on 2020/09/25.
//  Copyright © 2020 SanwanLee. All rights reserved.
//

import Foundation
import CoreBluetooth
import SwiftUI
import Firebase //추가
import FirebaseMessaging//추가


class BLEManager: NSObject, ObservableObject, CBCentralManagerDelegate, CBPeripheralDelegate{
    let ReceiverFCMToken = "diqoDK4BJ0Sykj187B5khH:APA91bFa4rYeioJ9rMeQbkDxv9T47rIjtdD2cIp1Sr1vj2RdUQ6leVl6xipStkPgHE5iMOrlSXE6ThDNA8uD4HcbdQZCR9CgqGlGBHmezjQKU7kyYqepThoaK_ZQeQFxeOZ2np9xeOgs" //추가
    @Published var date = Date()
    @Published var peripherals = [CBPeripheral]()
    @Published var DataSet = [Double]()
    @Published var FiveSet = [Double]()
    private var myCentral: CBCentralManager!
    @Published var data = ""
    @Published var str : Double?
    @Published var time = 0 // 무호흡증 누적 시간
    @Published var averagetime = 0 //무호흡증 평균 시간
    @Published var averagefivetime = 0 // 5분 평균
    @Published var fivebreath = 0 //5분당 평균 호흡수
    @Published var fiveabnormal = 0 // 5분당 이상 호흡 수
    @Published var count = 0 // 무호흡증 카운트
    var checkcount = 0 // 호흡 유무 카운터 호흡시 0, 안할시 증가
    var valueChar : CBCharacteristic?
    var timecheck = 0 // 총 시간
    var checkfive = 0 // 호흡수 카운트
    var In = 1 // 호흡 횟수 체크 변수
    var Out = 0
    private let ServiceUUID = CBUUID.init(string: "FFE0")
    private let CharUUID = CBUUID.init(string: "FFE1")
    @Published var isSwitchedOn = false
    
    override init(){
        super.init()
        
        myCentral = CBCentralManager(delegate: self, queue: nil)
        myCentral.delegate = self
    }
    func sendMessageTouser(to token: String, title: String, body: String) {
        print("sendMessageTouser()")
        let urlString = "https://fcm.googleapis.com/fcm/send"
        let url = NSURL(string: urlString)!
        let paramString: [String : Any] = ["to" : token,
                                           "notification" : ["title" : title, "body" : body],
                                           "data" : ["user" : "test_id"]
        ]
        let request = NSMutableURLRequest(url: url as URL)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject:paramString, options: [.prettyPrinted])
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("key=\(legacyServerKey)", forHTTPHeaderField: "Authorization")
        let task =  URLSession.shared.dataTask(with: request as URLRequest)  { (data, response, error) in
            do {
                if let jsonData = data {
                    if let jsonDataDict  = try JSONSerialization.jsonObject(with: jsonData, options: JSONSerialization.ReadingOptions.allowFragments) as? [String: AnyObject] {
                        NSLog("Received data:\n\(jsonDataDict))")
                    }
                }
            } catch let err as NSError {
                print(err.debugDescription)
            }
        }
        task.resume()
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
            isSwitchedOn = true
        }
        else {
            isSwitchedOn = false
        }
    }
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
       
        if (advertisementData[CBAdvertisementDataLocalNameKey] as? String) != nil {
            
            if !peripherals.contains(peripheral){
                print(peripheral.identifier.uuidString)
                peripherals.append(peripheral)
            }            
        }
    }
    
    func startScanning(){
        print("startScanning")
        myCentral.scanForPeripherals(withServices: nil, options: nil)
        
    }
    
    func stopScanning() {
        print("stopScanning")
        myCentral.stopScan()
    }
    
    
    
    func connectToDevice(peripheral: CBPeripheral) {
        myCentral.connect(peripheral, options: nil)
    }
    
    func centralManager(_ central: CBCentralManager, didFailToConnect peripheral: CBPeripheral, error: Error?) {
        if error != nil {
            print("Failed to connect to peripheral")
            return
        }
    }
    
    func discoonectAllConnection(peripheral: CBPeripheral){
        myCentral.cancelPeripheralConnection(peripheral)
    }
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        print("*****************************")
        print("Connection complete")
        print("Peripheral info: \(String(describing: peripheral))")
        
        //Stop Scan- We don't need to scan once we've connected to a peripheral. We got what we came for.
        stopScanning()
        print("Scan Stopped")
        //Erase data that we might have
        //data.length = 0
       
        peripheral.delegate = self
        peripheral.discoverServices([ServiceUUID])
        
        //Once connected, move to new view controller to manager incoming and outgoing data
    
    }
    
   
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        if let services = peripheral.services {
            for service in services {
                if service.uuid == ServiceUUID {
                    print("HM service found")
                    peripheral.discoverCharacteristics([CharUUID], for: service)
                    
                    return
                }
            }
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?){
        if let characterArray = service.characteristics as [CBCharacteristic]? {
            for cc in characterArray {
                if (cc.uuid.uuidString == "FFE1") {
                    valueChar = cc
                    peripheral.setNotifyValue(true, for: cc)
                    peripheral.readValue(for: cc)
                    peripheral.discoverDescriptors(for: cc)
                }
                
            }
        }
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor characteristic: CBCharacteristic, error: Error?){
        guard (characteristic.uuid.uuidString == "FFE1"),
            let readValue = characteristic.value,
            let value = NSString(data: readValue, encoding: String.Encoding.utf8.rawValue)


        else {return}
        print(value)
        data = value as String
        str = Double(String(data[data.index(data.startIndex, offsetBy: 12)]))
        DataSet.append(str!)
        
        print(str ?? "0")
        check()
        timecheck = timecheck + 1
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "Notify"), object: self)
        
    }
   
    func check(){ // 윗 그래프
        if(Int(str!) == 1){ //호흡 하지 않을 때
            checkcount = checkcount + 1 //1초마다 카운트 증가
            if checkcount == 10 { //10초 이상 지속 시 무호흡 카운트 증가 및 누적 시간 저장
                count = count + 1
                time = time + 10
                sendMessageTouser(to: ReceiverFCMToken, title: "무호흡 알람", body: "홍길동님의 호흡 곤란이 발생했습니다. 착용자의 상태 확인 후 조치가 필요합니다.")
            } else if checkcount > 10 {
                time = time + 1
            }
        } else if(Int(str!) == 2) {//호흡 시 카운트 초기화
            checkcount = 0
        }
        if count >= 1 { //무호흡 있을 시 평균 무호흡 시간 측정
            averagetime = Int(time / count)
        }
    }
    func checkFive(){// 아래 그래프
        
        Out = Int(str!)//현재 값 저장
        if(In != Out){//호흡할 시 카운트 증가
            checkfive = Int((checkfive + 1) / 2) //들숨 날숨 두번 측정 -> 2로 나눔
        }
        In = Out
        if(timecheck % 300 == 0){//5분당 수치 측정
            averagefivetime = averagefivetime + 1
            fivebreath = checkfive / averagefivetime
            fiveabnormal = count / averagefivetime
            FiveSet.append(Double(fivebreath))
        }
    }
    func peripheral(_ peripheral: CBPeripheral, didDiscoverDescriptorsFor  characteristic: CBCharacteristic, error: Error?){
        print("**************")
        if error != nil {
            print("\(error.debugDescription)")
        }
        guard let descriptors = characteristic.descriptors else {return}
        
        descriptors.forEach { descript in
            
            print("function name: DidDiscoverDescriptForChar \(String(describing: descript.description))")
            print("Value \(String(describing: characteristic.value))")
        }
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateNotificationStateFor characteristic: CBCharacteristic, error: Error?){
        print("**************")
        
        if(error != nil) {
            print("Error changing notification state: \(String(describing: error?.localizedDescription))")
        } else {
            print("Characteristic's value subscribed")
        }
        
        if characteristic.isNotifying {
            print("subscribed. Notification has began for: \(characteristic.uuid)")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDisconnectPeripheral peripheral: CBPeripheral, error: Error?){
        print("Disconnected")
    }
    
}

struct Peripheral: Identifiable {
    let id: Int
    let name: String
    let rssi: Int
}

struct BLEManager_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
