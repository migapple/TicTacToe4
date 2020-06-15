//
//  ContentView.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 15/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

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
                Text("IA: \(compteurIA)")
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
      if compteurJoueur == 5 {
        automate.activer(etat: .finDuJeu)
      } else {
        automate.activer(etat: .tourIA)
      }
    }
    
    func resetgrilleJeu() {
        automate.damier.nouvelleGrille(nbLignes: 3, nbColonnes: 3)
        self.compteurIA = 0
        self.compteurJoueur = 0
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
