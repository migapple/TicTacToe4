//
//  Automate.swift
//  TicTacToe4
//
//  Created by Michel Garlandat on 15/06/2020.
//  Copyright © 2020 Michel Garlandat. All rights reserved.
//

import SwiftUI

enum EtatAutomate: String {
    case indetermine = "Indéterminé"
    case parametrage = "Paramétrage"
    case tourJoueur = "Tour Joueur"
    case tourIA = "Tour IA"
    case joueurGagnant = "Joueur Gagnant"
    case IAGagnant = "IA Gagnant"
    case pasDeGagnant = "Pas de Gagnant"
    case finDuJeu = "Fin du Jeu"
    case reset = "Reset"
}

// struct Automate {
class Automate: ObservableObject {
    @Published var damier = Damier(nbLignes: 3, nbColonnes: 3)
    @Published var interfaceActive = false
    @Published var opaciteDamier = 1.0
    @Published var compteurIA = 0
    @Published var compteurJoueur = 0
    private var ia = IA()
    
    var etatCourant = EtatAutomate.indetermine
    
    init() {
        activer(etat: .parametrage)
    }
}

extension Automate {
    func activer(etat: EtatAutomate) {
        switch etat {
        case .indetermine:
            break
        case .parametrage:
            opaciteDamier = 0.1
            interfaceActive = false
            break
        case .tourJoueur:
            opaciteDamier = 1.0
            interfaceActive = true
            break
        case .tourIA:
            opaciteDamier = 1.0
            interfaceActive = false
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.compteurIA += 1
                self.ia.jouerTour(damier: &self.damier)
                self.activer(etat: .tourJoueur)
            }
        case .joueurGagnant:
            opaciteDamier = 1.0
            interfaceActive = false
            break
        case .IAGagnant:
            opaciteDamier = 1.0
            interfaceActive = false
            break
        case .pasDeGagnant:
            opaciteDamier = 1.0
            interfaceActive = false
            break
        case .finDuJeu:
            interfaceActive = false
            break
        case .reset:
            interfaceActive = false
            compteurIA = 0
            compteurJoueur = 0
            break
        }
        etatCourant = etat
    }
}
