//
//  ActionSheetShowPerk.swift
//  AppForDBD
//
//  Created by Dilara Şimşek on 24.04.2022.
//

import UIKit

class ActionSheetShowPerk: UIViewController {
    
    
    @IBOutlet weak var imgViewPerk: UIImageView!
    @IBOutlet weak var lblPerkName: UILabel!
    @IBOutlet weak var lblPerkDesc: UILabel!
    
    var perkNameStr = ""
    var perkDescStr = ""
    var perkImageUrl = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUI()
    }
 
    func setUI(){
        
        lblPerkName.text = perkNameStr
        lblPerkDesc.text = perkDescStr
        
        let url = URL(string: perkImageUrl)
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url!) {
                DispatchQueue.main.async {
                    self.imgViewPerk.image = UIImage(data: data)
                    self.imgViewPerk.contentMode = .scaleAspectFit
                    self.imgViewPerk.layer.shadowColor = UIColor.darkGray.cgColor
                    self.imgViewPerk.clipsToBounds = false
                    self.imgViewPerk.layer.shadowOpacity = 0.8
                    self.imgViewPerk.layer.shadowOffset = CGSize.zero
                    self.imgViewPerk.layer.shadowRadius = 10
                    self.imgViewPerk.layer.shadowPath = UIBezierPath(roundedRect: self.imgViewPerk.bounds, cornerRadius: 30).cgPath
                }
        }
        }
    }
    
    
    

    @IBAction func btnDismissAct(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
