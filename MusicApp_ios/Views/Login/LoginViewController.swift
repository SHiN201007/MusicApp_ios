//
//  LoginViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import UIKit

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

  override func viewDidLoad() {
    super.viewDidLoad()

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
