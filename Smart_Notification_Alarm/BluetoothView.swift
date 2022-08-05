//
//  ContentView.swift
//  Blooth_test
//
//  Created by SanwanLee on 2020/09/25.
//  Copyright © 2020 SanwanLee. All rights reserved.
//
// 블루투스 검색 화면
import SwiftUI
import Firebase

struct BluetoothView: View {
    @ObservedObject var bleManager = BLEManager()
    var body: some View {
        
        ZStack {
            NavigationView {
                VStack(spacing: 10){
                    Text("Bluetooth Devices")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .center)
                    List(bleManager.peripherals, id: \.self){ peripheral in //검색된 블루투스 기계 리스트 출력
                        HStack {
                            NavigationLink(destination: SelectView(bleManager: self.bleManager,peripheral: peripheral)){
                                HStack {
                                    Text(peripheral.name ?? "unknown")
                                    Spacer()
                                }

                            }
                            
                        }

                    }.frame(height: 300)
                    
                    Spacer()
                    
                    Text("STATUS")
                        .font(.headline)
                    
                    if bleManager.isSwitchedOn {
                        Text("Bluetooth is switched on")
                            .foregroundColor(.red)
                    } else {
                        Text("Bluetooth is NOT switched on")
                        .foregroundColor(.red)
                    }
                    
                    
                    HStack{
                        VStack(spacing: 10){
                            Button(action: {
                                bleManager.startScanning()
                            }){
                                
                                VStack {
                                    Image(systemName: "smallcircle.circle")
                                        .font(.system(size:50))
                                    Text("Start").font(.system(size:20))
                                }
                                
                            }
                            Button(action: {
                                bleManager.stopScanning()
                            }){
                                Text("Stop")
                            }
                        }.padding()
                                              
                    }
                    Spacer()
                }
            }
        }
    }
}


struct BluetoothView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
