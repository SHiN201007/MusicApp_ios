//
//  MyPageViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/28.
//

import UIKit

class MyPageViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

   
  }

}
// MARK: -- layoutConfigure
extension MyPageViewController {
  override func viewWillLayoutSubviews() {
    layoutConfigure()
  }
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
  }
}
