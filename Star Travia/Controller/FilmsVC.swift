//
//  FilmsVC.swift
//  Star Travia
//
//  Created by Ajinkya Sonar on 19/09/18.
//  Copyright © 2018 Ajinkya Sonar. All rights reserved.
//

import UIKit

class FilmsVC: UIViewController {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var episodeLbl: UILabel!
    @IBOutlet weak var directorLbl: UILabel!
    @IBOutlet weak var producerLbl: UILabel!
    @IBOutlet weak var releasedLbl: UILabel!
    @IBOutlet weak var crawlTxtView: UITextView!
    
    @IBOutlet weak var previousButton: FadeEnabledButton!
    
    @IBOutlet weak var nextButton: FadeEnabledButton!
    
    var person: Person!
    let api = FilmApi.instance
    var films = [String]()
    var currentFilm = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        films = person.filmUrls
        previousButton.isEnabled = false
        nextButton.isEnabled = films.count > 1
        guard let firstFilm = films.first else {return}
        getFilm(url: firstFilm)
        
    }
    
    
    func getFilm(url: String) {
        
        api.getFilms(url: url) { (film) in
            
            if let film = film {
                
               self.setupView(film: film)
            }
            
        }
    }
    
    func setupView(film: Film) {
        
        titleLbl.text = film.title
        episodeLbl.text = "\(film.episode)"
        directorLbl.text = film.director
        producerLbl.text = film.producer
        releasedLbl.text = film.releaseDate
        let stripped = film.crawl.replacingOccurrences(of: "\r", with: "")
        crawlTxtView.text = stripped.replacingOccurrences(of: "\n", with: "")
    }
    
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        currentFilm += 1
        setButtonState()
    }
    
    @IBAction func previousButton(_ sender: UIButton) {
        currentFilm -= 1
        setButtonState()
    }
    
    func setButtonState() {
        nextButton.isEnabled = currentFilm == films.count - 1 ? false : true
        previousButton.isEnabled = currentFilm == 0 ? false : true
        getFilm(url: films[currentFilm])
        
    }
    
}
