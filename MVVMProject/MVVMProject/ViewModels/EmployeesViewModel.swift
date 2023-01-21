//
//  EmployeesViewModel.swift
//  MVVMProject
//
//  Created by Santos, Rafael Costa on 21/01/2023.
//

import Foundation

class EmployeesViewModel: NSObject {
    
    private var apiService: APIService!
    private(set) var empData: Employees! {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }
    
    var bindEmployeeViewModelToController : (() -> ()) = {}
 
    override init() {
        super.init()
        
        self.apiService = APIService()
        callFuncToGetEmpData()
    }
    
    func callFuncToGetEmpData() {
        self.apiService.apiToGetEmployeeData { [weak self] empData in
            guard let self = self else { return }
            print("Data: \(empData)")
            self.empData = empData
        }
    }
}


