//
//  ChessView.swift
//  Krutarth
//
//  Created by Ananth on 15/08/24.
//




import SwiftUI

struct ChessView: View {
    
    @State private var isExpanded = false
    
    var body: some View {
        VStack {
            OpponentView(isWhite: false)
            Spacer()
            Text("Krutarth S. Karkala").font(.title).foregroundColor(.green).bold()
            Spacer()
            Button("Toggle") {
                            withAnimation {
                                isExpanded.toggle()
                            }
                        }
                        if isExpanded {
                            Text("Expanded content")
                                .frame(height: 100)
                            
                            Button {
                                print("Button Clicked")
                            } label: {
                                Text("Click").font(.title).foregroundColor(.blue).bold()
                                    
                            }.border(.red, width: 3).padding()
                        }
            Spacer()
            OpponentView(isWhite: true)
        }.padding(50)
    }
}


struct WhitePieces {
    static let king = "♔"
    static let queen = "♕"
    static let knight = "♘"
    static let bishop = "♗"
    static let rook = "♖"
    static let pawn = "♙"
}

struct BlackPieces {
    static let king = "♚"
    static let queen = "♛"
    static let knight = "♞"
    static let bishop = "♝"
    static let rook = "♜"
    static let pawn = "♟"
}

struct SquareView: View {
    var isWhite: Bool = true
    var piece: String = WhitePieces.pawn
    var color: Color = .white
    
    @State var isFaceUp: Bool = true

    var body: some View {
        
        let pieceText = Text(piece)
        let rectangle = Rectangle()
        
        ZStack {
            if isFaceUp {
                rectangle
                    .foregroundColor(.gray).brightness(0.4)
                    .frame(width: 40, height: 40)
                    .border(.black, width: 2)
            } else {
                rectangle
                    .fill(.yellow)
                    .frame(width: 40, height: 40)
                    .border(.blue, width: 2).brightness(0.4)
            }
            
            pieceText
                .font(.system(size: (piece == BlackPieces.pawn) ? 15 : 30, weight: .bold))
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding(0)
        .onTapGesture(count: 1, perform: {
            print("Tapped = \(piece)")
            isFaceUp.toggle() //isFaceUp = !isFaceUp
        })
        

    }
}

struct OpponentView: View {
    var isWhite: Bool = true
    var body: some View {
        
        VStack(spacing: 5.0) {
            if isWhite == true  {
                HStack (spacing: 5.0){
                    ForEach(1...8, id: \.self) { index in
                        SquareView(piece: !isWhite ? BlackPieces.pawn : WhitePieces.pawn )
                    }
                }
                HStack (spacing: 5.0){
                    SquareView(piece: !isWhite ? BlackPieces.rook : WhitePieces.rook )
                    SquareView(piece: !isWhite ? BlackPieces.knight : WhitePieces.knight )
                    SquareView(piece: !isWhite ? BlackPieces.bishop : WhitePieces.bishop )
                    SquareView(piece: !isWhite ? BlackPieces.queen : WhitePieces.queen )
                    SquareView(piece: !isWhite ? BlackPieces.king : WhitePieces.king )
                    SquareView(piece: !isWhite ? BlackPieces.bishop : WhitePieces.bishop )
                    SquareView(piece: !isWhite ? BlackPieces.knight : WhitePieces.knight )
                    SquareView(piece: !isWhite ? BlackPieces.rook : WhitePieces.rook )
                    
                }
            }
            else {
                HStack (spacing: 5.0){
                    SquareView(piece: !isWhite ? BlackPieces.rook : WhitePieces.rook )
                    SquareView(piece: !isWhite ? BlackPieces.knight : WhitePieces.knight )
                    SquareView(piece: !isWhite ? BlackPieces.bishop : WhitePieces.bishop )
                    SquareView(piece: !isWhite ? BlackPieces.queen : WhitePieces.queen )
                    SquareView(piece: !isWhite ? BlackPieces.king : WhitePieces.king )
                    SquareView(piece: !isWhite ? BlackPieces.bishop : WhitePieces.bishop )
                    SquareView(piece: !isWhite ? BlackPieces.knight : WhitePieces.knight )
                    SquareView(piece: !isWhite ? BlackPieces.rook : WhitePieces.rook )
                    
                }
                HStack (spacing: 5.0){
                    ForEach(1...8, id: \.self) { number in
                        SquareView(piece: !isWhite ? BlackPieces.pawn : WhitePieces.pawn )
                    }
                }
                
            }
            
        }.padding(1.0)
    }
}



#Preview {
    ChessView()
}

