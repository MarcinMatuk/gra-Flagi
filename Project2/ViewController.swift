//
//  ViewController.swift
//  Project2
//
//  Created by Marcin Matuk on 10/06/2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var countries = ["Estonii", "Francji", "Niemiec", "Irlandii", "Włoch", "Monako", "Nigerii", "Polski", "Rosji", "Hiszpanii", "Wielkiej Brytanii", "USA"]
    var score = 0
    var correctAnswer = 0
    var ktoreToPytanie = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor

        askQuestion(action: nil)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(wynik))
        
    }
        
    func askQuestion(action: UIAlertAction!) {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        
        let flaga = countries[correctAnswer]
        
        title = "Wskaż flagę \(flaga):          Pytanie: \(ktoreToPytanie)/10"
            
            button1.setImage(UIImage(named: countries[0]), for: .normal)
            button2.setImage(UIImage(named: countries[1]), for: .normal)
            button3.setImage(UIImage(named: countries[2]), for: .normal)
        
    }
    @IBAction func buttonTapped(_ sender: UIButton) {
        var title: String
        var wiadomosc: String
        
        wiadomosc = """
            To są flagi:
            \(countries[0]),
            \(countries[1]),
            \(countries[2]).
            """
        
        if sender.tag == correctAnswer {
            title = "Dobrze"
            score += 1
            ktoreToPytanie += 1
        } else {
            title = "Źle! \(wiadomosc)"
            ktoreToPytanie += 1
        }
        
        if ktoreToPytanie == 11 {
            
            let abc = UIAlertController(title: "KONIEC", message: "Zdobyłeś \(score) na 10 punktów! Gratulacje!!!", preferredStyle: .alert)
            present(abc, animated: true)
        }
        
        let ac = UIAlertController(title: title, message: "", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Dalej", style: .default, handler: askQuestion))
        present(ac, animated: true)
    }
    
    
    
    @objc func wynik() {
        
        let ac2 = UIAlertController(title: "WYNIK", message: "Masz \(score) punktów", preferredStyle: .alert)
        ac2.addAction(UIAlertAction(title: "graj dalej", style: .default, handler: askQuestion))
        present(ac2, animated: true)
    }
}

