//
//  NetworkService.swift
//  ReminderApp
//
//  Created by Nikita Evdokimov on 12.03.2022.
//

//"https://jsonplaceholder.typicode.com/posts/1/comments"
//"https://jsonplaceholder.typicode.com/comments"
import Foundation

class NetworkService {
    private init() {}
    static let shared = NetworkService()
    
    public func getData(url: URL, completion: @escaping (Any) -> ()) {
        let session = URLSession.shared
        
        session.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
//                print(json)
                DispatchQueue.main.async {
                    completion(json )
                }
            } catch {
               print(error)
            }
        }.resume()
    }
}
