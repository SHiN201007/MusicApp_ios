//
//  HomeViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/28.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {
  
  @IBOutlet weak var recommendLabel: UILabel!
  @IBOutlet weak var recommendDescriptLabel: UILabel!
  @IBOutlet weak var recommendButton: UIButton!
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
  }

}
// MARK: -- layoutConfigure
extension HomeViewController {
  override func viewWillLayoutSubviews() {
    layoutConfigure()
  }
  private func layoutConfigure() {
    // view
    self.view.backgroundColor = .backgroundColor()
    // recommend
    /// title
    recommendLabel.textColor = .mainColor()
    recommendLabel.font = .boldSystemFont(ofSize: 20)
    /// descript
    recommendDescriptLabel.textColor = .textColor()
    /// button
    recommendButton.contentHorizontalAlignment = .right
    recommendButton.setTitleColor(.textColor(), for: .normal)
    
  }
}
