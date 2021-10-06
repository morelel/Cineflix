//
//  DetailsViewController.swift
//  Cineflix
//
//  Created by emorel on 03/10/2021.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var viewTitle: UILabel!
    @IBOutlet weak var viewReleased: UILabel!
    @IBOutlet weak var viewImage: UIImageView!
    //var movies = [Movie]()
    var titleMovie = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
