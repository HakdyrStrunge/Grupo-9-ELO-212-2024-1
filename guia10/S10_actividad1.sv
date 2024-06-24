module S10_actividad11#(parameter N_DEBOUNCER = 10) (
    input logic clk, 
                resetN, 
                Enter, 
                Undo, 
    input logic [15:0] DataIn,
    
    output logic [6:0] Segments,
    output logic [7:0] Anodes,
    output logic [4:0] Flags, // {N, Z, C, V, P}
    output logic [2:0] Status
);
    logic EnterPulse, UndoPulse; //salidas que conectan al FSM polish
    logic EnterPressed, UndoPressed;
    logic EnterReleased, UndoReleased;
    logic LoadOpA, LoadOpB;
    logic LoadOpCode, ToDisplaySel;
    logic updateRes;
    logic [4:0] Flags_ALU;
    logic [15:0] DataOut_A;
    logic [15:0] DataOut_B;
    logic [15:0] Result_ALU;
    logic [15:0] Result_ALU2;
    logic [1:0] OpCodeOut;
    logic [31:0] ToDisplay;
    
    PB_Debouncer_FSM debouncer_Enter(
        .clk(clk),
        .rst(~resetN),
        .PB(Enter),
        .PB_pressed_status(EnterPressed),
        .PB_pressed_pulse(EnterPulse),
        .PB_released_pulse(EnterReleased)
    );
    PB_Debouncer_FSM debouncer_Undo(
        .clk(clk),
        .rst(~resetN),
        .PB(Undo),
        .PB_pressed_status(UndoPressed),
        .PB_pressed_pulse(UndoPulse),
        .PB_released_pulse(UndoReleased)
    );
    
    Reverse_Polish_FSM_Undo RPFSM_Undo(
        .clk(clk),
        .reset(~resetN),
        .EnterPulse(EnterPulse),
        .Undo(UndoPulse),
        .LoadOpA(LoadOpA),
        .LoadOpB(LoadOpB),
        .LoadOpCode(LoadOpCode),
        .ToDisplaySel(ToDisplaySel),
        .updateRes(updateRes),
        .Status(Status)
        );
        
    reset_over_load #(16) OpA_reg_cond (
        .clk(clk),
        .reset(~resetN),
        .D(DataIn),
        .load(LoadOpA),
        .Q(DataOut_A)
    );
    
    reset_over_load #(16) OpB_reg_cond ( 
        .D(DataIn),
        .clk(clk),
        .reset(~resetN),
        .load(LoadOpB),
        .Q(DataOut_B)
    );
    reset_over_load #(2) OpCode_reg_cond (
        .clk(clk),
        .reset(~resetN),
        .D(DataIn[1:0]),
        .load(LoadOpCode),
        .Q(OpCodeOut)
        );
    
    ALU #(16) ALU (
        .A(DataOut_A),
        .B(DataOut_B),
        .OpCode(OpCodeOut),
        .Flags(Flags_ALU),
        .Result(Result_ALU)
    );
    reset_over_load #(16) Result_reg_cond ( 
        .clk(clk),
        .reset(~resetN),
        .D(Result_ALU),
        .load(updateRes),
        .Q(Result_ALU2));
    
    reset_over_load #(5) Flags_red_cond (
        .clk(clk),
        .reset(~resetN),
        .D(Flags_ALU),
        .load(updateRes),
        .Q(Flags));
        
    Display_selector Display_selector (
        .datain(DataIn),
        .ToDisplaySel(ToDisplaySel),
        .result(Result_ALU2),
        .ToDisplay(ToDisplay)
   );
   
   NumTo7seg NT7S(
    .clk(clk),
    .reset(~resetN),
    .ToDisplay(ToDisplay),
    
    .Anodes(Anodes),
    .Segments(Segments)
   );

endmodule

