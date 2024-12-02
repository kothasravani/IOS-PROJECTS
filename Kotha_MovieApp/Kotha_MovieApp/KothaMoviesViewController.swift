//
//  ViewController.swift
//  Kotha_MovieApp
//
//  Created by Sravani Kotha on 11/21/24.
//

import UIKit

class KothaMoviesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return genres.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath)
        cell.textLabel?.text = genres[indexPath.row]
        return cell
    }
    
    
    @IBOutlet weak var moviesTableView: UITableView!
    //declaring variables named genres
    var genres = ["Action", "Drama", "Horror", "Sci-Fi"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self navigation
        self.navigationItem.backButtonTitle = "Genres"
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let transition = segue.identifier
        if transition == "listsSegue" {
            let destination = segue.destination as! MovieListViewController
            destination.genre = genres[moviesTableView.indexPathForSelectedRow!.row]
            
        }
        
    }
    
}
