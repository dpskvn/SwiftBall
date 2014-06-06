//
//  CrystalBall.swift
//  CrystalBall
//
//  Created by Dino Paskvan on 06/06/14.
//  Copyright (c) 2014 Dino Paskvan. All rights reserved.
//

import UIKit

class CrystalBall: NSObject {
   let predictions = ["It is Certain", "It is Decidedly so", "All signs say YES", "The stars are not aligned", "My reply is no", "It is doubtful", "Better not tell you now", "Concentrate and ask again", "Unable to answer now"]
    
    func randomPrediction() -> String {
        let random = Int(arc4random_uniform(UInt32(predictions.count)))
        return predictions[random]
    }
}
