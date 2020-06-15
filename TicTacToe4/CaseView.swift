//
//  CaseView.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 15/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

// La représentation graphique finale est faite ici
// en fonction du contenu de la case (.vide, .joueur, .ia)

// Dictionnaire contenant les associations TypeCase-Couleur
fileprivate let couleursCase:[TypeCase:Color] = [
    .vide: Color.gray,
    .joueur: Color.blue,
    .ia: Color.red
]

/// Description
/// Affichage d'une case du damier
struct CaseView: View {
    var description: DescriptionCase
    
    var body: some View {
        Rectangle()
            .foregroundColor(couleursCase[description.contenu])
            .frame(width: 80, height: 80)
        
    }
}

struct CaseView_Previews: PreviewProvider {
    static var previews: some View {
        CaseView(description: DescriptionCase(contenu:.vide, index: IndexCase(ligne: 0, colonne: 0)))
    }
}
