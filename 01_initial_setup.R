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
  labs(title = 'Four-party Scheme Interchange',
       subtitle = '$50 transaction',
       x = 'Interchange Value ($)',
       y = '',
       color = '') +
  theme_economist() +
  theme(legend.position = 'top')
