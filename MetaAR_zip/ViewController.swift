//
//  ViewController.swift
//  MetaAR
//
//  Created by snlcom on 2023/05/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainBackImg: UIImageView!
    @IBOutlet weak var nextSceneBtn: UIButton!
    
    @IBOutlet weak var mainLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "MetaVerse is Future."
        mainLabel.textColor = .gray
        
        nextSceneBtn.backgroundColor = .black
        nextSceneBtn.titleLabel?.text = "Go Next!"
        nextSceneBtn.titleLabel?.textColor = .yellow
        nextSceneBtn.titleLabel?.text = "Go Next!"
        nextSceneBtn.layer.cornerRadius = 30;
        
        
        mainBackImg.image = UIImage(named: "ARimage")
        
    }


}

