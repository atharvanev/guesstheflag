//
//  ContentView.swift
//  guesstheflag
//
//  Created by Atharva Nevasekar on 8/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var Score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland","Russia","Spain","UK","US"].shuffled()
    
    @State private var correctAnswer = Int.random(in: 0...2)
    
    
    var body: some View {
        ZStack{
            //Color.blue.ignoresSafeArea()
//            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.black]), startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            RadialGradient(stops:[
                .init(color: Color(red:0.1,green:0.2, blue: 0.45), location: 0.5),
                .init(color: .green, location: 0.5)
            ], center:.top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                VStack(spacing:15){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.primary)
                            .font(.largeTitle.weight(.semibold))
                    }
                    HStack(spacing:30){
                        Text("Score:\(Score)")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.green).clipShape(RoundedRectangle(cornerRadius:10, style: .continuous))
                        Button("Reset Game"){
                            Score = 0;
                            askQ()
                        }.buttonStyle(.borderedProminent)
                            .tint(.red)
                            .font(.headline)

                    }
                    ForEach(0..<3){ number in
                        Button{
                            flagTap(number)
                        }label:{
                            Image(countries[number])
                                .renderingMode(.original)
                                .clipShape(Capsule())
                                .shadow(radius: 10)
                        }
                    }
                }.frame(maxWidth:.infinity)
                    .padding(.vertical,20)
                    .background(.thinMaterial)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()

            }.padding()
            }
//        .alert(scoreTitle,isPresented: $showingScore){
//                Button("Continue",action: askQ)
//            } message: {
//                Text("Your score is \(Score)")
//            }
        }
    
    func flagTap(_ number: Int){
            if number == correctAnswer{
                scoreTitle = "Correct"
                Score+=1
                askQ()
            }else{
                scoreTitle = "Wrong"
                askQ()
            }
        showingScore.toggle()
        }
    func askQ(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }

 
