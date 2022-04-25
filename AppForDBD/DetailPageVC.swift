//
//  DetailPageVC.swift
//  AppForDBD
//
//  Created by Dilara Şimşek on 19.04.2022.
//

import UIKit

class DetailPageVC: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblOverview: UILabel!
    
    @IBOutlet weak var collectionViewPerks: UICollectionView!
    
    var detailModel : DetailModel!
    var characterPerks = [PerksModel]()
    
    enum DetailType {
        case survivor
        case killer
    }
    
    var detailType : DetailType = .killer
    
    
    
    
    var detailID : String = ""
    var detailName : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        print("detail : \(detailID)")
        
        getCharacterDetail()
        
        print("detail name : \(detailName)")

        
        self.getPerkDetail { () -> () in
            self.getCharacterPerks()
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBAction func btnBack(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    func getPerkDetail(handleComplete:(()->())) {
        Network.sendRequestPerks(Services.SERVICE_BASE_URL+Services.PERKS, completionHandler: { response_detail in
            
            
            allPerksDetail.removeAll()
            
            for i in response_detail {
                
                allPerksDetail.append(PerksModel(_id: i._id, role: i.role, name: i.name, perk_name: i.perk_name, description: i.description, icon: i.icon)
                )
            }
            
            self.characterPerks.removeAll()
            
            for i in 0..<allPerksDetail.count {
                
                if allPerksDetail[i].name == self.detailName {
                    
                    print("get perk : \(allPerksDetail[i].perk_name)")
                    
                    self.characterPerks.append(PerksModel(_id: allPerksDetail[i]._id, role: allPerksDetail[i].role, name: allPerksDetail[i].name, perk_name: allPerksDetail[i].perk_name, description: allPerksDetail[i].description, icon: allPerksDetail[i].icon))
                    
            }
        }
            
            self.collectionViewPerks.reloadData()
            
        })
        
        //handleComplete()
        
    }
    
    func getCharacterPerks() {
        
        print("girdi")
        
        for i in 0..<allPerksDetail.count {
            
            if allPerksDetail[i].name == detailName {
                
                print("get i : \(allPerksDetail[i].name)")
                
                print("click")
            }
   
    }
    }
    
    func showActionSheetPerks() {

    }
    
    func getCharacterDetail() {
        
        
        switch detailType {
        case .survivor:
            print("survivor")
            
            for i in 0..<allSurvivorModel.count {
                
                if allSurvivorModel[i].id == detailID {
                    
                    print("name: \(allSurvivorModel[i].name)")
                    
                    lblName.text = allSurvivorModel[i].name
                    let url = URL(string: allSurvivorModel[i].icon.shop_background)
                    DispatchQueue.main.async {
                        if let data = try? Data(contentsOf: url!) {
                            self.imgView.image = UIImage(data: data)
                        }
                    }
                    
                    lblOverview.text = allSurvivorModel[i].overview
                    
                    lblOverview.layer.shadowColor = UIColor.darkGray.cgColor
                    lblOverview.clipsToBounds = false
                    lblOverview.layer.shadowOpacity = 1
                    lblOverview.layer.shadowOffset = CGSize.zero
                    lblOverview.layer.shadowRadius = 10
                    lblOverview.layer.shadowPath = UIBezierPath(roundedRect: lblOverview.bounds, cornerRadius: 10).cgPath
                    
                }
            }
            
            
            
        case .killer:
            print("killer")
            
            for i in 0..<allKillerModel.count {
                
                if allKillerModel[i].id == detailID {
                    
                    print("name: \(allKillerModel[i].name)")
                    
                    print("name: \(allKillerModel[i].name)")
                    
                    lblName.text = allKillerModel[i].name
                    let url = URL(string: allKillerModel[i].icon.shop_background)
                    DispatchQueue.main.async {
                        if let data = try? Data(contentsOf: url!) {
                            self.imgView.image = UIImage(data: data)
                        }
                    }
                    
                    lblOverview.text = allKillerModel[i].overview
                    
                    lblOverview.layer.shadowColor = UIColor.darkGray.cgColor
                    lblOverview.clipsToBounds = false
                    lblOverview.layer.shadowOpacity = 1
                    lblOverview.layer.shadowOffset = CGSize.zero
                    lblOverview.layer.shadowRadius = 10
                    lblOverview.layer.shadowPath = UIBezierPath(roundedRect: lblOverview.bounds, cornerRadius: 10).cgPath
                    
                }
            }
            
        default:
            print("default")
            
        }
        
        
        

        
    }
    
}



extension DetailPageVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return characterPerks.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellcvc", for: indexPath) as! PerksCVC
        
        cell.lblRole.text = characterPerks[indexPath.row].role
        cell.lblPerkName.text = characterPerks[indexPath.row].perk_name
        
        let url = URL(string: characterPerks[indexPath.row].icon)
        //print("url: \(url)")
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    cell.imgViewPerk.image = UIImage(data: data)
                    cell.imgViewPerk.layer.shadowColor = UIColor.darkGray.cgColor
                    cell.imgViewPerk.clipsToBounds = false
                    cell.imgViewPerk.layer.shadowOpacity = 1
                    cell.imgViewPerk.layer.shadowOffset = CGSize.zero
                    cell.imgViewPerk.layer.shadowRadius = 10
                    cell.imgViewPerk.layer.shadowPath = UIBezierPath(roundedRect: cell.imgViewPerk.bounds, cornerRadius: 10).cgPath

                }
        }
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let actionSheet = Storyboards.main.instantiateViewController(withIdentifier: "ActionSheetShowPerk") as! ActionSheetShowPerk
        
        actionSheet.perkNameStr = characterPerks[indexPath.row].perk_name
        actionSheet.perkDescStr = characterPerks[indexPath.row].description
        actionSheet.perkImageUrl = characterPerks[indexPath.row].icon
        
        actionSheet.modalPresentationStyle = .overFullScreen
        self.present(actionSheet, animated: true, completion: nil)
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: 140.0, height: 140.0)


    }
    
    
}
 
