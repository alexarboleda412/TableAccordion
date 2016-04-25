//
//  SectionHeaderView.swift
//  TableAccordion
//
//  Created by Alex Arboleda on 4/22/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

protocol SectionHeaderViewDelegate {
    func sectionHeaderView(sectionHeaderView: SectionHeaderView, section: Int)
}

class SectionHeaderView: UITableViewHeaderFooterView {

    var delegate: SectionHeaderViewDelegate?
    var section: Int?
    @IBOutlet weak var titleLabel: UILabel!
    
    func toggleOpen() {
        self.delegate?.sectionHeaderView(self, section: self.section!)
    }
    
    override func awakeFromNib() {
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(SectionHeaderView.toggleOpen))
        self.addGestureRecognizer(tapGesture)
    }
}
