//
//  PrincipalViewController.swift
//  20191231-AlejandroRodriguez-NYCSchools
//
//  Created by José Alejandro Bravo Cedillo on 12/31/19.
//  Copyright © 2019 Terzigma. All rights reserved.
//

import UIKit

class PrincipalViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    var data = [DetailModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        name.text = data.first?.school_name
        if let satDataTable = self.children.first as? SATDataTable {
            satDataTable.data = data
            satDataTable.reload()
           }
        // Do any additional setup after loading the view.
    }    
}
