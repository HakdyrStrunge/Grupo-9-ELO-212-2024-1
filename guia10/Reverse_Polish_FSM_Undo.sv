`timescale 1ns / 1ps

module Reverse_Polish_FSM_Undo(
    input logic clk, reset, EnterPulse,Undo,
    
    output logic LoadOpA, LoadOpB,
                 LoadOpCode, ToDisplaySel,
                 updateRes,
    output logic [2:0] Status
                 
    );
 //Definimos los estados
 enum logic [6:0] {Entering_OpA, Load_OpA, Entering_OpB,
                   Load_OpB, Entering_OpCode, Load_OpCode,
                   Show_Result} state, next_state;
                 
                 
 always_ff @(posedge clk) begin
    if (reset)
        state <= Entering_OpA;
    else
        state <= next_state;
    end                
    
    
  always_comb begin
  next_state = state;       
        case(state)           
             Entering_OpA: begin
                           if (EnterPulse)
                               next_state = Load_OpA;
                           end 
             
             Load_OpA: next_state = Entering_OpB;
             
             Entering_OpB: begin if (EnterPulse) begin
                               next_state = Load_OpB;
                           end if (Undo) begin
                               next_state = Entering_OpA;
                           end   
                    end
             Load_OpB: next_state = Entering_OpCode;
             
             Entering_OpCode: begin
                              if (EnterPulse) begin
                                 next_state = Load_OpCode;
                              end if (Undo) begin
                               next_state = Entering_OpB;
                              end  
                     end
             Load_OpCode: next_state = Show_Result;
             
             Show_Result: begin
                          if (EnterPulse) begin
                              next_state = Entering_OpA;
                          end else if (Undo) begin
                               next_state = Entering_OpCode;
                           end  
                    end
             default: next_state = Entering_OpA;
        endcase     
  end
  
  
  always_comb begin
      
      case(state)
      
            Entering_OpA: begin
                            Status = 3'b000;
                            LoadOpA = 0; 
                            LoadOpB = 0;
                            LoadOpCode = 0;
                            ToDisplaySel = 0;
                            updateRes = 0;
                          end
            
            Load_OpA: begin  
                        Status = 3'b001;
                            LoadOpA = 1; 
                            LoadOpB = 0;
                            LoadOpCode = 0;
                            ToDisplaySel = 0;
                            updateRes = 0;
                      end
            
            Entering_OpB: begin   
                            Status = 3'b010;
                            LoadOpA = 0; 
                            LoadOpB = 0;
                            LoadOpCode = 0;
                            ToDisplaySel = 0;
                            updateRes = 0;
                          end
                          
            Load_OpB: begin  
                        Status = 3'b011;
                        LoadOpA = 0; 
                        LoadOpB = 1;
                        LoadOpCode = 0;
                        ToDisplaySel = 0;
                        updateRes = 0;
                      end   
            
            Entering_OpCode: begin   
                               Status = 3'b100;
                               LoadOpA = 0; 
                               LoadOpB = 0;
                               LoadOpCode = 0;
                               ToDisplaySel = 0;
                               updateRes = 0;
                             end
                             
            Load_OpCode: begin  
                            Status = 3'b101;
                            LoadOpCode = 1;
                            LoadOpA = 0; 
                            LoadOpB = 0;
                            LoadOpCode = 1;
                            ToDisplaySel = 0;
                            updateRes = 0;
                         end
            
            Show_Result: begin
                            Status = 3'b110;
                            LoadOpA = 0; 
                            LoadOpB = 0;
                            LoadOpCode = 0;
                            ToDisplaySel = 1;
                            updateRes = 1;
                         end
            
            default: begin
                        Status = 0;
                        LoadOpA = 0; 
                        LoadOpB = 0;
                        LoadOpCode = 0;
                        ToDisplaySel = 0;
                        updateRes = 0;
                     end  
      endcase               
    end                 
                                                                        
endmodule
