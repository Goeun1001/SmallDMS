//
//  NetworkManager.swift
//  SmallDMS
//
//  Created by GoEun Jeong on 2021/03/04.
//

import UIKit

struct DMSApi: Codable {
    var date: Meal // 날짜
    
    struct Meal: Codable { // 아점저
        var breakfast: [String]
        var lunch: [String]
        var dinner: [String]
    }
    
    enum CodingKeys: String, CodingKey {
        case date = "2021-03-04" // 날짜
    }
}

class NetworkManager { // 서버와 통신하는 역할
    func getMeal(completion: @escaping (DMSApi?) -> Void) { // 급식을 가져오는 기능
        guard let url = URL(string: "https://api.dsm-dms.com/meal/2021-03-04") else { return } // 통신할 url
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET" // request 설정
        
        URLSession.shared.dataTask(with: request) { [weak self] data, res, err in // 연결학고 데이터와 응답, 에러를 받음.
            
            guard self != nil else { return }
            if let err = err { print(err.localizedDescription); return } // 만약 오류가 있으면 프린트
            print((res as! HTTPURLResponse).statusCode) // 상태코드가 어떻게 되는지 출력
            switch (res as! HTTPURLResponse).statusCode {
            
            case 200: // 서버와 통신이 성공했다면
                guard let data = data else { return }
                let meal = try? JSONDecoder().decode(DMSApi.self, from: data) // 데이터를 가공한다.
                print(meal)
                if let meal = meal { // 가공된 데이터가 정상이라면
                    DispatchQueue.main.async {
                        completion(meal)
                    }
                } else { // 데이터의 가공에 오류가 있었다면
                    completion(nil)
                }
                
            default: // 서버와 통신이 실패했다면
                DispatchQueue.main.async {
                    print((res as! HTTPURLResponse).statusCode) // 상태코드를 출력
                }
            }
        }.resume()
    }
}
