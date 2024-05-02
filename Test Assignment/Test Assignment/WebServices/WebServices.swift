//
//  WebServices.swift
//  Test Assignment
//
//  Created by Jenish's MacBook on 02/05/24.
//

import Foundation


// MARK: Webservices Call For API call.
class WebServices {
    
    //MARK: Create static instatnce and make Webservices Singalton call
    static let shared = WebServices()
    
    var Post_Model:[PostModel] = []

    //MARK: BaseURL of API
    private let BaseURL = "https://jsonplaceholder.typicode.com"
    
    //MARK: Create fatchPosts API calling function.
    func fetchPosts(pageNumber: Int, pageSize: Int, completion: @escaping (Bool, Error?) -> Void) {
    
        guard let url = URL(string: "\(BaseURL)/posts?_page=\(pageNumber)&_limit=\(pageSize)") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            
            if let error = error {
                print("Error fetching data: \(error)")
                completion(false, error)
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode) else {
                print("Invalid response")
                completion(false, error)
                return
            }
            
            if let data = data {
                do {
                    let decoder = JSONDecoder()
                    let newPosts = try decoder.decode([PostModel].self, from: data)
                    DispatchQueue.main.async {
                        self.Post_Model.append(contentsOf: newPosts)
//                        self.tableView.reloadData()
                        completion(true, nil)
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                    completion(false, error)
                }
            }
        }.resume()
    }
    
}
