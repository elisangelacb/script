chicago <- readRDS("C:\\Users\\ADM\\Downloads\\chicago.rds")

chic <- chicago %>% 
  select(tmpd:no2tmean2)

chic <- chic %>% 
  rename("ºF" = tmpd, "Tem_orv" = dptp, Data = date, PM25 = pm25tmean2,
         PM10 = pm10tmean2, "Ozônio" = o3tmean2, 
         "D_Sulfato" = no2tmean2) 
chic

# transformar em tibble 

chic <- as_tibble(chic)

anyNA(chic$PM25) #verifica se tem valor ausente no vetor.

chicago <- chic %>% 
  mutate(PM25difmean = PM25 - mean(PM25, na.rm = TRUE))



chicago <- chicago %>% 
  mutate("ºC" = (ºF - 32)/1.8) 

### função arrange()
### arranjar conforme a data...
chicago <- chicago %>% 
  arrange(Data) 

chicago
tail(chicago)

#separar a variÃ¡vel Data em mais variÃ¡veis.
chicago <- chicago %>% 
  separate(Data, c("Ano", "Mês", "Dia"), sep = "-")

head(chicago)

## inverso do separate() Ã© o unite()

chicago <- chicago %>% 
  unite(Data, "Ano", "Mês", "Dia", sep = "-")

chicago

