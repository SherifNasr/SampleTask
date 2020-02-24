//
//  EmployeeListPresenter.swift
//  SampleTask
//
//  Created by Shrief Nasr on 2/24/20.
//  Copyright © 2020 Shrief Nasr. All rights reserved.
//

import Foundation

class BasePresenter {
    var interactor: BaseInteractor?
}

protocol EmployeeListPresenterDelegate: class {
    func didgetEmployeeList(employees: [EmployeeModel])
}

class EmployeeListPresenter: BasePresenter {
    weak var delegate: EmployeeListPresenterDelegate?
    override init() {
        super.init()
        interactor = EmployeeListInteractor()
        (interactor as? EmployeeListInteractor)?.delegate = self
    }
    
    func getEmployeeList(){
        (interactor as? EmployeeListInteractor)?.getAllEmployees()
    }
    
    func showDetails(of employee:EmployeeModel){
        //Router path
    }
}

extension EmployeeListPresenter: EmployeeListInteractorDelegate {
    func didgetEmployeeList(employees: [EmployeeModel]) {
        self.delegate?.didgetEmployeeList(employees: employees)
    }
}
