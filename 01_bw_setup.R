library(tidyverse)
library(ggthemes)

# Sample data (replace this with your actual data)
data <- read_csv("four_party_scheme_interchange.csv")

colnames(data) <- make.names(colnames(data))

# Create the plot with shapes instead of colors
ggplot(data, aes(x = Standard.card.transaction, y = reorder(Country.Region, Standard.card.transaction), shape = Type)) +
  geom_point(size = 3) +
  scale_shape_manual(values = c('Credit' = 16, 'Debit' = 17),  # You can change 16 and 17 to other shape codes
                     labels = c('Credit', 'Debit')) +
  labs(title = "Interchange Fees\n",
       x = "\nTypical Interchange Fee",
       y = "",
       shape = "") +  # Change color to shape
  scale_x_continuous(breaks = seq(0, 1.5, 0.25),
                     limits = c(0, 1.5),
                     labels = function(x) paste0("$", x)) +
  theme_economist_white() +
  theme(legend.position = "right")
