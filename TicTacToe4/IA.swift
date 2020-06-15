//
//  IA.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 15/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

// L'IA est une struct elle n'utilise pas de Binding, mais l'opérateue inout qui fait la même chose

struct IA {
    func jouerTour(damier: inout Damier) {
        if let index = damier.rechercheCaseVide() {
            damier.changerCase(index: index, contenu: .ia)
        }
    }
}
