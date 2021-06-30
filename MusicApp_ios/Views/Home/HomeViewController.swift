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
  
  @IBOutlet weak var backView: UIView!
  // recommend
  @IBOutlet weak var recommendLabel: UILabel!
  @IBOutlet weak var recommendDescriptLabel: UILabel!
  @IBOutlet weak var recommendButton: UIButton!
  // recommend views
  /// 1
  @IBOutlet weak var recommend1MusicImageView: UIImageView!
  @IBOutlet weak var recommend1TitleLabel: UILabel!
  @IBOutlet weak var recommend1ArtistLabel: UILabel!
  @IBOutlet weak var recommend1PreViewLabel: UILabel!
  @IBOutlet weak var recommend1MenuImageView: UIImageView!
  /// 2
  @IBOutlet weak var recommend2MusicImageView: UIImageView!
  @IBOutlet weak var recommend2TitleLabel: UILabel!
  @IBOutlet weak var recommend2ArtistLabel: UILabel!
  @IBOutlet weak var recommend2PreViewLabel: UILabel!
  @IBOutlet weak var recommend2MenuImageView: UIImageView!
  /// 3
  @IBOutlet weak var recommend3MusicImageView: UIImageView!
  @IBOutlet weak var recommend3TitleLabel: UILabel!
  @IBOutlet weak var recommend3ArtistLabel: UILabel!
  @IBOutlet weak var recommend3PreViewLabel: UILabel!
  @IBOutlet weak var recommend3MenuImageView: UIImageView!
  /// 4
  @IBOutlet weak var recommend4MusicImageView: UIImageView!
  @IBOutlet weak var recommend4TitleLabel: UILabel!
  @IBOutlet weak var recommend4ArtistLabel: UILabel!
  @IBOutlet weak var recommend4PreViewLabel: UILabel!
  @IBOutlet weak var recommend4MenuImageView: UIImageView!
  
  
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
    backView.backgroundColor = .backgroundColor()
    // recommend
    /// title
    recommendLabel.textColor = .mainColor()
    recommendLabel.font = .boldSystemFont(ofSize: 20)
    /// descript
    recommendDescriptLabel.textColor = .textColor()
    /// button
    recommendButton.contentHorizontalAlignment = .right
    recommendButton.setTitleColor(.textColor(), for: .normal)
    /// 1
    setupRecommendView(titleLabel: recommend1TitleLabel,
                       artistLabel: recommend1ArtistLabel,
                       preViewLabel: recommend1PreViewLabel,
                       menuImageView: recommend1MenuImageView)
    /// 2
    setupRecommendView(titleLabel: recommend2TitleLabel,
                       artistLabel: recommend2ArtistLabel,
                       preViewLabel: recommend2PreViewLabel,
                       menuImageView: recommend2MenuImageView)
    /// 3
    setupRecommendView(titleLabel: recommend3TitleLabel,
                       artistLabel: recommend3ArtistLabel,
                       preViewLabel: recommend3PreViewLabel,
                       menuImageView: recommend3MenuImageView)
    /// 4
    setupRecommendView(titleLabel: recommend4TitleLabel,
                       artistLabel: recommend4ArtistLabel,
                       preViewLabel: recommend4PreViewLabel,
                       menuImageView: recommend4MenuImageView)
  }
  
  private func setupRecommendView(titleLabel: UILabel, artistLabel: UILabel, preViewLabel: UILabel, menuImageView: UIImageView) {
    titleLabel.textColor = .textColor()
    artistLabel.textColor = .placeHolderColor()
    preViewLabel.textColor = .placeHolderColor()
    menuImageView.image = UIImage(named: "menu")?.withTintColor(.textColor())
  }
}
