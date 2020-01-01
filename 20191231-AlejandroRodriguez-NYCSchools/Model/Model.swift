//
//  Model.swift
//  20191231-AlejandroRodriguez-NYCSchools
//
//  Created by José Alejandro Bravo Cedillo on 12/31/19.
//  Copyright © 2019 Terzigma. All rights reserved.
//

import Foundation

struct Model: Codable {
    let dbn: String
    let school_name: String
    let phone_number: String
    let city:String
    let state_code:String
    let website:String
}
