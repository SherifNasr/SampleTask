//
//  EmployeeListInteractor.swift
//  SampleTask
//
//  Created by Shrief Nasr on 2/24/20.
//  Copyright © 2020 Shrief Nasr. All rights reserved.
//

import Foundation

class BaseInteractor {
    // for common initialization 
}

protocol EmployeeListInteractorDelegate: class {
    func didgetEmployeeList(employees: [EmployeeModel])
}

class EmployeeListInteractor: BaseInteractor {
    weak var delegate: EmployeeListInteractorDelegate?
    
    func getAllEmployees() {
        let req = BaseRequest()
        req.apiName = .employees
        req.identifier = API.employees.rawValue
        req.httpMethod = .get
        Network.shared.execute(EmployeeListModel.self, baseRequest: req) {[weak self] (response, error) in
            guard let `self` = self else {return}
            guard let employeeList = response else {return}
            self.delegate?.didgetEmployeeList(employees: employeeList.employees ?? [])
        }
    }
    
}
