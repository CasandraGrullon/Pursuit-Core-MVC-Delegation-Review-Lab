//
//  ViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Benjamin Stone on 8/19/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class MovieVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var movies = [Movie]()
    var currentFont : CGFloat = 17 {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        movies = Movie.allMovies
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingsVC = segue.destination as? TypeSettingsVC else {
            fatalError("could not downcast")
        }
        currentFont = settingsVC.updatedFont ?? 17
        settingsVC.delegate = self
    }
    
//    @IBAction func unwind(segue: UIStoryboardSegue) {
//        guard let newTextFont = segue.source as? TypeSettingsVC else {
//            fatalError("segue didn't work")
//        }
//        currentFont = newTextFont.updatedFont ?? 17
//        newTextFont.delegate = self
//    }
    

}
extension MovieVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath)
        
        let movie = movies[indexPath.row]
        
        cell.textLabel?.text = movie.name
        cell.detailTextLabel?.text = movie.year.description
        
        cell.textLabel?.font =  UIFont.systemFont(ofSize: currentFont)
        cell.detailTextLabel?.font =  UIFont.systemFont(ofSize: currentFont)
        
        return cell
    }
    
}
extension MovieVC: TextSizeDelegate {
    func didChangeText(size: CGFloat) {
        currentFont = size
    }
    
    
}
