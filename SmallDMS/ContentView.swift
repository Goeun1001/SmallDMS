//
//  ContentView.swift
//  SmallDMS
//
//  Created by GoEun Jeong on 2021/03/04.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
