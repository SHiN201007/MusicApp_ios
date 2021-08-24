//
//  RecommendViewController.swift
//  MusicApp_ios
//
//  Created by 松丸真 on 2021/08/24.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

class RecommendViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  private var viewModel: RecommnedViewModel!
  private let disposeBag = DisposeBag()
  
  private lazy var dataSource = RxTableViewSectionedReloadDataSource<SectionRecommend>(configureCell: configureCell)
  
  private lazy var configureCell: RxTableViewSectionedReloadDataSource<SectionRecommend>.ConfigureCell = { [weak self]
    (dataSource, tableView, indexPath, item) in
    let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendTableViewCell", for: indexPath) as! RecommendTableViewCell
    
    cell.recommendMusicImageView.image = UIImage(named: item.musicImage)
    cell.recommendTitleLabel.text = item.title
    cell.recommendArtistLabel.text = item.artist
    
    let preview = DecimalStyleUtils.shared.configure(value: item.preview)
    cell.recommendPreViewLabel.text = "\(preview)回視聴"
    
    return cell
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTableView()
    setupViewModel()
  }
  
  private func setupTableView() {
    let nib = UINib(nibName: "RecommendTableViewCell", bundle: Bundle.main)
    tableView.register(nib, forCellReuseIdentifier: "RecommendTableViewCell")
    tableView.tableFooterView = UIView(frame: .zero) // 空白cellの線　削除
    tableView.separatorStyle = .none
    tableView.rx.setDelegate(self).disposed(by: disposeBag)
    
    // did selected
    tableView.rx.itemSelected
      .subscribe(onNext: { [weak self] indexPath in
        self?.tableView.deselectRow(at: indexPath, animated: true)
        self?.showMusicViewController()
      })
      .disposed(by: disposeBag)
  }
  
  private func setupViewModel() {
    viewModel = RecommnedViewModel()
    
    viewModel.outputs?.items
      .bind(to: tableView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
  
  private func showMusicViewController() {
    let vc = MusicViewController()
    self.present(vc, animated: true, completion: nil)
  }

}
extension RecommendViewController {
  override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    layoutConfigure()
  }
  
  private func layoutConfigure() {
    self.view.backgroundColor = .backgroundColor()
    self.tableView.backgroundColor = .backgroundColor()
  }
}
extension RecommendViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70.0
  }
}
