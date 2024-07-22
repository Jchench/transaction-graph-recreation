# Load required libraries
library(tidyverse)
library(ggthemes)

# Load the data
data <- read_csv("four_party_scheme_interchange.csv")

colnames(data) <- make.names(colnames(data))

# Create the plot
ggplot(data, aes(x = Standard.card.transaction, y = reorder(Country.Region, Standard.card.transaction), color = Type)) +
  geom_point(size = 3) +
  scale_color_manual(values = c('Credit' = 'blue', 'Debit' = 'red'),
                     labels = c('Credit', 'Debit')) +
  labs(title = "Interchange Fees",
       subtitle = "\nTypical costs of a $50 transaction across four-party schemes in five countries.\nReserve Bank of Australia, Review of Retail Payments Regulation, October 2021.",
       x = "\nTypical Interchange Fee",
       y = "",
       color = "") +
  scale_x_continuous(breaks = c(0,00, 0.25, 0.50, 0.75, 1.00, 1.25, 1.50),
                     limits = c(0, 1.5),
                     labels = function(x) paste0("$", x)) +
  theme_economist() +
  theme(legend.position = "right",
        plot.subtitle = element_text(size = 10, hjust = 0))
