//
//  RankingViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/30.
//

import UIKit
import RxSwift
import RxCocoa

class RankingViewController: UIViewController {

  @IBOutlet weak var tableView: UITableView!
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()

  }

}
extension RankingViewController {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
  }
}
