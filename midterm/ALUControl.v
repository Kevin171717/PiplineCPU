module ALUControl( clk, Signal, SignaltoALU, SignaltoSHT, SignaltoMULTU, SignaltoMUX );
  // I/O
  input clk;
  input[5:0] Signal;
  output[5:0] SignaltoMUX;
  output SignaltoMULTU, SignaltoSHT;
  output[2:0] SignaltoALU;
  
  
  // define signal
  parameter AND = 6'b100100; // d36
  parameter OR  = 6'b100101; // d37
  parameter ADD = 6'b100000; // d32
  parameter SUB = 6'b100010; // d34
  parameter SLT = 6'b101010; // d42
  parameter SLL = 6'b000000; // d0
  parameter MULTU = 6'b011001;// d25
  
  
  // connect input with output signal
  assign SignaltoALU = (Signal == AND)? 3'b000 :
                       (Signal == OR)? 3'b001 :
                       (Signal == ADD)? 3'b010 :
                       (Signal == SUB)? 3'b110 :
                       3'b111;
  assign SignaltoSHT = (Signal == SLL)? 1 : 0;
  assign SignaltoMULTU = (Signal == MULTU)? 1 : 0;
  assign SignaltoMUX = Signal;
  
endmodule