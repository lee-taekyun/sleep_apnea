//
//  User_DetailView.swift
//  Smart_Notification_Alarm
//
//  Created by SanwanLee on 2020/09/20.
//  Copyright © 2020 SanwanLee. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct User_DetailView: View {
    @ObservedObject var bleManager:BLEManager
   
    var body: some View {
        VStack(alignment: .leading){
            VStack{
                LineView(data: bleManager.DataSet).frame(height: 200)
                .frame(height: 300)
                .offset(y: -50)
            }
            
            HStack() {
                Spacer()
                Text("실시간 호흡 패턴 그래프")
                Spacer()
            }.padding(.bottom,7)
            
            
            Text("무호흡증 발생 횟수: \(bleManager.count)회")
            
            Text("무호흡증 발생 평균 시간: \(bleManager.averagetime)초")
            
            LineView(data: bleManager.FiveSet).frame(height: 200)
            HStack{
                Spacer()
                Text("5분당 호흡 수 그래프")
                Spacer()
            }.padding(.bottom,7)
            .padding(.top, 100)
            
            Text("5분당 평균 호흡 수: \(bleManager.fivebreath)회")
            Text("5분당 이상 호흡 감지 수: \(bleManager.fiveabnormal)번")
            Spacer()
            HStack{
                Spacer()
                
                Button(action:{
                    print("See the Detail")
                }){
                    Text("상세 정보 보기")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .padding(.horizontal, 40)
                        .padding(.vertical, 5)
                        .background(Color(hue: 0.059, saturation: 0.286, brightness: 0.999))
                        .cornerRadius(20)
                    
                }
                Spacer()
            }.padding(.top, 40)
        }
        .padding(40)
    }
}

struct User_DetailView_Previews: PreviewProvider {
    static var previews: some View {
        User_DetailView(bleManager: BLEManager())
    }
}
