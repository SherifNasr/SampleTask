//
//  EmployeeModel.swift
//  SampleTask
//
//  Created by Shrief Nasr on 2/24/20.
//  Copyright © 2020 Shrief Nasr. All rights reserved.
//

import Foundation


class EmployeeModel: Codable {
    let id: String?
    let name: String?
    let salary: String?
    let age: String?
    let image: String?

    enum CodingKeys: String, CodingKey {
        case id
        case name = "employee_name"
        case salary = "employee_salary"
        case age = "employee_age"
        case image = "profile_image"
    }

    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        name = try values.decodeIfPresent(String.self, forKey: .name)
        salary = try values.decodeIfPresent(String.self, forKey: .salary)
        age = try values.decodeIfPresent(String.self, forKey: .age)
        image = try values.decodeIfPresent(String.self, forKey: .image)
    }

}
