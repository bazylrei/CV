//
//  CVListViewController.swift
//  CV
//
//  Created by Bazyl Reinstein on 2/3/20.
//  Copyright © 2020 Bazyl Reinstein. All rights reserved.
//

import UIKit

class CVListViewController: UIViewController {

    let viewModel: CVListViewModelType = CVListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchCVList()
    }

}
