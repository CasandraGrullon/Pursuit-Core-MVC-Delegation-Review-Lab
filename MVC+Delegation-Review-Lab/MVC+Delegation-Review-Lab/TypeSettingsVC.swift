//
//  TypeSettingsVC.swift
//  MVC+Delegation-Review-Lab
//
//  Created by casandra grullon on 11/20/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class TypeSettingsVC: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var fontSizeLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    
    var stepperFont: Double = 17.0 {
        didSet{
            let value = String(format: "%0.f", stepper.value)
            fontSizeLabel.text = "Preview Font Size: \(value)"
        }
    }
    
    var sliderFont: Float = 17.0 {
        didSet {
            let value = String(format: "%0.f", slider.value)
            fontSizeLabel.text = "Preview Font Size: \(value)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
    }


    func configureSlider() {
        slider.minimumValue = 8.0
        slider.maximumValue = 40.0
        slider.value = 17.0
    }
    
    func configureStepper() {
        stepper.minimumValue = 8.0
        stepper.maximumValue = 40.0
        stepper.value = 17.0
        stepper.stepValue = 1.0
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        sliderFont = sender.value
        stepper.value = Double(sender.value)
        
    }
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        stepperFont = sender.value
        slider.value = Float(sender.value)
    }
    
    
}
