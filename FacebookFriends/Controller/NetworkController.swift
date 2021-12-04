//
//  NetworkController.swift
//  FacebookFriends
//
//  Created by Rumeysa Yücel on 4.12.2021.
//

import UIKit

class NetworkController {
    
    func fetchPersonInfo(completion: @escaping (PersonInfo?) -> Void) {
        let url = URL(string: "https://randomuser.me/api/?results=20")!
        let dataTask = URLSession.shared.dataTask(with: url) { (data,_,error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let personInfoObject = try? jsonDecoder.decode(PersonInfo.self, from: data) {
                completion(personInfoObject)
            }else {
                completion(nil)
            }
        }
        dataTask.resume()
    }
    
    func fetchPersonPhoto(from url: URL,completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data,_,error) in
            if let data = data, let image = UIImage(data: data) {
                completion(image)
            }else {
                completion(nil)
            }
        }.resume()
    }
    
}
