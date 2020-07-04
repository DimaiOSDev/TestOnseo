//
//  PrivacyPolicyViewController.swift
//  TestOnseo
//
//  Created by Дмитро Мостовий on 04.07.2020.
//  Copyright © 2020 Дмитро Мостовий. All rights reserved.
//

import UIKit

protocol BaseViewControllerProtocol: class {
    func showMessageAlert(_ message: String)
    func showErrorAlert(message: String)
    func showChoiceAlert(title: String? , message: String?, customActions: [UIAlertAction])
}

protocol PrivacyPolicyViewControllerProtocol: BaseViewControllerProtocol {
    func showHome()
}

class PrivacyPolicyViewController: UIViewController {
        
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var placeholderButtonLabel: UILabel!
    @IBOutlet weak var agreeButton: UIButton!
    
    // MARK: - Properties
    var presenter: PrivacyPolicyPresenterProtocol!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter = PrivacyPolicyPresenter(view: self)
        
        setupViews()
    }
    
    // MARK: - UI
    private func setupViews() {
        agreeButton.viewCorner(8)
    }
    
    // MARK: - IBActions
    @IBAction func pressCancelButton(_ sender: UIButton) {
        presenter.pressCancel()
    }
    
    @IBAction func pressAgreeButton(_ sender: UIButton) {
        presenter.pressAgree()
    }
    
}

extension PrivacyPolicyViewController: PrivacyPolicyViewControllerProtocol {
    
    func showHome() {
        let nv = UINavigationController(rootViewController: MoviesViewController.instance(.home))
        UIApplication.shared.keyWindow?.rootViewController = nv
    }
}
