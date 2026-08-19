# Análise de Tendência Comportamental: Atividade Física vs. Sono com R

Este projeto avalia o impacto do estilo de vida ativo na duração do sono e nos níveis de estresse, utilizando uma amostra de 400 registros. 

A análise modela o comportamento humano de forma orgânica: a tendência de se exercitar bastante e a tendência de dormir bem se reforçam mutuamente. O código foi desenvolvido e executado inteiramente via **webR (R em WebAssembly)** direto no navegador, sem necessidade de instalação local.

---

## Visualização dos Dados

O gráfico cruza os passos diários (eixo X) com a duração do sono (eixo Y). A reta escura mostra a tendência calculada e as cores mapeiam o nível de estresse gerado por essa rotina.

![Análise de Passos vs Sono](grafico_saude.png)

---

## 🔍 Análise Detalhada do Gráfico

A visualização consolida o cruzamento de três dimensões analíticas (Passos, Sono e Estresse) e revela padrões comportamentais claros na amostra:

1. **Tendência Linear Positiva (Reta de Regressão):** 
   A linha escura que corta o gráfico diagonalmente comprova de forma visual a forte correlação positiva do modelo. Há um comportamento diretamente proporcional: à medida que a contagem de **Passos Diários** se desloca da esquerda para a direita (indivíduos mais ativos), a **Duração do Sono** responde subindo verticalmente de forma livre, variando organicamente entre 5h e mais de 9h.

2. **Estratificação Lógica do Estresse (Gradiente de Cores):**
   O agrupamento das cores valida o impacto do estilo de vida no bem-estar pessoal:
   * **Zona de Alto Risco (Vermelho):** Concentrada no canto inferior esquerdo. Mostra que volumes baixos de atividade física (abaixo de 5.500 passos) e restrição de sono (menos de 6,5 horas) estão fortemente associados a níveis de estresse **Altos**.
   * **Zona de Transição (Amarelo):** Localizada na faixa central (entre 5.500 e 8.000 passos). Representa indivíduos de perfil **Moderado**, servindo como um ponto de virada no estilo de vida.
   * **Zona de Alta Performance (Verde):** Predominante no quadrante superior direito. Indivíduos que mantêm uma rotina ativa (acima de 8.000 passos) e alcançam um descanso reparador (acima de 7,5 horas) registram, quase em sua totalidade, níveis de estresse **Baixos**.

3. **Dispersão Realista (Tratamento de Overplot com Jitter):**
   A aplicação do ruído controlado (`geom_jitter`) permitiu enxergar a real densidade e volume da população estudada, evitando o empilhamento artificial de pontos idênticos e mantendo as margens extremas da distribuição totalmente visíveis (como os perfis que superam 11.000 passos diários e encostam em 9 horas de sono).

---

## Conceitos Estatísticos e Técnicos Aplicados

* **Variável Latente de Comportamento:** Modelagem de dados baseada em uma raiz comum de estilo de vida, fazendo com que as variáveis de hábitos se relacionem de forma natural, sem travas artificiais no código.
* **Cálculo de Correlação:** Aplicação do coeficiente de Pearson para validar numericamente a força da relação entre atividade diária e descanso.
* **Manipulação de Fatores:** Uso da função `factor()` para garantir a consistência das categorias no processamento.
* **Data Visualization em Camadas:** Gráfico de dispersão com ajuste de sobreposição (`geom_jitter`), reta de tendência linear (`geom_smooth`) e customização de paleta de cores condicional via `ggplot2`.

---

## Insights Técnicos do Modelo

* **Correlação Linear Forte:** O modelo indica uma forte correlação positiva (na faixa de 0.85 a 0.90), provando estatisticamente o alinhamento entre dias mais ativos e noites de sono mais longas.
* **Agrupamento de Estresse:** O cruzamento visual deixa claro que o quadrante de alta atividade física e alto descanso concentra os indivíduos com menores índices de estresse (pontos verdes).

---

## Como Executar

1. Acesse o console interativo em [webR REPL](https://webr.sh).
2. Copie o código do arquivo `script.R` deste repositório.
3. Cole no terminal do site e pressione `Enter`.
