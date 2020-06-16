//
//  IA.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 15/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

// L'IA est une struct elle n'utilise pas de Binding, mais l'opérateue inout qui fait la même chose

var winComb: [[Int]] = [[0,1,2],[3,4,5],[6,7,8], // Horizontal
                        [0,3,6],[1,4,7],[2,5,8], // Vertical
                        [0,4,8],[2,4,6]] // Diagonale

struct IA {
    /// <#Description#>
    /// Recherche une case vide et rempli la case avec .ia
    /// - Parameter damier: damier
    func jouerTour(damier: inout Damier) {
        
        
        if let index = damier.rechercheCaseVide() {
            damier.changerCase(index: index, contenu: .ia)
//            let quiGagne = quiAGagne(line: index.ligne, raw: index.colonne, nbLineRaw: 3, winComb: winComb)
//            if quiGagne == .IA {
//                automate.activer(etat: .IAGagnant)
//            }
        }
    }
    
    
}
