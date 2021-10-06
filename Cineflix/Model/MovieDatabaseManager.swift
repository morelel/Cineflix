//
//  MovieDatabaseManager.swift
//  Cineflix
//
//  Created by emorel on 30/09/2021.
//

import Foundation

class MovieDatabaseManager {
    
    //API URL
    let urlString = "http://www.omdbapi.com/?i=tt3896198&apikey=2817f938"
    
    //Struct
    struct Response: Codable {
        let results: allMovies
    }
    
    struct allMovies: Codable {
        let title: String
        let rating: Int
        let released: Date
        let genre: String
        let casting: String
        let audience: Int
        let critics: Int
        let synopsis: String
    }
    
    func getData(from url: String) {
        
    }
    
//    func getJson(completion: @escaping (Response) -> ()) {
//
//        if let url = URL(string: urlString) {
//            URLSession.shared.dataTask(with: url) { data, res, error in
//                if let data = data {
//                    print("ok")
//                    let decoder = JSONDecoder()
//                    if let json = try? decoder.decode(Response.self, from: data){
//                        print(json)
//                    }
//                }
//            }.resume()
//        }
//    }
        
}
