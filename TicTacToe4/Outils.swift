//
//  Outils.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 16/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

// MARK: - Converti une dimension en 2 dimentions
/// <#Description#>
/// - Parameters:
///   - nombre: nombre correspondant à la position
///   - nbLineRaw: nombre de colonnes
/// - Returns: index ligne colonne
func twoDim(nombre: Int, nbLineRaw: Int) -> IndexCase {
    var ind1 = 0
    var ind2 = 0
    if nombre < nbLineRaw {
        ind1 = 0
        ind2 = nombre
    } else if nombre < nbLineRaw * 2 {
        ind1 = 1
        ind2 = nombre - nbLineRaw
    } else if nombre < nbLineRaw * 3 {
        ind1 = 2
        ind2 = nombre - nbLineRaw * 2
    } else if nombre < nbLineRaw * 4 {
        ind1 = 3
        ind2 = nombre - nbLineRaw * 3
    } else if nombre < nbLineRaw * 5 {
        ind1 = 4
        ind2 = nombre - nbLineRaw * 4
    }else if nombre < nbLineRaw * 6 {
        ind1 = 5
        ind2 = nombre - nbLineRaw * 5
    }
    return IndexCase(ligne: ind1, colonne: ind2)
}


