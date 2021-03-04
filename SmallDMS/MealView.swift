//
//  MealView.swift
//  SmallDMS
//
//  Created by GoEun Jeong on 2021/03/04.
//

import SwiftUI

struct MealView: View {
    var body: some View {
        VStack(spacing: 40) {
            HStack(spacing: 40) {
                Image(systemName: "arrow.left")
                    .resizable()
                    .frame(width: 30, height: 30)
                VStack(spacing: 10) {
                    Text("2021년 03월 04일").foregroundColor(.gray)
                    Text("목요일 식단표")
                }.font(.system(size: 20))
                Image(systemName: "arrow.right")
                    .resizable()
                    .frame(width: 30, height: 30)
            }
            MealRow()
            MealRow()
            MealRow()
        }
    }
}

struct MealRow: View {
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 10) {
                Text("아침").foregroundColor(.blue).font(.system(size: 22)).fontWeight(.bold)
                Text("소고기 야채죽, 소고기 야채죽, 소고기 야채죽, 소고기 야채죽, 소고기 야채죽, 소고기 야채죽,")
                Spacer()
            }.padding(.all, 20)
        }
        .frame(width: UIScreen.main.bounds.width - 50, height: UIScreen.main.bounds.height / 5)
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: Color.blue.opacity(0.5), radius: 5, x: 4, y: 4))
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
