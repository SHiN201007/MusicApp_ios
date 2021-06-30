//
//  MusicViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/30.
//

import UIKit

class MusicViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()

  }
  
  @objc func close() {
    self.dismiss(animated: true, completion: nil)
  }

}
// MARK: -- layoutConfigure
extension MusicViewController {
  override func viewWillLayoutSubviews() {
    layoutConfigure()
    addNavbarButton()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
  }
  
  private func addNavbarButton() {
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "閉じる", style: .plain, target: self, action: #selector(close))
  }
}
