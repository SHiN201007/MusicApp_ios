//
//  RegisterViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {
  
  // title
  @IBOutlet weak var titleLabel: UILabel!
  // email
  @IBOutlet weak var emailView: UIView!
  @IBOutlet weak var emailImageView: UIImageView!
  @IBOutlet weak var emailTextField: UITextField!
  // password
  @IBOutlet weak var passwordView: UIView!
  @IBOutlet weak var passwordImageView: UIImageView!
  @IBOutlet weak var passwordTextField: UITextField!
  // done
  @IBOutlet weak var doneButton: UIButton!
  
  private var viewModel: RegiserViewModel?
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupViewModel()
  }
  
  private func setupViewModel() {
    viewModel = RegiserViewModel()
    let input = RegisterViewModelInput(doneButton: doneButton.rx.tap.asObservable())
    viewModel?.setupActions(input)
    
    // inputs
    disposeBag.insert {
      // email
      emailTextField.rx.text.orEmpty
        .subscribe(onNext: { text in
          self.viewModel?.updateEmailText(text)
        })
      
      // password
      passwordTextField.rx.text.orEmpty
        .subscribe(onNext: { text in
          self.viewModel?.updatePasswordText(text)
        })
    }
    
    // outputs
    viewModel?.outputs?.showViewObservable
      .subscribe(onNext: { flag in
        if flag {
          self.showViewController(vc: LoginViewController(), title: "認証")
        }
      })
      .disposed(by: disposeBag)
  }
  
  // show ViewController
  private func showViewController(vc: UIViewController, title: String?) {
    if let _title = title {
      vc.title = _title
    }
    self.navigationController?.pushViewController(vc, animated: true)
  }

}
// MARK: -- layoutConfigure
extension RegisterViewController {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
    // title
    titleLabel.textColor = .textColor()
    titleLabel.font = .boldSystemFont(ofSize: 42)
    // email
    setupBox(view: emailView, textField: emailTextField)
    emailImageView.image = UIImage(named: "mail")?.withTintColor(.mainColor())
    // password
    setupBox(view: passwordView, textField: passwordTextField)
    passwordImageView.image = UIImage(named: "password")?.withTintColor(.mainColor())
    // done
    doneButton.backgroundColor = .mainColor()
    doneButton.layer.cornerRadius = 10.0
    doneButton.setTitleColor(.white, for: .normal)
  }
  
  private func setupBox(view: UIView, textField: UITextField) {
    /// view
    view.backgroundColor = .white
    view.layer.cornerRadius = 10.0
    view.layer.borderWidth = 0.3
    view.layer.borderColor = UIColor.mainColor().cgColor
    /// textField
    textField.textColor = .textColor()
  }
  
}
