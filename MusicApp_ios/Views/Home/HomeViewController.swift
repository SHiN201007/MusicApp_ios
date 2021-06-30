//
//  HomeViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/06/28.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

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
  // artists
  @IBOutlet weak var artistLabel: UILabel!
  @IBOutlet weak var artistDescriptLabel: UILabel!
  @IBOutlet weak var artistButton: UIButton!
  @IBOutlet weak var collectionView: UICollectionView!
  
  
  private let disposeBag = DisposeBag()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupCollectionView()
    setupRecommedData()
  }
  
  // sample
  private func setupRecommedData() {
    recommend1MusicImageView.image = UIImage(named: "oneokrock")
    recommend2MusicImageView.image = UIImage(named: "oneokrock")
    recommend3MusicImageView.image = UIImage(named: "oneokrock")
    recommend4MusicImageView.image = UIImage(named: "oneokrock")
  }

}
// MARK: -- layoutConfigure
extension HomeViewController {
  override func viewWillLayoutSubviews() {
    layoutConfigure()
    setupCollectionView()
  }
  private func layoutConfigure() {
    // view
    self.view.backgroundColor = .backgroundColor()
    backView.backgroundColor = .backgroundColor()
    // recommend
    setupTitleLayout(titleLabel: recommendLabel, descriptLabel: recommendDescriptLabel, button: recommendButton)
    /// 1
    setupRecommendView(musicImageView: recommend1MusicImageView,
                       titleLabel: recommend1TitleLabel,
                       artistLabel: recommend1ArtistLabel,
                       preViewLabel: recommend1PreViewLabel,
                       menuImageView: recommend1MenuImageView)
    /// 2
    setupRecommendView(musicImageView: recommend2MusicImageView,
                       titleLabel: recommend2TitleLabel,
                       artistLabel: recommend2ArtistLabel,
                       preViewLabel: recommend2PreViewLabel,
                       menuImageView: recommend2MenuImageView)
    /// 3
    setupRecommendView(musicImageView: recommend3MusicImageView,
                       titleLabel: recommend3TitleLabel,
                       artistLabel: recommend3ArtistLabel,
                       preViewLabel: recommend3PreViewLabel,
                       menuImageView: recommend3MenuImageView)
    /// 4
    setupRecommendView(musicImageView: recommend4MusicImageView,
                       titleLabel: recommend4TitleLabel,
                       artistLabel: recommend4ArtistLabel,
                       preViewLabel: recommend4PreViewLabel,
                       menuImageView: recommend4MenuImageView)
    // Artist
    setupTitleLayout(titleLabel: artistLabel, descriptLabel: artistDescriptLabel, button: artistButton)
    collectionView.backgroundColor = .backgroundColor()
  }
  
  private func setupTitleLayout(titleLabel: UILabel, descriptLabel: UILabel, button: UIButton) {
    /// title
    titleLabel.textColor = .mainColor()
    titleLabel.font = .boldSystemFont(ofSize: 20)
    /// descript
    descriptLabel.textColor = .textColor()
    /// button
    button.contentHorizontalAlignment = .right
    button.setTitleColor(.textColor(), for: .normal)
  }
  
  private func setupRecommendView(musicImageView: UIImageView, titleLabel: UILabel, artistLabel: UILabel, preViewLabel: UILabel, menuImageView: UIImageView) {
    musicImageView.contentMode = .scaleAspectFill
    musicImageView.layer.cornerRadius = 5.0
    titleLabel.textColor = .textColor()
    artistLabel.textColor = .placeHolderColor()
    preViewLabel.textColor = .placeHolderColor()
    menuImageView.image = UIImage(named: "menu")?.withTintColor(.textColor())
  }
  
  private func setupCollectionView() {
    let nib = UINib(nibName: "ArtistCollectionViewCell", bundle: .main)
    collectionView.register(nib, forCellWithReuseIdentifier: "ArtistCell")
    collectionView.dataSource = self
    collectionView.delegate = self
    collectionView.showsHorizontalScrollIndicator = false
    let layout = UICollectionViewFlowLayout()
    layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.scrollDirection = .horizontal
    layout.itemSize = CGSize(width: 120, height: 120)
    collectionView.collectionViewLayout = layout
  }
}
// MARK: -- UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 10
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ArtistCell", for: indexPath) as! ArtistCollectionViewCell
    
    cell.artistImageView.image = UIImage(named: "oneokrock")
    cell.artistNameLabel.text = "ONE OK ROCK"
    
    return cell
  }
}
// MARK: -- UICollectionViewDelegate
extension HomeViewController: UICollectionViewDelegate {
  
}
