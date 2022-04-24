//
//  ViewModel.swift
//  AppForDBD
//
//  Created by Dilara Şimşek on 14.04.2022.
//

import Foundation


struct IconModel {
    var portrait: String
    var preview_portrait: String
    var shop_background: String
}


struct SurvivorModel {
    var id: String
    var name: String
    var full_name: String
    var gender: String
    var role: String
    var nationality: String
    var overview: String
    var difficulty: String
    var icon: IconModel
    var perks: [String]
}



struct IconKillerModel {
    var portrait: String
    var preview_portrait: String
    var shop_background: String
}


struct KillerModel {
    var id: String
    var name: String
    var full_name: String
    var gender: String
    var nationality: String
    var overview: String
    var difficulty: String
    var icon: IconKillerModel
    var perks: [String]
}

struct DetailModel {
    
    var id: String
    var name: String
    var full_name: String
    var gender: String
    var nationality: String
    var overview: String
    var difficulty: String
    var icon: IconDetailModel
    var perks: [String]
}

struct IconDetailModel {
    var portrait: String
    var preview_portrait: String
    var shop_background: String
}


struct PerksModel: Codable {
    var _id: String
    var role: String
    var name: String
    var perk_name: String
    var description: String
    var icon: String
    
}

var perksModel : PerksModel!
var allPerksDetail = [PerksModel]()

var iconModelKiller : IconKillerModel!
//var allIconModel = [IconModel]()
var killerModel : KillerModel!
var allKillerModel = [KillerModel]()

var iconModel : IconModel!
var allIconModel = [IconModel]()
var survivorModel : SurvivorModel!
var allSurvivorModel = [SurvivorModel]()


