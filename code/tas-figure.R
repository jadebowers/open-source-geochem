library(tidyverse)

####example data####
#creating variables
sio2 <- c(51.09275127,
          51.11957233,
          51.29466573,
          51.49331164,
          51.71562964,
          51.96155461,
          52.23111265,
          52.50780629,
          53.68066473,
          54.72622833,
          55.7030479,
          56.61885883,
          57.48027617)

na2o <- c( 3.288947953,
           3.310487755,
           3.431522018,
           3.551376173,
           3.669912827,
           3.786944538,
           3.90224146,
           4.012879018,
           4.194604614,
           4.357076125,
           4.505465468,
           4.64061871,
           4.763299379)

k2o <- c(0.628894046,
         0.633495904,
         0.659541472,
         0.685517471,
         0.711388147,
         0.737103968,
         0.771285782,
         0.806044923,
         0.862629116,
         0.917020953,
         0.970530176,
         1.023294847,
         1.075454183)

tas <- na2o + k2o

#join the variables to create a data frame
example_data <- data.frame(sio2, na2o, k2o, tas)
write_csv(example_data, "data/tas_example_data.csv")

####diagram####
diagram <- ggplot() + 
  geom_segment(aes(x = 41, y = 0.5, 
                   xend = 41, yend = 7), 
               size=0.25) +
  geom_segment(aes(x = 41, y = 3,
                   xend = 45, yend = 3),
               size = 0.25) +
  geom_segment(aes(x = 45, y = 0.5, 
                   xend = 45, yend = 5), 
               size=0.25) +
  geom_segment(aes(x = 45, y = 5, 
                   xend = 52, yend = 5), 
               size=0.25) +
  geom_segment(aes(x = 52, y = 0.5, 
                   xend = 52, yend = 5), 
               size=0.25) + 
  geom_segment(aes(x = 52, y = 5, 
                   xend = 69, yend = 8), 
               size=0.25) + 
  geom_segment(aes(x = 69, y = 8, 
                   xend = 76.5, yend = 0.5), 
               size=0.25) + 
  geom_segment(aes(x = 63, y = 0.5, 
                   xend = 63, yend = 7), 
               size=0.25) + 
  geom_segment(aes(x = 45, y = 5, 
                   xend = 65, yend = 15), 
               size=0.25) + 
  geom_segment(aes(x = 41, y = 7, 
                   xend = 52.5, yend = 14), 
               size=0.25) + 
  geom_segment(aes(x = 52, y = 5, 
                   xend = 49.4, yend = 7.3), 
               size=0.25) +
  geom_segment(aes(x = 57, y = 5.9, 
                   xend = 53, yend = 9.3), 
               size=0.25) +
  geom_segment(aes(x = 57.6, y = 11.7, 
                   xend = 63, yend = 7), 
               size=0.25) +
  geom_segment(aes(x = 69, y = 8, 
                   xend = 69, yend = 12.2), 
               size=0.25) +
  geom_segment(aes(x = 45, y = 9.4, 
                   xend = 49.4, yend = 7.3), 
               size=0.25) +
  geom_segment(aes(x = 53, y = 9.3, 
                   xend = 48.4, yend = 11.5), 
               size=0.25) +
  geom_segment(aes(x = 57.6, y = 11.7, 
                   xend = 49, yend = 15.5), 
               size=0.25) +
  geom_segment(aes(x = 57, y = 0.5, 
                   xend = 57, yend = 5.9), 
               size=0.25) 
 

labels <-  annotate("text", 
                    x = c(48.5, 
                          54.5, 
                          54.5, 
                          60, 
                          68.5, 
                          76, 
                          49, 
                          49, 
                          43, 
                          43,
                          45,
                          43.5,
                          39,
                          48,
                          48.5,
                          52,
                          52.5,
                          57.5,
                          64.5,
                          65,
                          57.5,
                          58,
                          52.5,
                          52.5,
                          53), 
                    y = c(1.75, 
                          2, 
                          1.5, 
                          1.75, 
                          1.75, 
                          6, 
                          6, 
                          5.5, 
                          2.5, 
                          2,
                          7.5,
                          6,
                          9,
                          9.5,
                          9,
                          12,
                          11.5,
                          14,
                          11.5,
                          8.5,
                          8.5,
                          8,
                          7.5,
                          7,
                          6.5), 
                    label = c("Basalt", 
                              "Basaltic", 
                              "Andesite", 
                              "Andesite", 
                              "Dacite", 
                              "Rhyolite", 
                              "Trachy-", 
                              "basalt", 
                              "Picro-", 
                              "basalt",
                              "Tephrite",
                              "Basanite",
                              "Foidite",
                              "Phono-",
                              "Tephrite",
                              "Tephri",
                              "phonolite",
                              "Phonolite",
                              "Trachyte",
                              "Trachydacite",
                              "Trachy-",
                              "andesite",
                              "Basaltic",
                              "trachy-",
                              "andesite"), 
                    hjust = .5, fontface = 2, size = 5)

diagram + 
  labels +
  geom_point(data = example_data) + 
  aes(x = sio2, y = tas) + 
  theme_classic() +
  theme(axis.line = element_line(colour = "black"),
        axis.title = element_text(face = "bold", size = 20),
        axis.text.x = element_text(face = "bold", size = 14),
        axis.text.y = element_text(face = "bold", size = 14),
        legend.background = element_rect(fill = "grey95", size = 0.7, linetype = "solid", colour = "black"), 
        legend.text = element_text(size = 11), legend.justification = c(0,0), legend.position = c(0.05,0.03), aspect.ratio = 1) +
  scale_x_continuous(breaks= seq(35,80,by=5), limits = c(35,80), expand = c(0,0)) + 
  scale_y_continuous(breaks= seq(0,16,by=2), limits = c(0,16), expand = c(0,0)) +
  labs(x=expression(SiO[2]* " (wt%)"), y=expression("Total Alkali Silica"*"  (wt%)"))
  
  
  
  
  
  
  
  
















  
