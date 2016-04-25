//
//  TableViewController.swift
//  TableAccordion
//
//  Created by Alex Arboleda on 4/22/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, SectionHeaderViewDelegate {
    
    let SectionHeaderViewIdentifier = "SectionHeaderViewIdentifier"
    
    var sectionInfoArray: NSMutableArray = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sectionHeaderNib: UINib = UINib(nibName: "SectionHeaderView", bundle: nil)
        self.tableView.registerNib(sectionHeaderNib, forHeaderFooterViewReuseIdentifier: SectionHeaderViewIdentifier)
        
        
        tableView.registerNib(UINib(nibName: "SectionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: SectionHeaderViewIdentifier)
        
        // you can change section height based on your needs
        self.tableView.sectionHeaderHeight = 60
        
        // You should set up your SectionInfo here
        let sectionA: SectionInfo = SectionInfo(itemsInSection: ["1", "2", "3", "1", "2", "1", "2", "1", "2", "1", "2", "1", "2"], sectionTitle: "ASD")
        let sectionB: SectionInfo = SectionInfo(itemsInSection: ["4", "5"], sectionTitle: "EFG")
        let sectionC: SectionInfo = SectionInfo(itemsInSection: ["6", "7", "8", "9"], sectionTitle: "HJK")
        let sectionD: SectionInfo = SectionInfo(itemsInSection: ["16", "17", "18", "19"], sectionTitle: "BNM")
        let sectionE: SectionInfo = SectionInfo(itemsInSection: ["16"], sectionTitle: "YUI")
        sectionInfoArray.addObjectsFromArray([sectionA, sectionB, sectionC, sectionD, sectionE])
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionInfoArray.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.sectionInfoArray.count > 0 {
            let sectionInfo: SectionInfo = sectionInfoArray[section] as! SectionInfo
            if sectionInfo.open {
                return sectionInfo.open ? sectionInfo.itemsInSection.count : 0
            }
        }
        return 0
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionHeaderView = self.tableView.dequeueReusableHeaderFooterViewWithIdentifier(SectionHeaderViewIdentifier) as! SectionHeaderView
        let sectionInfo: SectionInfo = sectionInfoArray[section] as! SectionInfo
        
        sectionHeaderView.titleLabel.text = sectionInfo.sectionTitle
        sectionHeaderView.section = section
        sectionHeaderView.delegate = self
        
        return sectionHeaderView
    }
    
    func sectionHeaderView(sectionHeaderView: SectionHeaderView, section: Int) {
        
        
        let sectionInfo: SectionInfo = sectionInfoArray[section] as! SectionInfo
        let countOfRowsToAction = sectionInfo.itemsInSection.count
        sectionInfo.open = !sectionInfo.open
        var indexPathToAction: [NSIndexPath] = []
        if countOfRowsToAction > 0 {
            for i in 0..<countOfRowsToAction {
                indexPathToAction.append(NSIndexPath(forRow: i, inSection: section))
            }
            
            if sectionInfo.open {
                 self.tableView.insertRowsAtIndexPaths(indexPathToAction as [NSIndexPath], withRowAnimation: .Fade)
            } else {
                self.tableView.deleteRowsAtIndexPaths(indexPathToAction as [NSIndexPath], withRowAnimation:.Fade)
            }
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = "\(indexPath.section) :: \(indexPath.row)"
        return cell
    }
}
