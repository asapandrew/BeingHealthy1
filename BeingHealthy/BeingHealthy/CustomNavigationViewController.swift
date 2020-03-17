//
//  CustomNavigationViewController.swift
//  BeingHealthy
//
//  Created by Artyom Pstygo on 17.03.2020.
//  Copyright © 2020 HSE 161 Krekhnov. All rights reserved.
//

import UIKit

class CustomNavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let recipeList = RecipeListViewController()
        pushViewController(recipeList, animated: false)
    }

}
