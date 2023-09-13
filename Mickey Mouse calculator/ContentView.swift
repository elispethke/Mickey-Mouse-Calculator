//
//  ContentView.swift
//  Mickey Mouse calculator
//
//  Created by Elisangela Pethke on 13.09.23.
//

import SwiftUI


struct ContentView: View {
    
       @State var values = "0"
       @State var previous = 0.0
       @State var result = 0.0
       @State var decimal = 0.0
       
       @State var operation = 0
       @State var previousOperation = 0
       
       func removeZerosFromEnd(value: Double) -> String {
           let f = NumberFormatter()
           let number = NSNumber(value: value)
           f.minimumFractionDigits = 0
           f.maximumFractionDigits = 16
           return f.string(from: number) ?? ""
       }
       
       func process(digit: Int) {
           if operation > 0 {
               result = 0
               previousOperation = operation
               operation = -1
           }
           
           if decimal > 0.0 {
               result = result + Double(truncating: NSNumber(value: (Double(digit) / decimal)))
               decimal = decimal * 10
               values = "\(values)\(digit)"
           } else {
               result = (result * 10) + Double(digit)
               values = removeZerosFromEnd(value: result)
           }
       }
       
       func reset() {
           previous = 0
           result = 0
           previousOperation = 0
           operation = 0
           decimal = 0
           values = "0"
       }
       
       func calculate() {
           if previousOperation == 1 {
               result = previous + result
               previousOperation = 0
           } else if previousOperation == 2 {
               result = previous - result
               previousOperation = 0
           } else if previousOperation == 3 {
               result = previous * result
               previousOperation = 0
           } else if previousOperation == 4 {
               result = previous / result
               previousOperation = 0
           }
           decimal = 0.0
           previous = result
           values = removeZerosFromEnd(value: result)
       }
       
    
    var body: some View {
        
        ZStack {
            Image("Mickey")
                .resizable()
                .edgesIgnoringSafeArea(.all)
           
               
            VStack (alignment: .trailing,spacing: 12){
                
              Spacer()
             .padding(.bottom)
                
                HStack(spacing: 12){
                    
                    Text(values)
                    
                        .padding()
                        .lineLimit(1)
                        .font(.system(size: CGFloat(80 / Int((Double(String(result).count + 10) / 9.0)))))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .fixedSize(horizontal: true, vertical: false)
                    
                  
                    
                }// 1 HStack
               
                
                HStack(spacing: 16){
                    Button{
                       reset()
                       result = 0
                        
                    } label: {
                        Text("AC")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(Color("PrimeiraCor"))
                            .cornerRadius(40)
                    }

                    Button{
                        calculate()
                        result = result * -1
                        
                        
                    } label: {
                        Text("+/-")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(Color("PrimeiraCor"))
                            .cornerRadius(40)
                    }
                    Button{
                    
                       result = result / 100
                       calculate()
                        
                    } label: {
                        Text("%")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(Color("PrimeiraCor"))
                            .cornerRadius(40)
                    }
                    Button{
                        calculate()
                        operation = 4
                        
                    } label: {
                        Text("/")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(Color("SegundaCor"))
                            .cornerRadius(40)
                            
                    }
                }
               
                HStack(spacing: 16){
                    
                    Button {
                        process(digit: 7)
                    } label: {
                        Text("7")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                    }
                    
                    Button {
                        process(digit: 8)
                    } label: {
                        Text("8")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                    }
                    Button {
                      process(digit: 9)
                    } label: {
                        Text("9")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                    }
                    
                    Button {
                        calculate()
                        operation = 3
                    } label: {
                        Text("X")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(Color("SegundaCor"))
                            .cornerRadius(40)
                    }

                }// Segunda HS
                
                HStack(spacing: 16){
                    Button {
                        process(digit: 4)
                    } label: {
                        Text("4")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                        
                    }
                    Button {
                        process(digit: 5)
                    } label: {
                        Text("5")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                        
                    }
                    Button {
                        process(digit: 6)
                    } label: {
                        Text("6")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                        
                    }
                    Button {
                        calculate()
                        operation = 2
                    } label: {
                        Text("-")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(Color("SegundaCor"))
                            .cornerRadius(40)
                        
                    }

                }// Terceira HS
                
                HStack(spacing: 16){
                    Button {
                        process(digit: 1)
                    } label: {
                        Text("1")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                    }
                    Button {
                        process(digit: 2)
                    } label: {
                        Text("2")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                    }
                    Button {
                        process(digit: 3)
                    } label: {
                        Text("3")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(.yellow)
                            .cornerRadius(40)
                    }
                    
                    Button {
                        calculate()
                       operation = 1
                    } label: {
                        Text("+")
                            .foregroundColor(.white)
                            .font(.title)
                            .frame(width: 80, height: 80)
                            .background(Color("SegundaCor"))
                            .cornerRadius(40)
                    }
                }// Quarta HS
                
                GeometryReader{ geometry in
                    HStack(spacing: 16){
                        Button {
                            process(digit: 0)
                        } label: {
                            Text("0")
                                .foregroundColor(.white)
                                .font(.title)
                                .frame(minWidth: geometry.size.width / 2, maxHeight: 70)
                                .background(.yellow)
                                .cornerRadius(40)
                                
                            
                        }
                        Button {
                            if decimal == 0.0{
                           decimal = 10.0
                                values = values + "."
                                }
                                
            
                        } label: {
                         Text(".")
                                .foregroundColor(.white)
                                .font(.title)
                                .frame(width: 80, height: 80)
                                .background(.yellow)
                                .cornerRadius(40)
                        }

                        
                        Button {
                            calculate()
                            previousOperation = 999
                            operation = 999
                        } label: {
                            Text("=")
                                .foregroundColor(.white)
                                .font(.title)
                                .frame(width: 80, height: 80)
                                .background(Color("SegundaCor"))
                                .cornerRadius(40)
                            
                        }
                    
                    }
                   
                }
            }
            
        }
    }
}

    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
