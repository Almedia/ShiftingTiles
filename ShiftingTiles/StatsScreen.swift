//
//  StatsScreen.swift
//  ShiftingTiles
//
//  Created by Parker Lewis on 1/6/15.
//  Copyright (c) 2015 Parker Lewis. All rights reserved.
//

import Foundation
import UIKit


class StatsScreen: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let colorPalette = ColorPalette()

    var solvesPerSize = NSArray()
    let stats = Stats()
    
    // VIEWS
    @IBOutlet weak var statsLabel: UILabel!
    @IBOutlet weak var leftLabel: UILabel!
    @IBOutlet weak var rightLabel: UILabel!
    @IBOutlet weak var topBorder: UIView!
    @IBOutlet weak var statsTable: UITableView!
    @IBOutlet weak var bottomBorder: UIView!
    @IBOutlet weak var totalSolvesLabel: UILabel!
    
    // BUTTONS
    @IBOutlet weak var dismissButton: UIButton!
    
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        // Apply color scheme and font
        self.view.backgroundColor = self.colorPalette.fetchLightColor()
        self.topBorder.backgroundColor = self.colorPalette.fetchDarkColor()
        self.bottomBorder.backgroundColor = self.colorPalette.fetchDarkColor()
        self.statsLabel.textColor = self.colorPalette.fetchDarkColor()
        self.leftLabel.textColor = self.colorPalette.fetchDarkColor()
        self.rightLabel.textColor = self.colorPalette.fetchDarkColor()
        self.totalSolvesLabel.textColor = self.colorPalette.fetchDarkColor()

        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            self.statsLabel.font = UIFont(name: self.statsLabel.font.fontName, size: 35)
            self.leftLabel.font = UIFont(name: self.leftLabel.font.fontName, size: 25)
            self.rightLabel.font = UIFont(name: self.rightLabel.font.fontName, size: 25)
            self.totalSolvesLabel.font = UIFont(name: self.totalSolvesLabel.font.fontName, size: 25)
        }
        
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
            self.statsLabel.font = UIFont(name: self.statsLabel.font.fontName, size: 70)
            self.leftLabel.font = UIFont(name: self.leftLabel.font.fontName, size: 50)
            self.rightLabel.font = UIFont(name: self.rightLabel.font.fontName, size: 50)
            self.totalSolvesLabel.font = UIFont(name: self.totalSolvesLabel.font.fontName, size: 50)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.statsTable.dataSource = self
        self.statsTable.delegate = self
        
        var dismissTap = UITapGestureRecognizer(target: self, action: "dismissStatsScreen:")
        self.view.addGestureRecognizer(dismissTap)
        
        self.totalSolvesLabel.text = "Total:  \(self.stats.fetchTotalSolves())"
        
        // Get the solve stats and store in local array
        self.solvesPerSize = self.stats.fetchSolvesPerSize()
        
        
        let nib = UINib(nibName: "StatCell", bundle: NSBundle.mainBundle())
        self.statsTable.registerNib(nib, forCellReuseIdentifier: "STAT_CELL")

    }
    

    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = self.statsTable.dequeueReusableCellWithIdentifier("STAT_CELL", forIndexPath: indexPath) as StatCell
        
        cell.backgroundColor = self.colorPalette.fetchLightColor()
        cell.leftLabel.text = "\(indexPath.row + 2) x \(indexPath.row + 2)"
        cell.rightLabel.text = "\(self.solvesPerSize[indexPath.row])"
        cell.leftLabel.textColor = self.colorPalette.fetchDarkColor()
        cell.rightLabel.textColor = self.colorPalette.fetchDarkColor()
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Phone {
            cell.leftLabel.font = UIFont(name: cell.leftLabel.font.fontName, size: 15)
            cell.rightLabel.font = UIFont(name: cell.rightLabel.font.fontName, size: 15)
        }
        
        if UIDevice.currentDevice().userInterfaceIdiom == UIUserInterfaceIdiom.Pad {
            cell.leftLabel.font = UIFont(name: cell.leftLabel.font.fontName, size: 30)
            cell.rightLabel.font = UIFont(name: cell.rightLabel.font.fontName, size: 30)
        }


        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return self.statsTable.frame.height / 9
    }
    
    
    func dismissStatsScreen(sender: UIGestureRecognizer) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

}