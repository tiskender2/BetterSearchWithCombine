//
//  Network.swift
//  CombineFramework
//
//  Created by Tolga İskender on 18.04.2020.
//  Copyright © 2020 Tolga İskender. All rights reserved.
//

import Foundation
class Network {
    let baseUrl = "http://www.omdbapi.com/?apikey=e0abddb9&"
    let searchUrl = "s="
    var search :String?
   
    static let shared = Network()
    
    func fetchSearchMovies(searchText:String,completionHandler: @escaping (MovieModel) -> Void) {
        
        if String(searchText.last ?? " ") == " " {
            search = searchText.replacingOccurrences(of: " ", with: "")
        } else {
            search = searchText.replacingOccurrences(of: " ", with: "%20")
            
        }
        let url = URL(string: baseUrl + searchUrl + (search ?? "Batman"))!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                (200...299).contains(httpResponse.statusCode) else {
                    print("Error with the response, unexpected status code: \(response)")
                    return
            }
            if let data = data,
                let movies = try? JSONDecoder().decode(MovieModel.self, from: data) {
                completionHandler(movies)
            }
        })
        task.resume()
    }
}

