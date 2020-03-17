//
//  SecondViewController.swift
//  BeingHealthy
//
//  Created by Никита Крехнов on 14.12.2017.
//  Copyright © 2017 HSE 161 Krekhnov. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var watRes1: UILabel!
    @IBOutlet var calRes1: UILabel!

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        watRes1.text = Recomendation.shared.water
        calRes1.text = Recomendation.shared.calories
    }
    
}

