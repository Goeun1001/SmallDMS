//
//  NetworkManager.swift
//  SmallDMS
//
//  Created by GoEun Jeong on 2021/03/04.
//

import UIKit

struct DMSApi: Codable {
    var date: Meal
    
    struct Meal: Codable {
        var breakfast: [String]
        var lunch: [String]
        var dinner: [String]
    }
    
    enum CodingKeys: String, CodingKey {
        case date = "2021-03-04"
    }
}

class NetworkManager {
    func getMeal(completion: @escaping (DMSApi?) -> Void) {
        guard let url = URL(string: "https://api.dsm-dms.com/meal/2021-03-04") else { return }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { [weak self] data, res, err in
            guard self != nil else { return }
            if let err = err { print(err.localizedDescription); return }
            print((res as! HTTPURLResponse).statusCode)
            switch (res as! HTTPURLResponse).statusCode {
            
            case 200:
                print("Detail 200")
                guard let data = data else { return }
                let meal = try? JSONDecoder().decode(DMSApi.self, from: data)
                print(meal)
                if let meal = meal {
                    DispatchQueue.main.async {
                        completion(meal)
                    }
                } else {
                    completion(nil)
                }
                
            default:
                DispatchQueue.main.async {
                    print((res as! HTTPURLResponse).statusCode)
                }
            }
        }.resume()
    }
}
