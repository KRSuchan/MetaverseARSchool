//
//  ViewController.swift
//  HelloKIT
//
//  Created by snlcom on 2023/05/10.
//

import UIKit

class ViewController: UIViewController {
    
//  Button UIs
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var NextBtn: UIButton!
    
//  Label UIs
    @IBOutlet weak var AnimalLabel: UILabel!
    @IBOutlet weak var CatLabel: UILabel!
    
//  Image UIs
    @IBOutlet weak var BackGroundImage: UIImageView!
    @IBOutlet weak var CatImage: UIImageView!
    @IBOutlet weak var MierImage: UIImageView!
    @IBOutlet weak var MusicalCatsImage: UIImageView!
    @IBOutlet weak var CoffeeCatImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // view Control
        view.backgroundColor = .brown;
        
        // BackGroundImage Control
        BackGroundImage.image = UIImage(named: "subwayPattern")
        
        // AnimalLabel Control
        AnimalLabel.text = "Animal";
        AnimalLabel.backgroundColor = .gray;
        AnimalLabel.textColor = .green;
        AnimalLabel.textAlignment = .center;
        
        // CatLabel Control
        CatLabel.text = "Cat?Kat?";
        CatLabel.backgroundColor = .brown;
        CatLabel.textColor = .yellow;
        CatLabel.textAlignment = .center;
        
        // CatImage Control
        CatImage.image = UIImage(named: "cat")
        
        // MierImage Control
        MierImage.image=UIImage(named: "mierCat")
        
        // MusicalCatsImage Control
        MusicalCatsImage.image = UIImage(named: "MusicalCat")
        
        // CoffeeCatImage Control
        CoffeeCatImage.image = UIImage(named: "catCoffee")
        
        // NextBtn Control
        NextBtn.layer.cornerRadius=100/2
        
        // addButton Control
        addButton.layer.cornerRadius = 100/2
        
    }


}

