//
//  ViewController.swift
//  TheMovieDb
//
//  Created by Jose Antonio Trejo Flores on 09/12/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var moviesTableView: UITableView!
    var friends: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        moviesTableView.delegate = self
        moviesTableView.dataSource = self
        moviesTableView.allowsSelection = false
        fetchData()
    }
    
    func fetchData() {
        let group: DispatchGroup = DispatchGroup()
        
        group.enter()
        NetworkManager().getNewMovies(page: 1) {
            movies, _ in
            if movies?.count ?? 0 > 1 {
                self.friends = movies!
            }
            group.leave()
            
        }
        group.notify(queue: .main) {
            self.moviesTableView.reloadData()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = self.moviesTableView.dequeueReusableCell(withIdentifier: "customCell") as? CustomTableViewCell {
            let friend = friends[indexPath.row]
            cell.titleLabel.text = friend.title
            return cell
        }
        print("no es del tipo")
        return UITableViewCell()
        
    }
}
