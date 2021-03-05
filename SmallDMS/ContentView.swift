//
//  ContentView.swift
//  SmallDMS
//
//  Created by GoEun Jeong on 2021/03/04.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().isTranslucent = false
        UITabBar.appearance().barTintColor = UIColor(Color("DMS")) // 바 배경 색
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color("lightDMS")) // 선택안한 아이템 색
    }
    var body: some View {
        TabView { // 탭바
            MealView()
                .tabItem {
                    Image(systemName: "pencil.circle")
                    Text("급식")
                }

            Text("second Page")
                .tabItem {
                    Image(systemName: "checkmark")
                    Text("신청")
                }
            Text("third Page")
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("공지")
                }
            Text("fourth Page")
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("마이페이지")
                }
        }.accentColor(Color.white) // 선택된 아이템 색
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
