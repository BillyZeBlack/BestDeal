//
//  ListViewByCategoryView.swift
//  Best Deal
//
//  Created by williams saadi on 17/07/2022.
//

import SwiftUI

struct ListViewByCategoryView: View {
    @State var globalManager : GlobalManager!
    
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Group{
                        Section(header: Text("Divers"), footer: HStack {
                            Text("Total")
                            Spacer()
                            Text("")// Ici le prix total des achats par categorie
                        }){
                            HStack {
                                Text("_ _")// Ici la descriptio
                                Spacer()
                                Text("0,0 €")
                            }
                            
                        }
                        Section(header: Text("Mode"), footer: Text("Total")){

                        }
                        Section(header: Text("Nourriture"), footer: Text("Total")){

                        }
                        Section(header: Text("Electromenager"), footer: Text("Total")){

                        }
                        Section(header: Text("Bricolage"), footer: Text("Total")){
                            
                        }
                    }
                    Group{
                        Section(header: Text("Multimédia"), footer: Text("Total")){

                        }
                        Section(header: Text("Meuble et déco."), footer: Text("Total")){
                            
                        }
                        Section(header: Text("Maison et jardin"), footer: Text("Total")){

                        }
                        Section(header: Text("Informatique"), footer: Text("Total")){

                        }
                        Section(header: Text("Téléphonie"), footer: Text("Total")){

                        }
                        Section(header: Text("Jeux vidéos"), footer: Text("Total")){

                        }
                        Section(header: Text("Sport"), footer: Text("Total")){

                        }
                    }
                }
            }
        }.navigationTitle(Text("TITRE"))
    }
}

struct ListViewByCategoryView_Previews: PreviewProvider {
    static var previews: some View {
        ListViewByCategoryView()
            .previewDevice("iPhone 11")
    }
}
