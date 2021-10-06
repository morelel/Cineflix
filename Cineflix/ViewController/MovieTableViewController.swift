//
//  MovieTableViewController.swift
//  Cineflix
//
//  Created by emorel on 30/09/2021.
//

import Foundation
import UIKit
import SwiftUI

class MovieTableViewController: UIViewController, UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "http://www.omdbapi.com/?i=tt3896198&apikey=2817f938")!
        URLSession.shared.fetchData(for: url) { (result: Result<[Movies], Error>) in
          switch result {
          case .success(let toDos):
            // Woo, we got our todo list
          print("data ok")
          case .failure(let error):
            // Ohno, an error, let's handle it
          print("error data")
          }
        }
    }

    func loadMovies()  {
        //API URL
        let urlString = "http://www.omdbapi.com/?i=tt3896198&apikey=2817f938"
        //getData(from: urlString)
        displayMovieDetails()
    }
    
    //Configurer la view
    private func displayMovieDetails(){
        //Reload tableView to refresh is content
        tableView.reloadData()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "CellViewController"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CellViewController  else {
            fatalError("The dequeued cell is not an instance of CellViewController.")
        }
        
        cell.viewTitle.text = "Titre du film"
        tableView.rowHeight = 118
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "detailMovie" {
            _ = segue.destination as! DetailsViewController
        }
        
    }
}

struct Movies: Decodable {
    let title: String
    let rating: Int
    let released: Date
    let genre: String
    let casting: String
    let audience: Int
    let critics: Int
    let synopsis: String
    let isComplete: Bool
    
    enum CodingKeys: String, CodingKey {
        case isComplete = "completed"
        case title, rating, released, genre, casting, audience, critics, synopsis
      }
}

extension URLSession {
  func fetchData<T: Decodable>(for url: URL, completion: @escaping (Result<T, Error>) -> Void) {
    self.dataTask(with: url) { (data, response, error) in
      if let error = error {
        completion(.failure(error))
      }

      if let data = data {
        do {
          let object = try JSONDecoder().decode(T.self, from: data)
          completion(.success(object))
        } catch let decoderError {
          completion(.failure(decoderError))
        }
      }
    }.resume()
  }
}

