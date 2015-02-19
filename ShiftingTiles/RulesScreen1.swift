//
//  RulesScreen1.swift
//  ShiftingTiles
//
//  Created by Parker Lewis on 1/15/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

import UIKit

class RulesScreen1: UIViewController {

    let colorPalette = ColorPalette()
    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!
    @IBOutlet weak var label5: UILabel!
    
    @IBOutlet weak var scrambledImage: UIImageView!
    @IBOutlet weak var arrowImage: UIImageView!
    @IBOutlet weak var solvedImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            self.label1.font = UIFont(name: "OpenSans", size: 15)
            self.label2.font = UIFont(name: "OpenSans", size: 15)
            self.label3.font = UIFont(name: "OpenSans", size: 15)
            self.label4.font = UIFont(name: "OpenSans", size: 15)
            self.label5.font = UIFont(name: "OpenSans", size: 15)
        }
        
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
            self.label1.font = UIFont(name: "OpenSans", size: 30)
            self.label2.font = UIFont(name: "OpenSans", size: 30)
            self.label3.font = UIFont(name: "OpenSans", size: 30)
            self.label4.font = UIFont(name: "OpenSans", size: 30)
            self.label5.font = UIFont(name: "OpenSans", size: 30)
        }
        

        self.label1.text = NSLocalizedString("Rules1_Part1", comment: "")
        self.label2.text = NSLocalizedString("Rules1_Part2", comment: "")
        self.label3.text = NSLocalizedString("Rules1_Part3", comment: "")
        self.label4.text = NSLocalizedString("Rules1_Part4", comment: "")
        self.label5.text = NSLocalizedString("Rules1_Part5", comment: "")
        
        
        self.label1.textColor = self.colorPalette.fetchDarkColor()
        self.label2.textColor = self.colorPalette.fetchDarkColor()
        self.label3.textColor = self.colorPalette.fetchDarkColor()
        self.label4.textColor = self.colorPalette.fetchDarkColor()
        self.label5.textColor = self.colorPalette.fetchDarkColor()

        
        self.scrambledImage.layer.borderColor = self.colorPalette.fetchDarkColor().CGColor
        self.scrambledImage.layer.borderWidth = 2
        self.solvedImage.layer.borderColor = self.colorPalette.fetchDarkColor().CGColor
        self.solvedImage.layer.borderWidth = 2
        
        self.arrowImage.image = self.arrowImage.image?.imageWithColor(self.colorPalette.fetchDarkColor())

        
    }


}
