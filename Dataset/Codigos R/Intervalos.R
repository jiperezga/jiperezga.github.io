######################### Una media ###########################
IntUnaMedia <- function(datos, nivel.conf = 0.95){
  if(!is.numeric(datos)) stop("El conjunto de datos debe de ser numérico")
  media <- mean(datos, na.rm = T)
  desv <- sd(datos, na.rm = T)
  
  if(!is.numeric(nivel.conf)) stop("El nivel de confianza debe de ser numérico")
  if(nivel.conf <= 0 & nivel.conf >= 1) stop("El nivel de confianza debe estar entre 0 y 1")
  repeat{
    sigma <- suppressWarnings(as.character(readline(paste0("La varianza poblacional es conocida? (s/n) -> "))))
    if(sigma == "s") {
      repeat{
        sigma1 <- suppressWarnings(as.numeric(readline(paste0("Introduzca el valor de la varianza poblacional -> "))))
        if(is.na(sigma1)) {
          cat("El valor introducido debe ser numérico")
        } else {
          if(sigma1 > 0) {
            break
          } else {
            cat("El número introducido debe ser mayor a 0")
          }       
        }
      }
    }
    if(sigma == "s" | sigma == "n") break
    cat("Solo se puede responder 's' o 'n'")
  }
  
  repeat{
    norm <- suppressWarnings(as.character(readline(paste0("La poblacional se distribuye normal? (s/n) -> "))))
    if(norm == "n" & length(datos) < 30) warning("El conjunto de datos posee menos de 30 observaciones, y en consecuencia, 
la aproximación normal podría no ser adecuada")
    if(norm == "s" | norm == "n") break
    cat("Solo puede responder 's' o 'n'")
  }
  
  repeat{
    int <- suppressWarnings(as.character(readline(paste0("El intervalo es bilateral (b), Izquierdo (i) o Derecho (d)  -> "))))
    if(int == "b") conf <- 1-((1-nivel.conf)/2); 
    if(int == "i" | int == "d") conf <- nivel.conf; 
    if(int == "b" | int == "i" | int == "d") break
    cat("Solo puede responder 'b','i' o 'd'")
  }
  
  if(sigma == "s" & norm == "s") {
    inf <- media - (qnorm(conf) * sqrt(sigma1/length(datos)))
    sup <- media + (qnorm(conf) * sqrt(sigma1/length(datos)))
    if(int == "b"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza para una
media está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza para una
media está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza para una
media está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "s" & norm == "n") {
    
    inf <- media - (qnorm(conf) * sqrt(sigma1/length(datos)))
    sup <- media + (qnorm(conf) * sqrt(sigma1/length(datos)))
    if(int == "b"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "n" & norm == "n") {
    inf <- media - (qnorm(conf) * desv/sqrt(length(datos)))
    sup <- media + (qnorm(conf) * desv/sqrt(length(datos)))
    if(int == "b"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "n" & norm == "s") {
    df <- length(datos) - 1
    inf <- media - (qt(conf, df = df) * desv/sqrt(length(datos)))
    sup <- media + (qt(conf, df = df) * desv/sqrt(length(datos)))
    if(int == "b"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para una media está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
}

######################### Diferencia de medias ###########################
IntDosMedias <- function(datos1, datos2, nivel.conf = 0.95){
  if(!is.numeric(datos1)) stop("El conjunto de datos1 debe de ser numérico")
  if(!is.numeric(datos2)) stop("El conjunto de datos2 debe de ser numérico")
  media1 <- mean(datos1, na.rm = T)
  desv1 <- sd(datos1, na.rm = T)
  media2 <- mean(datos2, na.rm = T)
  desv2 <- sd(datos2, na.rm = T)
  
  if(!is.numeric(nivel.conf)) stop("El nivel de confianza debe de ser numérico")
  if(nivel.conf <= 0 & nivel.conf >= 1) stop("El nivel de confianza debe estar entre 0 y 1")
  
  repeat{
    sigma <- suppressWarnings(as.character(readline(paste0("La varianza de las dos poblaciones es conocida? (s/n) -> "))))
    if(sigma == "s") {
      repeat{
        sigma1 <- suppressWarnings(as.numeric(readline(paste0("Introduzca el valor de la varianza poblacional 1-> "))))
        if(is.na(sigma1)) {
          cat("El valor introducido debe ser numérico")
        } else {
          if(sigma1 > 0) {
            break
          } else {
            cat("El número introducido debe ser mayor a 0")
          }       
        }
      }
      repeat{
        sigma2 <- suppressWarnings(as.numeric(readline(paste0("Introduzca el valor de la varianza poblacional 2-> "))))
        if(is.na(sigma2)) {
          cat("El valor introducido debe ser numérico")
        } else {
          if(sigma2 > 0) {
            break
          } else {
            cat("El número introducido debe ser mayor a 0")
          }       
        }
      }
    }
    if(sigma == "s" | sigma == "n") break
    cat("Solo se puede responder 's' o 'n'")
  }
  
  repeat{
    norm <- suppressWarnings(as.character(readline(paste0("Las dos poblaciones se distribuyen normal? (s/n) -> "))))
    if(norm == "n" & length(datos1) < 30) warning("El conjunto de datos 1 posee menos de 30 observaciones, y en consecuencia,
la aproximación normal podría no ser adecuada")
    if(norm == "n" & length(datos2) < 30) warning("El conjunto de datos 2 posee menos de 30 observaciones, y en consecuencia,
la aproximación normal podría no ser adecuada")
    if(norm == "s" | norm == "n") break
    cat("Solo puede responder 's' o 'n'")
  }
  
  repeat{
    int <- suppressWarnings(as.character(readline(paste0("El intervalo es bilateral (b), Izquierdo (i) o Derecho (d)  -> "))))
    if(int == "b") conf <- 1-((1-nivel.conf)/2); 
    if(int == "i" | int == "d") conf <- nivel.conf; 
    if(int == "b" | int == "i" | int == "d") break
    cat("Solo puede responder 'b','i' o 'd'")
  }
  
  
  if(sigma == "s" & norm == "s") {
    inf <- (media1 - media2) - (qnorm(conf) * sqrt((sigma1/length(datos1)) + (sigma2/length(datos2))))
    sup <- (media1 - media2) + (qnorm(conf) * sqrt((sigma1/length(datos1)) + (sigma2/length(datos2))))
    if(int == "b"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza para la
diferencia de medias está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza para la
diferencia de medias está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza para la
diferencia de medias está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "s" & norm == "n") {
    inf <- (media1 - media2) - (qnorm(conf) * sqrt((sigma1/length(datos1)) + (sigma2/length(datos2))))
    sup <- (media1 - media2) + (qnorm(conf) * sqrt((sigma1/length(datos1)) + (sigma2/length(datos2))))
    if(int == "b"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "n" & norm == "n") {
    inf <- (media1 - media2) - (qnorm(conf) * sqrt((desv1^2/length(datos1)) + (desv2^2/length(datos2))))
    sup <- (media1 - media2) + (qnorm(conf) * sqrt((desv1^2/length(datos1)) + (desv2^2/length(datos2))))
    if(int == "b"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "n" & norm == "s") {
    Fc <- desv1^2/desv2^2 
    df1 <- length(datos1) - 1
    df2 <- length(datos1) - 1
    Finf <- qf(1 - conf, df1 = df1, df2 = df2)
    Fsup <- qf(conf, df1 = df1, df2 = df2)
      if(Fc < Finf | Fc > Fsup) {
        dft <- ((desv1^2 / length(datos1)) + (desv2^2 / length(datos2)))^2 / (((desv1^2 / length(datos1))^2 / (length(datos1) - 1)) + ((desv2^2 / length(datos2))^2 / (length(datos2) - 1)))
        inf <- (media1 - media2) - (qt(conf, df = dft) * sqrt((desv1^2/length(datos1)) + (desv2^2/length(datos2))))
        sup <- (media1 - media2) + (qt(conf, df = dft) * sqrt((desv1^2/length(datos1)) + (desv2^2/length(datos2))))
        if(int == "b"){
          cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
        }
        if(int == "i"){
          cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", round(inf, 4), ", ", Inf, ")"))
        }
        if(int == "d"){
          cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", -Inf, ", ", round(sup, 4), ")"))
        }
      } else {
        dft <- length(datos1) + length(datos2) - 2
        Sp2 <- (((length(datos1) - 1)*desv1^2) + ((length(datos1) - 1)*desv1^2))/dft
        inf <- (media1 - media2) - (qt(conf, df = dft) * sqrt(Sp2) * sqrt((1/length(datos1)) + (1/length(datos2))))
        sup <- (media1 - media2) + (qt(conf, df = dft) * sqrt(Sp2) * sqrt((1/length(datos1)) + (1/length(datos2))))
        if(int == "b"){
          cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
        }
        if(int == "i"){
          cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", round(inf, 4), ", ", Inf, ")"))
        }
        if(int == "d"){
          cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza
para la diferencia de medias está dado por (", -Inf, ", ", round(sup, 4), ")"))
        }
        
      }
  }
}

