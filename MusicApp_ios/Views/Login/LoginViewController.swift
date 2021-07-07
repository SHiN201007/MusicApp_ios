//
//  LoginViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import UIKit

class LoginViewController: UIViewController {

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
  }
  
}
