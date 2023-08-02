# Calculadora
Calculadora usando conceitos (básicos) de orientação a objetos.

* Quando digitarmos um número e escolhermos uma operação, a calculadora checa se é a primeira vez. 
	* Se for, o resultado é o número do visor. 
* Conforme trocamos, as operações são executadas, o valor é armazenado e a operação é atualizada.
* Ao clicar em igual, checamos se é a primeira vez. 
	* Se for, executamos a última operação com o número do visor. 
	* Caso não seja, a operação será executada, mas usamos o que guardamos do visor no primeiro clique de igual. Isso permite que façamos 5 / 5 * 2 (igual, igual).
