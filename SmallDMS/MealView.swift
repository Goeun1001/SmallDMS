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
        ZStack { // xyz의 z
            Color("lightGray").ignoresSafeArea() // 배경으로 깜. ignoreSafeArea란?
            
            VStack(spacing: 40) { // VerticalStack. 세로. spacing은 간격이다.
                HStack(spacing: 40) { // HorizontalStack. 가로.
                    Image("leftArrow") // 이미지
                        .resizable() // 크기 변경을 위해 선언
                        .frame(width: 30, height: 30) // 크기 조정. 너비와 높이
                    VStack(spacing: 5) {
                        Text("2021년 03월 04일").foregroundColor(.gray) // foregroundColor로 text의 색 지정.
                        Text("목요일 식단표")
                    }.font(.system(size: 20)) // 폰트의 크기
                    Image("rightArrow")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                MealRow(title: "아침", menu: meals.date.breakfast.joined(separator:", ")) // breakfast: [String]이니 이것을 ", "로 구분한 String으로 변환.
                MealRow(title: "점심", menu: meals.date.lunch.joined(separator:", "))
                MealRow(title: "저녁", menu: meals.date.dinner.joined(separator:", "))
            }
        }
        .onAppear() { // 이 뷰가 띄워졌을 때
            networkManager.getMeal { meals in // 서버와 연결을 해서
                self.meals = meals ?? DMSApi(date: DMSApi.Meal(breakfast: [""], lunch: [""], dinner: [""]))
                // 가지고 있는 meals에 데이터를 넣는다. 실패한다면 빈 데이터를 넣는다.
            }
        }
    }
}

struct MealRow: View {
    let title: String
    let menu: String
    var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 5) { // alignment: 정렬. .leading은 왼쪽부터, .trailing은 오른쪽부터
                Text(title).foregroundColor(Color("DMS")).font(.system(size: 20)).fontWeight(.bold) // fontWeight는 굵기.
                Text(menu)
                    .font(.callout) // font는 크기
                Spacer() // 빈 공간
            }.padding(.all, 25) // 패딩. 텍스트와 배경의 간격
        }
        .frame(width: UIScreen.main.bounds.width - 70, height: UIScreen.main.bounds.height / 5.5) // UIScreen.main.bounds.width는 폰 스크린의 너비이다.
        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).shadow(color: Color("lightDMS").opacity(0.3), radius: 5, x: 4, y: 4)) // 배경으로 하얀색에 그림장가 있는 둥근사각형을 깐다.
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView()
    }
}
