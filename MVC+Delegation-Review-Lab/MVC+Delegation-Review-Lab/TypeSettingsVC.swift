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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSlider()
        configureStepper()
    }

    var currentTextSizeSlider: Float = 17 {
        didSet{
            fontSizeLabel.text = "Preview Font Size: \(slider.value)"
        }
    }
    func configureSlider() {
        slider.minimumValue = 6
        slider.maximumValue = 40
        slider.value = 17
    }
    
    func configureStepper() {
        stepper.minimumValue = Double(slider.minimumValue)
        stepper.maximumValue = Double(slider.maximumValue)
        stepper.value = Double(slider.value)
    }
    
    
    @IBAction func sliderAction(_ sender: UISlider) {
        currentTextSizeSlider = sender.value
    }
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        currentTextSizeSlider = sender.value
    }
    
    
}
