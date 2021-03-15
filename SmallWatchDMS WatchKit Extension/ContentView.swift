//
//  ContentView.swift
//  SmallWatchDMS WatchKit Extension
//
//  Created by GoEun Jeong on 2021/03/15.
//

import SwiftUI

struct ContentView: View {
    @State var meals = DMSApi(date: DMSApi.Meal(breakfast: [""], lunch: [""], dinner: [""]))
    let networkManager = NetworkManager()
    var body: some View {
        VStack {
            Text("2021-03-09 목")
            List { // 리스트
                MealRow(title: "아침", menu: meals.date.breakfast.joined(separator:", "))
                MealRow(title: "점심", menu: meals.date.lunch.joined(separator:", "))
                MealRow(title: "저녁", menu: meals.date.dinner.joined(separator:", "))
            }.listStyle(CarouselListStyle()) // 리스트의 스타일을 구경해봅시다!
        }.onAppear() {
                    networkManager.getMeal { meals in // 서버와 연결을 해서
                        self.meals = meals ?? DMSApi(date: DMSApi.Meal(breakfast: [""], lunch: [""], dinner: [""]))
                        // 가지고 있는 meals에 데이터를 넣는다. 실패한다면 빈 데이터를 넣는다.
                    }
            }
    }
}

struct MealRow: View {
    var title: String
    var menu: String
    var body: some View {
        VStack {
            Text(title)
            Text(menu)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
