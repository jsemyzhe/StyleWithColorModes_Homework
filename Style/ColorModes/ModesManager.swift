//
//  ModesManager.swift
//  Style
//
//  Created by Julia Semyzhenko on 8/1/22.
//

import UIKit

protocol ModesProtocol {
    var backgroundColor: UIColor { get }
    var textColor: UIColor { get }
}


class Modes {
    
    static var currentMode: ModesProtocol =
    {
        if UserDefaults.standard.string(forKey: "Mode") == "LightMode" {
            return LightMode()
        }
        else if UserDefaults.standard.string(forKey: "Mode") == "DarkMode" {
            return DarkMode()
        }
        else  {
            return RedMode()
        }
    }()
}
