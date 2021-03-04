//
//  MealView.swift
//  SmallDMS
//
//  Created by GoEun Jeong on 2021/03/04.
//

import SwiftUI

struct MealView: View {
    @State var meals = DMSApi(date: DMSApi.Meal(breakfast: [""], lunch: [""], dinner: [""]))
    let networkManager = NetworkManager()
    var body: some View {
        ZStack {
            Color("lightGray").ignoresSafeArea()
            
            VStack(spacing: 40) {
                HStack(spacing: 40) {
                    Image("leftArrow")
                        .resizable()
                        .frame(width: 30, height: 30)
                    VStack(spacing: 5) {
                        Text("2021년 03월 04일").foregroundColor(.gray)
                        Text("목요일 식단표")
                    }.font(.system(size: 20))
                    Image("rightArrow")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                MealRow(title: "아침", menu: meals.date.breakfast.joined(separator:", "))
                MealRow(title: "점심", menu: meals.date.lunch.joined(separator:", "))
                MealRow(title: "저녁", menu: meals.date.dinner.joined(separator:", "))
            }
        }
        .onAppear() {
            networkManager.getMeal { meals in
                self.meals = meals ?? DMSApi(date: DMSApi.Meal(breakfast: [""], lunch: [""], dinner: [""]))
            }
        }
    }
}

struct MealRow: View {
    let title: String
    let menu: String
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(title).foregroundColor(Color("DMS")).font(.system(size: 20)).fontWeight(.bold)
                Text(menu)
                    .font(.callout)
                Spacer()
            }.padding(.all, 25)
        }
        .frame(width: UIScreen.main.bounds.width - 70, height: UIScreen.main.bounds.height / 5.5)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: Color("lightDMS").opacity(0.3), radius: 5, x: 4, y: 4))
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
