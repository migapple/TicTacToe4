//
//  Damier.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 15/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

enum Gagnant {
    case personne
    case joueur
    case IA
}

enum TypeCase: String {
    case vide = "case vide"
    case joueur = "case joueur"
    case ia = "case ia"
}

struct IndexCase {
    var ligne = 0
    var colonne = 0
}

struct DescriptionCase: Identifiable {
    var id = UUID()
    var contenu = TypeCase.vide
    var index = IndexCase()
}

struct Damier {
    var cases: [[DescriptionCase]]
    
    private var _nbCasesLibres = 0
    private var _nbLignes: Int = 0
    private var _nbColonnes:Int = 0
    
    // Variables en lecture seule
    var nbCasesLibres : Int { return _nbCasesLibres }
    var nbLignes      : Int { return _nbLignes }
    var nbColonnes    : Int { return _nbColonnes }
    
    init(nbLignes: Int, nbColonnes: Int) {
        _nbLignes = nbLignes
        _nbColonnes = nbColonnes
        cases = Damier.creer(nbLignes: nbLignes, nbColonnes: nbColonnes)
        _nbCasesLibres = _nbLignes * _nbColonnes
    }
        
    // Creation nouvelle grille vierge
    mutating func nouvelleGrille(nbLignes: Int, nbColonnes: Int) {
        _nbLignes = nbLignes
        _nbColonnes = nbColonnes
        cases = Damier.creer(nbLignes: nbLignes, nbColonnes: nbColonnes)
        _nbCasesLibres = _nbLignes * _nbColonnes
    }
    
    // Outils divers
    
    // Recherche aléatoire d'une case vide
    // avec retour d'un optional nil si ce n'est pas possible
    // pour éviter une boucle infinie
    func rechercheCaseVide() -> IndexCase? {
        guard _nbCasesLibres > 0 else { return nil}
        while true {
            let ligne = Int.random(in: 0..<_nbLignes)
            let colonne = Int.random(in: 0..<_nbColonnes)
            
            if cases[ligne][colonne].contenu == .vide {
                return IndexCase(ligne: ligne, colonne: colonne)
            }
        }
    }
    
    // Lecture case
    func lireCase(index:IndexCase) -> DescriptionCase? {
        if verificationIndex(index: index) {
            return cases[index.ligne][index.colonne]
        } else { return nil }
    }
    
    // On ne peut changer que l'état d'une case .vide
    mutating func changerCase(index: IndexCase, contenu: TypeCase) {
        if verificationIndex(index: index) {
            if cases[index.ligne][index.colonne].contenu == .vide {
                cases[index.ligne][index.colonne].contenu = contenu
                _nbCasesLibres -= 1
            }
        }
    }
                
    // Verification si un index est valable
    // par rapport à la taille du tableau
    func verificationIndex(index: IndexCase) -> Bool {
        if Set(0..<_nbLignes).contains(index.ligne) {
            if Set(0..<_nbColonnes).contains(index.colonne) {
                return true
            }
        }
        return false
    }
    
    // Creation du tableau en fonction du nombre de lignes et de colonnes
    private static func creer(nbLignes: Int, nbColonnes: Int) -> [[DescriptionCase]] {
        var tableau = [[DescriptionCase]]()
        for ligne in 0..<nbLignes {
            var ligneTableau = [DescriptionCase]()
            for colonne in 0..<nbColonnes {
                var description = DescriptionCase()
                description.index = IndexCase(ligne: ligne, colonne: colonne)
                ligneTableau.append(description)
            }
            tableau.append(ligneTableau)
        }
        return tableau
    }
}
