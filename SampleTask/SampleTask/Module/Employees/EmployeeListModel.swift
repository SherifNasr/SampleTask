//
//  EmployeeListModel.swift
//  SampleTask
//
//  Created by Shrief Nasr on 2/24/20.
//  Copyright © 2020 Shrief Nasr. All rights reserved.
//

import Foundation

class EmployeeListModel: Codable {
    let status: String?
    let employees: [EmployeeModel]?

    enum CodingKeys: String, CodingKey {
        case status
        case employees = "data"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        employees = try values.decodeIfPresent([EmployeeModel].self, forKey: .employees)
    }

}
