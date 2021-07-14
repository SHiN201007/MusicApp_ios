//
//  LoginViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

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
  
  private var viewModel: LoginViewModel?
  private let disposeBag = DisposeBag()

  override func viewDidLoad() {
    super.viewDidLoad()
    initTextData()
    setupViewModel()
  }
  
  private func initTextData() {
    let object = AuthObject.shared
    if let email = object.email,
       let password = object.password {
      print(email)
      print(password)
      self.emailTextField.text = email
      self.passwordTextField.text = password
    }
  }
  
  private func setupViewModel() {
    viewModel = LoginViewModel()
    let input = LoginViewModelInput(doneButton: doneButton.rx.tap.asObservable())
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
    /// email
    viewModel?.outputs?.emailObservable
      .subscribe(onNext: { text in
        self.emailTextField.text = text
      })
      .disposed(by: disposeBag)
    /// password
    viewModel?.outputs?.passwordObservable
      .subscribe(onNext: { text in
        self.passwordTextField.text = text
      })
      .disposed(by: disposeBag)
    
    viewModel?.outputs?.showViewObservable
      .subscribe(onNext: { flag in
        if flag {
          self.showViewController(vc: AccountSettingViewController(), title: "アカウント設定")
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
extension LoginViewController {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    // title
    titleLabel.textColor = .textColor()
    titleLabel.font = .boldSystemFont(ofSize: 42)
    // email
    setupBox(view: emailView, textField: emailTextField)
    emailImageView.image = UIImage(named: "mail")?.withTintColor(.mainColor())
    // password
    setupBox(view: passwordView, textField: passwordTextField)
    passwordTextField.isSecureTextEntry = true
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
