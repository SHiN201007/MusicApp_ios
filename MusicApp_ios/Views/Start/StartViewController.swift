//
//  StartViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import UIKit
import RxSwift
import RxCocoa

class StartViewController: UIViewController {

  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var registerButton: UIButton!
  @IBOutlet weak var loginButton: UIButton!
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()

    setupActions()
  }
  
  // actions
  private func setupActions() {
    disposeBag.insert {
      // register action
      registerButton.rx.tap
        .subscribe(onNext: {
          // show registerVC
          self.showViewController(vc: RegisterViewController(), title: nil)
        })
      
      // login action
      loginButton.rx.tap
        .subscribe(onNext: {
          // show loginVC
          self.showViewController(vc: LoginViewController(), title: nil)
        })
    }
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
extension StartViewController {
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
    // register
    registerButton.backgroundColor = .mainColor()
    registerButton.layer.cornerRadius = 10.0
    registerButton.setTitleColor(.white, for: .normal)
    // login
    loginButton.backgroundColor = .white
    loginButton.layer.cornerRadius = 10.0
    loginButton.layer.borderWidth = 0.5
    loginButton.layer.borderColor = UIColor.mainColor().cgColor
    loginButton.setTitleColor(.textColor(), for: .normal)
  }
  
}
