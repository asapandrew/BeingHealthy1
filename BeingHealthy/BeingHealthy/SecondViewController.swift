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

    override func viewDidLoad() {
        super.viewDidLoad()
        watRes1.text = Recomendation.shared.water
        calRes1.text = Recomendation.shared.calories
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

