//
//  RecipeListViewController.swift
//  BeingHealthy
//
//  Created by Artyom Pstygo on 17.03.2020.
//  Copyright © 2020 HSE 161 Krekhnov. All rights reserved.
//

import UIKit

class RecipeListViewController: UITableViewController {

    private var recipes = RecipeListViewController.createRecipes() {
        didSet { tableView.reloadData() }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Список рецептов"

        DispatchQueue.init(label: "com.being-healthy.backgroundQueue").async {
            if let data = try? Data(contentsOf: URL(string: "https://jsonplaceholder.typicode.com/todos/1")!) {
                let decoder = JSONDecoder()
                let newRecipes = (try? decoder.decode([Recipe].self, from: data)) ?? []

                DispatchQueue.main.async {
                    self.recipes = newRecipes
                }
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let recipe = recipes[indexPath.item]
        cell.textLabel?.text = recipe.title
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = RecipeDetailViewController(recipe: recipes[indexPath.item])
        navigationController?.pushViewController(detailVC, animated: true)
    }

    private static func createRecipes() -> [Recipe] {
        return [
            Recipe(title: "Салат-коктейль из креветок", description: #"""
            Способ приготовления:

            1. Креветки опустить в кипящую подсоленную воду, варить в течение 3 минут, откинуть на дуршлаг, остудить и очистить.

            2. Обжаривать креветки в масле до появления румяного оттенка. Затем переложить в чистую посуду, сбрызнуть лимонным соком и оставить на 30 минут, после чего жидкость слить.

            3. Помидор, огурец и сладкий перец нарезать ломтиками, лук — полукольцами. Подготовленные ингредиенты выложить в салатник, посолить, поперчить, влить вино, оставшийся лимонный сок, оливковое масло и все перемешать.

            Время готовки: 40 мин.

            Калорийность: 55ккал
            """#)
        ]
    }

}
