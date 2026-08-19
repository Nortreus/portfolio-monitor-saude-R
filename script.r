# =====================================================================
# Projeto Avançado: Análise de Tendência de Estilo de Vida e Sono
# Autor: Rafael Silveira Assunção
# =====================================================================

# Setup do ambiente no webR
webr::install("ggplot2")
library(ggplot2)

# --- 1. Modelagem Baseada em Tendência Comportamental ---
set.seed(42) 
total_amostra <- 400

# Fator latente de estilo de vida para guiar a tendência de comportamento
estilo_vida <- rnorm(total_amostra, mean = 0, sd = 1)

# Passos Diários: Variação orgânica baseada na tendência individual
passos <- round(7000 + (estilo_vida * 1800) + rnorm(total_amostra, mean = 0, sd = 400), 0)

# Duração do Sono: Alinhada à mesma tendência, sem travas artificiais
sono <- round(7.0 + (estilo_vida * 0.8) + rnorm(total_amostra, mean = 0, sd = 0.3), 1)

# Nível de Estresse: Inversamente proporcional à saúde do estilo de vida
estresse_score <- 5.5 - (estilo_vida * 2) + rnorm(total_amostra, mean = 0, sd = 0.8)
estresse_num <- pmax(pmin(round(estresse_score), 10), 1)

# Consolidação do Data Frame
dados_analise <- data.frame(
  Daily.Steps = passos,
  Sleep.Duration = sono,
  Stress.Level = estresse_num
)

# Segmentação do nível de estresse para categorias de negócio
dados_analise$Categoria_Estresse <- ifelse(dados_analise$Stress.Level <= 4, "Baixo",
                                    ifelse(dados_analise$Stress.Level <= 7, "Moderado", "Alto"))

# --- 2. Análise Estatística ---
print("=== INDICADORES GERAIS DA POPULAÇÃO ===")
cat("Total de indivíduos analisados:", nrow(dados_analise), "\n")
cat("Média de passos da amostra:", round(mean(dados_analise$Daily.Steps), 0), "\n")
cat("Média de sono da amostra:", round(mean(dados_analise$Sleep.Duration), 1), "horas.\n\n")

print("=== FORÇA DA TENDÊNCIA COMPORTAMENTAL ===")
correlacao <- cor(dados_analise$Daily.Steps, dados_analise$Sleep.Duration)
cat("Índice de Correlação Linear (Pearson):", round(correlacao, 3), "\n")

# --- 3. Visualização de Dados ---
ggplot(data = dados_analise, aes(x = Daily.Steps, y = Sleep.Duration, color = Categoria_Estresse)) +
  geom_jitter(size = 2.5, alpha = 0.7, width = 50, height = 0.05) +
  geom_smooth(method = "lm", se = FALSE, color = "#2c3e50", size = 1.2) +
  scale_color_manual(values = c("Baixo" = "#2ecc71", "Moderado" = "#f1c40f", "Alto" = "#e74c3c")) +
  labs(
    title = "Estudo de Tendência: Estilo de Vida Ativo vs. Sono",
    subtitle = "Alinhamento orgânico entre alta atividade física e maior tempo de repouso",
    x = "Passos Diários",
    y = "Duração do Sono (Horas)",
    color = "Nível de Estresse"
  ) +
  theme_minimal()
