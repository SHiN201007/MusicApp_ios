//
//  RegisterViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/07.
//

import UIKit

class RegisterViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

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
  }
  
}
