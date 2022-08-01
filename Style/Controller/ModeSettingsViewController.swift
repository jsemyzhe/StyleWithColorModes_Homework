//
//  ModeSettingsViewController.swift
//  Style
//
//  Created by Julia Semyzhenko on 8/1/22.
//

import UIKit

class ModeSettingsViewController: UIViewController {
    
    @IBOutlet weak var dark: UISwitch!
    @IBOutlet weak var red: UISwitch!
    @IBOutlet weak var light: UISwitch!
    @IBOutlet var labels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Modes.currentMode.backgroundColor
        
        for label in labels {
            label.textColor = Modes.currentMode.textColor
        }
        
        switch UserDefaults.standard.string(forKey: "Mode") {
        case "LightMode":
            red.isOn = false
            light.isOn = true
            dark.isOn = false
        case "DarkMode":
            red.isOn = false
            light.isOn = false
            dark.isOn = true
        default:
            red.isOn = true
            light.isOn = false
            dark.isOn = false
            
        }
    }
    //MARK: - Color Mode switchers actions
    @IBAction func darkMode(_ sender: UISwitch) {
        
        Modes.currentMode = DarkMode()
        UserDefaults.standard.set("DarkMode", forKey: "Mode")
        dark.isOn = true
        light.isOn = false
        red.isOn = false
        viewDidLoad()
    }
    
    @IBAction func lightmode(_ sender: UISwitch) {
        
        Modes.currentMode = LightMode()
        UserDefaults.standard.set("LightMode", forKey: "Mode" )
        light.isOn = true
        dark.isOn = false
        red.isOn = false
        viewDidLoad()
    }
    
    @IBAction func redMode(_ sender: UISwitch) {
        
        Modes.currentMode = RedMode()
        UserDefaults.standard.set("RedMode", forKey: "Mode")
        red.isOn = true
        dark.isOn = false
        light.isOn = false
        viewDidLoad()
    }
}
