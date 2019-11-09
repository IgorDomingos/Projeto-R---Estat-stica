#(8)
primeiro = ""
primeiroAux = 0
primeiroVendas = 0
segundo = ""
segundoAux = 0
segundoVendas = 0
terceiro = ""
terceiroAux = 0
terceiroVendas = 0
artistasAux <- unique(dframe$Artista)
for(i in 1:length(artistasAux)){
  auxQnt = 0
  auxVendas = 0
  for(j in 1:length(dframe$Artista)){
    if(artistasAux[i] == dframe$Artista[j]){
      auxQnt = auxQnt + 1
      auxVendas = auxVendas + dframe$Qnt..de.Albuns.Vendidos[j]
    }
  }
  if(auxQnt > primeiroAux){
    terceiro = segundo
    terceiroAux = segundoAux
    terceiroVendas = segundoVendas
    segundo = primeiro
    segundoAux = primeiroAux
    segundoVendas = primeiroVendas
    primeiro = dframe$Artista[i]
    primeiroAux = auxQnt
    primeiroVendas = auxVendas
  } else if(auxQnt > segundoAux){
    terceiro = segundo
    terceiroAux = segundoAux
    terceiroVendas = segundoVendas
    segundo = dframe$Artista[i]
    segundoAux = auxQnt
    segundoVendas = auxVendas
  } else if(auxQnt > terceiroAux){
    terceiro = dframe$Artista[i]
    terceiroAux = auxQnt
    terceiroVendas = auxVendas
  }
}
ARTISTA = c(as.character(primeiro), as.character(segundo), as.character(terceiro))
TOTAL_DE_VENDAS = c(primeiroVendas, segundoVendas, terceiroVendas)
dframe8 <- data.frame(ARTISTA, TOTAL_DE_VENDAS)
dframe8
