//
//  myTabView.swift
//  whdvm2
//
//  Created by ltg9612 on 2021/04/06.
//  Copyright © 2021 ltg9612. All rights reserved.
//

import SwiftUI

struct myTabView: View {
    var body: some View {
        TabView
        {
            user().tabItem
                {
                    Image(systemName: "person")
                    Text("사용자")
                }
            
            config().tabItem
                {
                    Image(systemName: "gear")
                    Text("설정")
                }
            Text("보호자 추가").tabItem
            {
                    Image(systemName: "person.badge.plus")
                    Text("보호자 추가")
            }
            
        }
        
    }
}

struct myTabView_Previews: PreviewProvider {
    static var previews: some View {
        myTabView()
    }
}
