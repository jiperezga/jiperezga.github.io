IntUnaMedia <- function(datos, nivel.conf){
  if(!is.numeric(datos)) stop("El conjunto de datos debe de ser numérico")
  if(!is.numeric(datos)) stop("El nivel de confianza debe de ser numérico")
  if(nivel.conf <= 0 & nivel.conf >= 1) stop("El nivel de confianza debe estar entre 0 y 1")
  repeat{
    sigma <- suppressWarnings(as.character(readline(paste0("La varianza poblacional es conocida? (S/N) -> "))))
    if(sigma == "S") {
      repeat{
        sigma2 <- suppressWarnings(as.numeric(readline(paste0("Introduzca el valor de la varianza poblacional -> "))))
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
    if(sigma == "S" | sigma == "N") break
    cat("Solo se puede responder 'S' o 'N'")
  }
  
  repeat{
    norm <- suppressWarnings(as.character(readline(paste0("La poblacional se distribuye normal? (S/N) -> "))))
    if(norm == "N" & length(datos) < 30) stop("El conjunto de datos debe de tener más de 30 observaciones para emplear la aproximación normal")
    if(norm == "S" | norm == "N") break
    cat("Solo puede responder 'S' o 'N'")
  }
  
  repeat{
    int <- suppressWarnings(as.character(readline(paste0("El intervalo es bilateral (b), Izquierdo (i) o Derecho (d)  -> "))))
    if(int == "b") conf <- 1-((1-nivel.conf)/2); break
    if(int == "i" | int == "d") conf <- nivel.conf; break
    print("Solo puede responder 'b','i' o 'd'")
  }
  
  if(sigma == "S" & norm == "S") {
    media <- mean(datos)
    inf <- media - (qnorm(conf) * sqrt(sigma2/length(datos)))
    sup <- media + (qnorm(conf) * sqrt(sigma2/length(datos)))
    if(int == "b"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo del ", nivel.conf*100, "% de confianza está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "S" & norm == "N") {
    media <- mean(datos)
    inf <- media - (qnorm(conf) * sqrt(sigma2/length(datos)))
    sup <- media + (qnorm(conf) * sqrt(sigma2/length(datos)))
    if(int == "b"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "N" & norm == "N") {
    media <- mean(datos)
    desv <- sd(datos)
    inf <- media - (qnorm(conf) * desv/sqrt(length(datos)))
    sup <- media + (qnorm(1-conf) * desv/sqrt(length(datos)))
    if(int == "b"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
  if(sigma == "N" & norm == "S") {
    media <- mean(datos)
    desv <- sd(datos)
    df <- length(datos) - 1
    inf <- media - (qt(conf, df = df) * desv/sqrt(length(datos)))
    sup <- media + (qt(conf, df = df) * desv/sqrt(length(datos)))
    if(int == "b"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", round(inf, 4), ", ", round(sup, 4), ")"))
    }
    if(int == "i"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", round(inf, 4), ", ", Inf, ")"))
    }
    if(int == "d"){
      cat(paste0("El intervalo aproximado del ", nivel.conf*100, "% de confianza está dado por (", -Inf, ", ", round(sup, 4), ")"))
    }
  }
}