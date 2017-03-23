plot_troops <- ggplot (troops, aes(long, lat)) +
  geom_path(aes(size = survivors,
                color = direction,
                group = group))
plot_troops

plot_both <- plot_troops +
  geom_text(data = cities, aes(label = city), size = 4)
plot_both

plot_polished <- plot_both +
  scale_size (range = c(0,12),
              breaks = c(10000, 20000, 30000),
              labels = c("10,000", "20,000", "30,000")) +
  scale_color_manual(values = c("tan", "grey50")) +
  coord_map() +
  labs(title = "Map of Napoleon's Russian campaign of 1812",
       x = NULL,
       y = NULL)
plot_polished

plot_polished +
  theme_void() +
  theme(legend.position = "none")