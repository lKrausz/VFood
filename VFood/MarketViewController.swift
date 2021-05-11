//
//  MarketViewController.swift
//  VFood
//
//  Created by Виктория Козырева on 10.05.2021.
//

import UIKit
import VK_ios_sdk

class MarketViewController: UIViewController {

    @IBOutlet weak var marketCollectionView: UICollectionView!
    let marketList = initMarketList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        marketCollectionView.backgroundColor = .blue
    }
    
    func createCell() {
        marketCollectionView.delegate = self
        marketCollectionView.dataSource = self
        marketCollectionView.register(UINib.init(nibName: "MarketCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MarketCollectionViewCell")
    }
    func requestMarketItems() {
        let request : VKRequest = VKApi.request(withMethod: "market.get", andParameters: marketList[0])

        request.execute { response in
            //print(response?.json)
            guard let responseData = response else {
                print("no data")
                return
            }
            print(responseData)
            do {
                let data = Data(responseData.responseString.utf8)
                let decodeData = try JSONDecoder().decode(VKApiResponse.self, from: data)
            } catch {
                print(error)
            }
        } errorBlock: { error in
            print("VK error: \(String(describing: error))")
        }

    }

}

extension MarketViewController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = marketCollectionView.dequeueReusableCell(withReuseIdentifier: "MarketCollectionViewCell", for: indexPath) as! MarketCollectionViewCell
        //cell.initCell(imageURL: <#T##URL#>, title: <#T##String#>, price: <#T##String#>)
        // TODO: create init
        return cell
    }
    
    
}
