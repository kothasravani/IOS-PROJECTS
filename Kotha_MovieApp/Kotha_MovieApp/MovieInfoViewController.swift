//
//  MovieInfoViewController.swift
//  Kotha_MovieApp
//
//  Created by Sravani Kotha on 11/21/24.
//
import UIKit

class MovieInfoViewController: UIViewController {
    @IBOutlet weak var movieImageViewOutlet: UIImageView!
    @IBOutlet weak var movieInfoOutlet: UITextView!

    var movie: MovieList?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = movie?.movieName
        setupMovieDetails()
        // Do any additional setup after loading the view.
    }
    func setupMovieDetails() {
            if let movie = movie {
                        // Set the movie image and movie info
                        movieImageViewOutlet.image = UIImage(named: movie.movieImage)
                        movieInfoOutlet.text = ""
                        animateMovieImage()
                    }
        }
    @IBAction func showInfoAction(_ sender: UIButton) {
        movieInfoOutlet.text = movie?.movieInfo
    }
    func animateMovieImage() {
        movieImageViewOutlet.alpha = 0
        UIView.animate(withDuration: 1.5) {
            self.movieImageViewOutlet.alpha = 1
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
