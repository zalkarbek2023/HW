//
//  ViewController.swift
//  hwGET
//
//  Created by zalkarbek on 11/3/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var latestCollectionView: UICollectionView!
    
    @IBOutlet weak var flashCollectionView: UICollectionView!
    
    private let latestViewModel = LatestViewModel()
    private let flashViewModel = FlashViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchLatest()
        configureLatestCollectionView()
        fetchFlash()
        configureFlashCollectionView()
    }
    
    private func configureLatestCollectionView() {
        latestCollectionView.dataSource = self
        latestCollectionView.delegate = self
        latestCollectionView.register(
            UINib(nibName: LatestCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: LatestCollectionViewCell.reuseId)
    }
    
    private func fetchLatest() {
        Task {
            do {
                latestViewModel.latest = try await latestViewModel.fetchCarts()
                DispatchQueue.main.async {
                    self.latestCollectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureFlashCollectionView() {
        flashCollectionView.dataSource = self
        flashCollectionView.delegate = self
        flashCollectionView.register(UINib(nibName: FlashSaleCollectionViewCell.reuseId, bundle: nil), forCellWithReuseIdentifier: FlashSaleCollectionViewCell.reuseId)
    }
    
    private func fetchFlash() {
        Task {
            do {
                flashViewModel.flash = try await flashViewModel.fetchFlshSale()
                DispatchQueue.main.async {
                    self.flashCollectionView.reloadData()
                }
            } catch {
                print(error.localizedDescription)
            }
        }
    }
    

}

extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        if collectionView == latestCollectionView {
           return latestViewModel.latest.count
        } else {
          return  flashViewModel.flash.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == latestCollectionView {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LatestCollectionViewCell.reuseId, for: indexPath) as? LatestCollectionViewCell else {fatalError()}
            let latest = latestViewModel.latest[indexPath.row]
            cell.displayLatest(latest)
            return cell
        } else {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlashSaleCollectionViewCell.reuseId, for: indexPath) as? FlashSaleCollectionViewCell else { fatalError() }
            let flashSale = flashViewModel.flash[indexPath.row]
            cell.displayFlash(flashSale)
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == latestCollectionView {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        } else {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }
    }
}
