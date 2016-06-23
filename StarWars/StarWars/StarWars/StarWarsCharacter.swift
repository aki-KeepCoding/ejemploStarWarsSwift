//
//  StarWarsCharacter.swift
//  StarWars
//
//  Created by Akixe on 21/6/16.
//  Copyright © 2016 AOA. All rights reserved.
//

import Foundation
import UIKit

class StarWarsCharacter : Comparable {
    
    //MARK: - Properties
    let firstName   : String?
    let lastName    : String?
    let alias       : String?
    let soundData   : NSData
    let photo       : UIImage
    let url         : NSURL
    let affiliation : StarWarsAffiliation
    
    
    
    //MARK: - Computed properties
    var name : String?{
        get{
            // para si es nulo
            guard let first = firstName else {
                return lastName
            }
            
            guard let last = lastName else {
                return first
            }
            
            return "\(first) \(last)"
        }
    }
    
    //MARK: - Initialization
    init(firstName: String?,
        lastName: String?,
        alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        affiliation : StarWarsAffiliation){
            self.firstName = firstName
            self.lastName = lastName
            self.alias = alias
            self.soundData = soundData
            self.photo = photo
            self.url = url
            self.affiliation = affiliation

    }
    
    
    convenience init(
        alias: String?,
        soundData: NSData,
        photo: UIImage,
        url: NSURL,
        affiliation: StarWarsAffiliation) {
            self.init(firstName: nil,
                lastName: nil,
                alias: alias,
                soundData: soundData,
                photo: photo,
                url: url,
                affiliation: affiliation)
            
    }
    
    
    
    
    
    
    
    
    
}

//MARK: - Extensions

// Se crea una extensión para este tipo de propiedades para mentener limpia la clase principal
// proxyForComparison -> concatena las propiedades para implementar las comparaciones
extension StarWarsCharacter {
    var proxyForComparison : String {
        get {
            return "\(firstName)\(lastName)\(alias)"
        }
    }
}

//MARK: - Equatable

// Las funciones del protocolo se implementan fuera de la clase principal (tema de diseño de lenguaje)
func ==(lhs:StarWarsCharacter, rhs: StarWarsCharacter)->Bool{
    // El proxyForComparison es una forma facil de ahorrarnos if-s cuando queremos comparar varias
    //   propiedades (proxyForComparison se implementa en una extensión)
    return lhs.proxyForComparison == rhs.proxyForComparison
}

func <(lhs: StarWarsCharacter, rhs: StarWarsCharacter) -> Bool {
    return lhs.proxyForComparison < rhs.proxyForComparison
}

