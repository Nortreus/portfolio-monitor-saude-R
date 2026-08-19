# =====================================================================
# Projeto: Monitoramento Semanal de Atividade e Sono
# Autor: Rafael Silveira Assunção
# =====================================================================

# Setup do ambiente no webR
webr::install("ggplot2")
library(ggplot2)

# --- 1. Dados Brutos da Semana ---
dias <- c("Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom")
meus_passos <- c(5210, 5457, 7035, 6667, 5269, 6031, 4884)
meu_sono_decimal <- c(6.07, 5.82, 6.40, 6.55, 5.67, 11.40, 7.22)

# Parâmetro de negócio do projeto
meta_passos <- 6000

dados_reais <- data.frame(
  Dia = factor(dias, levels = dias),
  Passos = meus_passos,
  Sono = meu_sono_decimal
)

# --- 2. Métricas de Resumo ---
cat("Média de passos diários:", round(mean(dados_reais$Passos), 0), "\n")
cat("Recorde de passos na semana:", max(dados_reais$Passos), "\n")

# --- 3. Construção do Gráfico ---
ggplot(data = dados_reais, aes(x = Dia, y = Passos, fill = Sono)) +
  geom_bar(stat = "identity", width = 0.7, color = "white") +
  
  # Adiciona a linha de meta horizontal (vermelha e tracejada)
  geom_hline(yintercept = meta_passos, color = "#e74c3c", linetype = "dashed", size = 1) +
  
  # Cria uma etiqueta de texto logo acima da linha de meta
  annotate("text", x = 1.2, y = meta_passos + 250, label = "Meta: 6k passos", color = "#e74c3c", fontface = "bold") +
  
  scale_fill_gradient(low = "#74b9ff", high = "#0984e3") +
  labs(
    title = "Relação entre Atividade Física e Qualidade do Sono",
    subtitle = "Linha tracejada indica os dias em que a meta de passos foi atingida",
    x = "Dia da Semana",
    y = "Passos Dados",
    fill = "Horas de Sono"
  ) +
  theme_minimal()
