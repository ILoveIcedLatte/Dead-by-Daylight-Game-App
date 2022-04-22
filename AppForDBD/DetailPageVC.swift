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
    
    
    var detailModel : DetailModel!
    
    enum DetailType {
        case survivor
        case killer
    }
    
    var detailType : DetailType = .killer
    
    
    
    
    var detailID : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        print("detail : \(detailID)")
        
        getCharacterDetail()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    @IBAction func btnBack(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
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
                    
                }
            }
            
        default:
            print("default")
            
        }
        
        
        

        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
