library(ggplot2)
library(dplyr)

data_297_1 <- read.table("trimmomatic_output/297_1_distribution.txt", header = TRUE)
data_297_2 <- read.table("trimmomatic_output/297_2_distribution.txt", header = TRUE)
combined_297 <- bind_rows("R1" = data_297_1, "R2" = data_297_2, .id = "Read")

data_381_1 <- read.table("trimmomatic_output/381_1_distribution.txt", header = TRUE)
data_381_2 <- read.table("trimmomatic_output/381_2_distribution.txt", header = TRUE)
combined_381 <- bind_rows("R1" = data_381_1, "R2" = data_381_2, .id = "Read")


ggplot(combined_297, aes(x = Read_Length, y = log10(Count), color = Read)) +
  geom_point(stat = "identity", alpha = 0.5) +
  labs(title = "SRR25630297 trimmed read distribution", x = "Read Length", y = "Count (log10)") +
  scale_color_manual(values = c("darkgreen", "cornflowerblue")) +
  theme_bw()
ggsave("297_distribution.png", width=8,height=5)


ggplot(combined_381, aes(x = Read_Length, y = log(Count), color = Read)) +
  geom_point(stat = "identity", alpha = 0.5) +
  labs(title = "SRR25630381 trimmed read distribution", x = "Read Length", y = "Count (log10)") +
  scale_color_manual(values = c("darkgreen", "cornflowerblue")) +
  theme_bw()
ggsave("381_distribution.png", width=8,height=5)

