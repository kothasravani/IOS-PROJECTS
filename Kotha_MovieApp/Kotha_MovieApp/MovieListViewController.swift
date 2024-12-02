//
//  MovieListViewController.swift
//  Kotha_MovieApp
//
//  Created by Sravani Kotha on 11/21/24.
//
import UIKit

class MovieListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = movieListTableView.dequeueReusableCell(withIdentifier: "listCell", for: indexPath)
                let movie = movieList[indexPath.row]
                cell.textLabel?.text = movie.movieName
                return cell
    }
    
    @IBOutlet weak var movieListTableView: UITableView!
    // To store the selected genre
    var genre: String?
    // Changed type to [MovieList]
        var movieList: [MovieList] = []
        var selectedMovie: MovieList?
    
    //list of movies and genre in array form
    let movies: [Movies] = [
        Movies(genre: "Action", list_Array: [
            MovieList(movieName: "Avengers", movieImage: "avengers", movieInfo: "Avengers Assemble' ('The Avengers') is a truly enjoyable superhero film that lives up to its hype and creates a story that allows for four of the greatest superheroes to connect in this mega-blockbuster extravaganza."),
            MovieList(movieName: "John Wick", movieImage: "johnwick", movieInfo: "John Wick is a 2014 American action thriller film. Keanu Reeves stars as John Wick, a legendary hitman who comes out of retirement to seek revenge against the men who killed his dog, a final gift from his recently deceased wife."),
            MovieList(movieName: "Mad Max", movieImage: "madmax", movieInfo: "Mad Max films typically highlight their protagonists' struggle to reclaim their humanity in a dystopian wasteland that has taught them to place little value on kindness and decency."),
            MovieList(movieName: "The Dark Knight", movieImage: "darkknight", movieInfo: "The Dark Knight has been analyzed for its themes of terrorism and the limitations of morality and ethics. Batman faces the Joker."),
            MovieList(movieName: "Die Hard", movieImage: "diehard", movieInfo: "Die Hard is a husband/cop separated from his wife flies to Los Angeles for Christmas to win her back, but her work building is taken over by terrorists who he has to take down to save his wife and the other hostages.")
        ]),
        
        Movies(genre: "Drama", list_Array: [
            MovieList(movieName: "The Pursuit of Happyness", movieImage: "pursuit", movieInfo: "The pursuit of happiness is the foundation of individual liberty, since it gives us the ability to make decisions that are in our long-term best interest."),
            MovieList(movieName: "Forrest Gump", movieImage: "forrestgump", movieInfo: "Forrest Gump deals with finding the true meaning of the life despite facing numerous hurdles. It encourages never to stop and cry over the past experiences. The story is about a man named Forrest Gump."),
            MovieList(movieName: "The Godfather", movieImage: "godfather", movieInfo: "The Godfather explores a number of themes that have resonated with audiences over the years. The movie is a meditation on power, family, and loyalty, and it asks questions about what people are willing to do to protect those they love."),
            MovieList(movieName: "12 Angry Men", movieImage: "12angrymen", movieInfo: "Twelve men as they deliberate the conviction or acquittal of a teenager charged with murder on the basis of reasonable doubt; disagreement and conflict among the jurors forces them to question their morals and values."),
            MovieList(movieName: "Schindler's List", movieImage: "schindler", movieInfo: "Goeth believes war brings out the best in people, Schindler thinks the opposite. However the point of the movie doesn't support either of those beliefs. The point of the film is that war brings out the truth in people.")
        ]),
        
        Movies(genre: "Horror", list_Array: [
            MovieList(movieName: "It", movieImage: "it", movieInfo: "A killer clown terrorizes kids! A band of seven “uncool” 11-year-olds, led by Bill Denbrough, discovers and battles an evil, shape-changing monster that the children call “It.” "),
            MovieList(movieName: "The Conjuring", movieImage: "conjuring", movieInfo: "Lorraine is clairvoyant, but it's her instincts as a mother that help her know when something is wrong with her own child, or know what to do in order to save this family, especially the mother. "),
            MovieList(movieName: "A Quiet Place", movieImage: "quietplace", movieInfo: "The plot revolves around a mother and father who struggle to survive and raise their children in a post-apocalyptic world inhabited by blind extraterrestrial creatures with an acute sense of hearing."),
            MovieList(movieName: "The Shining", movieImage: "shining", movieInfo: "there's something inherently wrong with the human personality. There's an evil side to it. One of the things that horror stories can do is to show us the archetypes of the unconscious."),
            MovieList(movieName: "Get Out", movieImage: "getout", movieInfo: "The thing Get Out does so well—and the thing that will rankle with some viewers—is to show how, however unintentionally, these same people can make life so hard and uncomfortable for black people.")
        ]),
        
        Movies(genre: "Sci-Fi", list_Array: [
            MovieList(movieName: "Inception", movieImage: "inception", movieInfo: "Inception, Nolan wanted to explore the idea of people sharing a dream space... That gives you the ability to access somebody's unconscious mind. The majority of the film's plot takes place in these interconnected dream worlds."),
            MovieList(movieName: "Interstellar", movieImage: "interstellar", movieInfo: "we see humanity suffer as they try to become a multi-planetary species. At its core, this is a movie about humanity's sacrifices to survive."),
            MovieList(movieName: "Avatar", movieImage: "avatar", movieInfo: "A journey to Pandora! Avatar asks us to see that everything is connected, all human beings to each other, and us to the Earth. 'This is a clear statement of religious belief."),
            MovieList(movieName: "The Matrix", movieImage: "matrix", movieInfo: "Matrix represents philosophical concepts such as the brain being the main interpreter of reality. The franchise prompts viewers to question the nature of reality and artificial intelligence."),
            MovieList(movieName: "Dune", movieImage: "dune", movieInfo: "A battle for desert power! Dune explores the multilayered interactions of politics, religion, ecology, technology, and human emotion as the factions of the empire confront each other in a struggle for the control of Arrakis and its spice.")
        ])
    ]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backButtonTitle = "Movies"
        // Do any additional setup after loading the view.
        movieListTableView.delegate = self
                movieListTableView.dataSource = self
        populateMovies()
            }
            func populateMovies() {
                if let selectedGenre = genre {
                    if let movieGroup = movies.first(where: { $0.genre == selectedGenre }) {
                        movieList = movieGroup.list_Array
                        movieListTableView.reloadData()
                    }
                }
            }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "movieInfoSegue" {
            if let destinationVC = segue.destination as? MovieInfoViewController,
               let selectedIndexPath = movieListTableView.indexPathForSelectedRow {
                // Get the selected movie
                let selectedMovie = movieList[selectedIndexPath.row]
                destinationVC.movie = selectedMovie
            }
        }
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            selectedMovie = movieList[indexPath.row]
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

