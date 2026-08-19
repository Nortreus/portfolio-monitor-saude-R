# Análise de Tendência Comportamental: Atividade Física vs. Sono com R

Este projeto avalia o impacto do estilo de vida ativo na duração do sono e nos níveis de estresse, utilizando uma amostra simulada de 400 registros. 

A análise foge de importações simples e modela o comportamento humano de forma orgânica, onde a tendência de se exercitar muito e a tendência de dormir bem se reforçam mutuamente. O código roda inteiramente via **webR (R em WebAssembly)** direto no navegador.

---

## Visualização dos Dados

O gráfico cruza os passos diários (eixo X) com a duração do sono (eixo Y). A reta escura mostra a tendência calculada e as cores mapeiam o nível de estresse gerado por essa rotina.

![Análise de Passos vs Sono](grafico_saude.png)

---

## Conceitos Estatísticos e Técnicos Aplicados

* **Variável Latente de Comportamento:** Modelagem de dados baseada em uma raiz comum de estilo de vida, fazendo com que as variáveis de hábitos se relacionem de forma natural, sem travas artificiais no código.
* **Cálculo de Correlação:** Aplicação do coeficiente de Pearson para validar numericamente a força da relação entre atividade diária e descanso.
* **Manipulação de Fatores:** Uso da função `factor()` para garantir a consistência das categorias no processamento.
* **Data Visualization em Camadas:** Gráfico de dispersão com ajuste de sobreposição (`geom_jitter`), reta de tendência linear (`geom_smooth`) e customização de paleta de cores condicional via `ggplot2`.

---

## Insights Técnicos do Modelo

* **Correlação Linear Forte:** O modelo indica uma forte correlação positiva (faixa de 0.85 a 0.90), provando estatisticamente o alinhamento entre dias mais ativos e noites de sono mais longas.
* **Agrupamento de Estresse:** O cruzamento visual deixa claro que o quadrante de alta atividade física e alto descanso concentra os indivíduos com menores índices de estresse (pontos verdes).

---

## Como Executar

1. Acesse o console interativo em [webR REPL](https://webr.sh).
2. Copie o código do arquivo `script.R` deste repositório.
3. Cole no terminal do site e pressione `Enter`.
