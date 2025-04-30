module Contador (
    input  wire clk,
    input  wire rst_n,
    input  wire acrescer,
    input  wire decrecer, // Nome correto conforme testbench
    output reg [7:0] saida
);

always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        // Reset assíncrono ativo baixo: inicializa com 106
        saida <= 8'd106;
    end else begin
        // Lógica de controle priorizada
        if (acrescer && !decrecer) begin
            saida <= saida + 1;  // Incrementa
        end else if (!acrescer && decrecer) begin
            saida <= saida - 1;  // Decrementa
        end
        // Caso contrário mantém o valor
    end
end

endmodule