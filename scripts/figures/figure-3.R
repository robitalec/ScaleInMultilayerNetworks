  saveRDS(out, 'data/derived-data/2-landcover-scale.Rds')
saveRDS(count, 'data/derived-data/2-landcover-scale-count.Rds')
ggplot(count[lc %in% c(1, 2, 3)]) + geom_line(aes(res, N, color = factor(lc), group = lc))


ggplot(out) + geom_line(aes(lcres, propedges, color = layer))


ggplot(out) + geom_line(aes(lcres, graphstrength, color = ANIMAL_ID)) + facet_wrap(~layer) + guides(color = FALSE)