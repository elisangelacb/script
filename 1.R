chicago <- readRDS("C:\\Users\\ADM\\Downloads\\chicago.rds")

chic <- chicago %>% 
  select(tmpd:no2tmean2)

chic <- chic %>% 
  rename("�F" = tmpd, "Tem_orv" = dptp, Data = date, PM25 = pm25tmean2,
         PM10 = pm10tmean2, "Oz�nio" = o3tmean2, 
         "D_Sulfato" = no2tmean2) 
chic

# transformar em tibble 

chic <- as_tibble(chic)

anyNA(chic$PM25) #verifica se tem valor ausente no vetor.

chicago <- chic %>% 
  mutate(PM25difmean = PM25 - mean(PM25, na.rm = TRUE))



chicago <- chicago %>% 
  mutate("�C" = (�F - 32)/1.8) 

### fun��o arrange()
### arranjar conforme a data...
chicago <- chicago %>% 
  arrange(Data) 

chicago
tail(chicago)

#separar a variável Data em mais variáveis.
chicago <- chicago %>% 
  separate(Data, c("Ano", "M�s", "Dia"), sep = "-")

head(chicago)

## inverso do separate() é o unite()

chicago <- chicago %>% 
  unite(Data, "Ano", "M�s", "Dia", sep = "-")

chicago

