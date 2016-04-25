//
//  SectionInfo.swift
//  TableAccordion
//
//  Created by Alex Arboleda on 4/22/16.
//  Copyright © 2016. All rights reserved.
//

import UIKit

class SectionInfo: NSObject {
    var open: Bool = false  // set initial collapse status
    var itemsInSection: NSMutableArray = []
    var sectionTitle: String?
    
    init(itemsInSection: NSMutableArray, sectionTitle: String) {
        self.itemsInSection = itemsInSection
        self.sectionTitle = sectionTitle
    }

}
