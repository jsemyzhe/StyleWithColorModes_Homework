//
//  HeaderCollectionReusableView.swift
//  Style
//
//  Created by Julia Semyzhenko on 8/1/22.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    @IBOutlet weak var headerLabel: UILabel!
    
    func changeFontAndSize() {
        headerLabel.font =  UIFont.sansProBlack(30)
        headerLabel.textColor = Modes.currentMode.textColor
    }
    func sourceSansProForHeader() {
        headerLabel.font =  UIFont.sansProBlack(15)
    }
    
}
