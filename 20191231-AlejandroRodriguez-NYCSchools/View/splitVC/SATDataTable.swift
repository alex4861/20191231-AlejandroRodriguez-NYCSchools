//
//  SATDataTable.swift
//  20191231-AlejandroRodriguez-NYCSchools
//
//  Created by José Alejandro Bravo Cedillo on 12/31/19.
//  Copyright © 2019 Terzigma. All rights reserved.
//

import UIKit

class SATDataTable: UITableViewController {

    @IBOutlet var writingScore: UILabel!
    @IBOutlet var mathScore: UILabel!
    @IBOutlet weak var avgScore: UILabel!
    @IBOutlet weak var testTakers: UILabel!
    var data = [DetailModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func reload(){
        let detailData = data.first

        writingScore.text = detailData?.sat_writing_avg_score
        mathScore.text = detailData?.sat_math_avg_score
        avgScore.text = detailData?.sat_critical_reading_avg_score
        testTakers.text = detailData?.num_of_sat_test_takers
        print(data)
    }
}
