//
//  MusicNavigationController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/28.
//

import UIKit

class MusicNavigationController: UINavigationController {

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationBar.tintColor = .textColor()
    navigationBar.barTintColor = .backgroundColor()
    navigationBar.titleTextAttributes = [.foregroundColor: UIColor.mainColor()]
    // 透明化
    navigationBar.setBackgroundImage(UIImage(), for: .default)
    navigationBar.shadowImage = UIImage()
  }

}
