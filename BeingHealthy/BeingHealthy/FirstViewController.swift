//
//  FirstViewController.swift
//  BeingHealthy
//
//  Created by Никита Крехнов on 14.12.2017.
//  Copyright © 2017 HSE 161 Krekhnov. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet var ageVar: UITextField!
    
    @IBOutlet var weightVar: UITextField!
    
    @IBOutlet var activityVar: UISegmentedControl!
    @IBOutlet var sexVar: UISegmentedControl!
    @IBOutlet var heightVar: UITextField!
    
    let recomendation = Recomendation.shared
    
    @IBAction func done(_ sender: UIButton) {
        
        var bmr: Double = 0
        var bmi : Double = 0
        var wat : Double = 0
        if let ageNum: Int = Int(ageVar.text!) {
            if let heightNum : Int = Int(heightVar.text!)  {
                if let weightNum : Int = Int(weightVar.text!)  {
                    switch sexVar.selectedSegmentIndex{
                    case 0:
                        bmr = 88.362+13.397 * Double(weightNum) + 4.799 * Double(heightNum) - 5.677 * Double(ageNum)
                        wat = Double(weightNum)*35-Double(weightNum)*20
                    case 1:
                        bmr = 447.593+9.247 * Double(weightNum)+3.098*Double(heightNum) - 4.330 * Double(ageNum)
                        wat = Double(weightNum)*31-Double(weightNum)*20
                    default:
                        bmr = 0
                        wat = 0
                    }
                    bmi = Double(weightNum)/pow(Double(heightNum)/100 , 2)
                }
            }
        }
        
        let trainFac = [1.375, 1.55, 1.725, 1.9]
        let selectedFac = trainFac[activityVar.selectedSegmentIndex]
        bmr *= selectedFac
        wat *= selectedFac
        recomendation.water = "Вы должны потреблять \(Int(wat)) миллитров воды в день"
        recomendation.calories = "Вы должны потреблять \(Int(bmr)) килокалорий для поддержания веса.\nИндекс массы тела = \(Int(bmi))."
    }
}

class Recomendation {
    
    static let shared = Recomendation()
    private init(){}
    
    var calories = ""
    var water = ""
}

