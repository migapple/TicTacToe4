//
//  DamierView.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 15/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

/// Description
/// actif : flag indiquant si on ou non réagir ou non à la sélection d'une case
/// damier : liste des cases à dessiner en fonction des lignes et des colonnes
/// action: closure a exécuter quand le joueur sélectionne un case

struct DamierView: View {
    var actif: Bool
    var damier: Damier
    var action: (_ index:IndexCase) -> Void
    
    var body: some View {
        VStack {
            ForEach(0..<damier.cases.count, id: \.self) { ligne in
                HStack {
                    ForEach(0..<self.damier.cases[ligne].count, id: \.self) { colonne in
                        CaseView(description: self.damier.cases[ligne][colonne])
                            .onTapGesture {
                                if self.actif {
                                    self.action(IndexCase(ligne: ligne, colonne: colonne))
                                }
                        }
                    }
                }
            }
        }
    }
}

//struct DamierView_Previews: PreviewProvider {
//    static var previews: some View {
//        DamierView()
//    }
//}

