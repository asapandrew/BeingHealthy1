//
//  RecipeDetailViewController.swift
//  BeingHealthy
//
//  Created by Artyom Pstygo on 17.03.2020.
//  Copyright © 2020 HSE 161 Krekhnov. All rights reserved.
//

import UIKit

class RecipeDetailViewController: UIViewController {
    private let recipe: Recipe

    private var label: UILabel!

    init(recipe: Recipe) {
        self.recipe = recipe
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white

        let label = UILabel()
        label.numberOfLines = 0
        self.label = label

        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20),
            label.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20)
        ])
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = recipe.title
        label.text = recipe.description
    }

}
