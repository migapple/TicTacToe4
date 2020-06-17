//
//  ContentView.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 15/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//
// Complètement réécrit avec les conseils de Draken sur purplegiraffe.fr

import SwiftUI

struct ContentView: View {
    @ObservedObject var automate = Automate()
    @State var compteurJoueur = 0
    @State var compteurIA = 0
    
    var body: some View {
        VStack {
            Text(automate.etatCourant.rawValue)
                .font(.system(size: 20))
                .bold()
            
            Spacer()
            
            HStack {
                Text("IA: \(automate.compteurIA)")
                Text("Joueur: \(compteurJoueur)")
            }
            
            DamierView(actif: automate.interfaceActive, damier: automate.damier, action: actionTouch)
                .opacity(automate.opaciteDamier)
            
            Spacer()
            
            HStack {
                Button(action:{
                    self.resetgrilleJeu()
                    self.automate.activer(etat: .tourJoueur)
                }) {
                    BoutonPerso(text: "Joueur Commence", couleur: .green)
                }
                
                Button(action:{
                    self.resetgrilleJeu()
                    self.automate.activer(etat: .tourIA)
                }) {
                    BoutonPerso(text: "IA Commence", couleur: .red)
                }
            }
        }
    }
    
    // Evènement joueur touche une case
    // Fonction ecécutée par DamierView dans une closure
    func actionTouch(_ index:IndexCase) {
        
        // Lecture de la case et vérification qu'elle est .vide
        guard let caseTouch = automate.damier.lireCase(index: index),
            caseTouch.contenu == .vide
            else { return }
        // Modification état de la Case
        automate.damier.changerCase(index: index, contenu: .joueur)
        compteurJoueur += 1
        
//        let gagnant = quiAGagne(nbLineRaw: 3, winComb: winComb)
        let gagnant = automate.quiAGagne(nbLineRaw: 3, winComb: winComb)
        
        if gagnant == .joueur {
            automate.activer(etat: .joueurGagnant)
        }
            
        if gagnant == .IA {
            automate.activer(etat: .IAGagnant)
        }
        
        if gagnant == .personne {
            if compteurJoueur == 5 {
                automate.activer(etat: .finDuJeu)
            } else {
                automate.activer(etat: .tourIA)
            }
        }
    }
    
    func resetgrilleJeu() {
        automate.damier.nouvelleGrille(nbLignes: 3, nbColonnes: 3)
        self.compteurIA = 0
        self.compteurJoueur = 0
    }
    
    /// <#Description#>
    /// Teste qui a gagné et affiche les cases en vert
    /// - Parameters:
    ///   - nbLineRaw: nombre de ligne-colonne
    ///   - winComb: tableau des combinaisons gagnantes
//    func quiAGagne(nbLineRaw: Int, winComb: [[Int]]) -> Gagnant {
//        var gagnant = Gagnant.personne
//
//        for combinaison in winComb {
//            var nbJoueur = 0
//            var nbIA = 0
//
//            for i in 0..<nbLineRaw {
//                let index = twoDim(nombre: combinaison[i], nbLineRaw: nbLineRaw)
//                let descriptionCase = automate.damier.lireCase(index: index)
//
//                if descriptionCase?.contenu == TypeCase.joueur { nbJoueur += 1 }
//                if descriptionCase?.contenu == TypeCase.ia { nbIA += 1 }
//            }
//
//            if nbJoueur == nbLineRaw {
//                gagnant = .joueur
//                // On affiche les cases en vert
//                for i in 0..<nbLineRaw {
//                    // Mise des case en vert
////                    let index = twoDim(nombre: combinaison[i], nbLineRaw: nbLineRaw)
////                    DescriptionCase.contenu == TypeCase.gagnant
//                }
//            } else if nbIA == nbLineRaw {
//                gagnant = .IA
//                // Mise des case en vert
//            }
//        }
//        return gagnant
//    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
