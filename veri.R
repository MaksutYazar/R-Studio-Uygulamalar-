pdf("C:/Users/maksu/OneDrive/Masaüstü/veri.pdf")

library(readxl)
anket <- read_excel("C:/Users/maksu/Downloads/bicap_data.xls")
anket_suz<-subset(anket,anket[2]=="Evet" & anket[3]=='Evet'& anket[4]=='Evet')
print(sprintf("Elenen Gözlem Sayısı: %d",nrow(anket) - nrow(anket_suz)))
sum(is.na(anket_suz))
for (i in 5:27) {
  anket_suz[[i]] <- factor(anket_suz[[i]],levels = c(1,2,3,4,5,6,7),ordered = TRUE)
}
levels(anket_suz[[20]])

print(unique(anket_suz[28]))
anket_suz[[28]] <- factor(anket_suz[[28]],levels = c("Erkek","Kadın"))
levels(anket_suz[[28]])

print(unique(anket_suz[29]))
anket_suz$`25. Kaç yaşındasınız?`[anket_suz$`25. Kaç yaşındasınız?`==25] <- '24 - 26'
anket_suz[[29]] <- factor(anket_suz[[29]],levels = c('18 - 20','21 - 23','24 - 26','27 - 29','30 +'),ordered = TRUE)
levels(anket_suz[[29]])

print(unique(anket_suz[30]))
anket_suz[[30]] <- factor(anket_suz[[30]],levels = c("Diğer","Türk"))
levels(anket_suz[[30]])

print(unique(anket_suz[31]))
anket_suz[[31]] <- factor(anket_suz[[31]],levels = c('< 5.000','5.001-10.000','10.001-15.000','15.001-20.000','20.001-25.000','> 25.000'),ordered = TRUE)
levels(anket_suz[[31]])

print(unique(anket_suz[32]))
anket_suz[[32]] <- factor(anket_suz[[32]],levels = c('Lise Seviyesi','Lisans Seviyesi','Yüksek Lisans Seviyesi'),ordered = TRUE)
levels(anket_suz[[32]])

print(unique(anket_suz[33]))
anket_suz[[33]] <- factor(anket_suz[[33]],levels = c(unique(anket_suz[33])))
levels(anket_suz[[33]])

print(unique(anket_suz[34]))
anket_suz[[34]] <- factor(anket_suz[[34]],levels = c(1,2,3,4,5,6,7),ordered = TRUE)
levels(anket_suz[[34]])

print(unique(anket_suz[35]))
anket_suz[[35]] <- factor(anket_suz[[35]],levels = c('Hayır','Satın almış olabilirim, farkında değilim','Evet'),ordered = TRUE)
levels(anket_suz[[35]])

anket_suz <- subset(anket_suz, select = - c(`Bu çalışmanın amacını anlıyor ve gönüllü olarak katılmayı kabul ediyorum.`,`Ankette toplanan verilerin elektronik ortamda, sınırlı erişime sahip güvenli ve şifreli bir veri tabanında kaydedileceğini ve isimsiz olarak işleneceğini kabul ediyorum.`,`Bu anketten elde edilen verilerin araştırmacının yukarıda belirtilen konuyla ilgili yayınında kullanılmasına izin veriyorum.`))

anket_suz<-subset(anket,anket[30]=="Türk" & anket[29]<='26')

veri <-subset(anket_suz, select = -c(`26.  Vatandaşlığınız:`,`29.  Hangi şehirde ikamet ediyorsunuz?`))

str(veri)
summary(veri)

dev.off()

