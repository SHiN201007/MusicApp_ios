//
//  AccountSettingViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/07/14.
//

import UIKit
import RxSwift
import RxCocoa

class AccountSettingViewController: UIViewController {

  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

}

extension AccountSettingViewController {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
    self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
  }
}
