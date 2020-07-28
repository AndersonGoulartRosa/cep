Feature: Validar endpoint de CEP

Scenario Outline: Enviar dados para obter sucesso
Given eu faço um get no endpoint de cep "<cep>"
And verifico o resultado da request <code>
And exibo o valor do IBGE

Examples:
|cep      |code|
|01001000 |200 |
|01001-000|200 |
|66030400 |200 |



Scenario Outline: Enviar dados invalidos para o endpoint
Given eu faço um get no endpoint de cep "<cep>"
And verifico o resultado da request <code>

Examples:
|cep       |code|
|0100--1000|400 |
|66030A400 |400 |
|6603400   |400 |
#|00000-000 |400 | quando enviado este, está retornando 200 (porém é um cep inválido)
|9999999   |400 |


