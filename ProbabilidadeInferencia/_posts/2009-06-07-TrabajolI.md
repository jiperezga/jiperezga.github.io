---
layout: post
title: "Trabajo Inferencia"
main-class: 'presentaciones'
permalink: /ProbabilidadeInferencia/PeIE:title.html
tags:

introduction: Trabajo Inferencia

header-includes:
   - \usepackage{amsmath,amssymb,amsthm,amsfonts}
   - \usepackage[sectionbib]{natbib}
   - \usepackage[hidelinks]{hyperref}
output:
  md_document:
    variant: markdown_strict+backtick_code_blocks+autolink_bare_uris+ascii_identifiers+tex_math_single_backslash
    preserve_yaml: TRUE
always_allow_html: yes   
knit: (function(inputFile, encoding) {
  rmarkdown::render(inputFile, encoding = encoding,
  output_dir = "../../ProbabilidadeInferencia/_posts/", output_format = "all"  ) })
bibliography: "../../referencias.bib"
csl: "../../apa.csl"
---







# Trabajo Inferencia

El trabajo deberá solucionarse y enviar los resultado con los análisis
correspondientes a más tardar el día Miércoles 22 de Septiembre a las
11:59 PM, al correo electrónico
<a target="_blank" href="mailto:jivan.perez@udea.edu.co">
jivan.perez@udea.edu.co</a>.

Recuerden que si van a hacer el trabajo en parejas, deben unir las dos
bases de datos, ya sea en R o sea en Excel.

Quedo atento a cualquier duda o inquietud que les surja durante el
trabajo. No duden en escribirme.

## Enunciado trabajo

-   [Enunciado](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/TrabajoInferencia.pdf){:target="\_blank"}

## Bases de datos

-   [Aguirre Monsalve
    Alejandra](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1020495555.xlsx){:target="\_blank"}
-   [Arroyave Murillo Juan
    Diego](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1007368680.xlsx){:target="\_blank"}
-   [Ascanio Estrada Andres
    Leonardo](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1065894729.xlsx){:target="\_blank"}
-   [Caballero Castañeda Sebastian
    Eduardo](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1010010607.xlsx){:target="\_blank"}
-   [Cuaical Tapie William
    Daniel](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1007292685.xlsx){:target="\_blank"}
-   [Escorcia Pajaro Valery
    Estefy](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1002244380.xlsx){:target="\_blank"}
-   [Florez Gallego Maria
    Paulina](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1000549222.xlsx){:target="\_blank"}
-   [Herrera Giraldo
    Laura](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1001017464.xlsx){:target="\_blank"}
-   [Hincapie Gomez Leidy
    Tatiana](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1010122767.xlsx){:target="\_blank"}
-   [Longas Rivas Jhon
    Alexánder](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1193326786.xlsx){:target="\_blank"}
-   [Mosquera Franco Arthur
    Jose](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1003073445.xlsx){:target="\_blank"}
-   [Niño Valderrama
    Nicolás](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1017241764.xlsx){:target="\_blank"}
-   [Noreña Cadavid
    Susana](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1000748392.xlsx){:target="\_blank"}
-   [Pantoja Quiscualtud Alexandra
    Carolina](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1087425594.xlsx){:target="\_blank"}
-   [Perez Castilla Karen
    Marcela](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1005605305.xlsx){:target="\_blank"}
-   [Polo Pineda
    Daniela](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1000085308.xlsx){:target="\_blank"}
-   [Puerta Campo Rosa
    Alejandra](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1002389631.xlsx){:target="\_blank"}
-   [Puerta Dussan
    Stefania](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1007286384.xlsx){:target="\_blank"}
-   [Ramirez Lopez
    Santiago](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1037669252.xlsx){:target="\_blank"}
-   [Reyes Anaya Karol
    Melissa](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1098757410.xlsx){:target="\_blank"}
-   [Rico Mejia
    Cristian](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1037654941.xlsx){:target="\_blank"}
-   [Vargas Cely Andrea
    Juliana](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1010149009.xlsx){:target="\_blank"}
-   [Vasquez Ortiz Carlos
    Enrique](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1003004985.xlsx){:target="\_blank"}
-   [Velasquez Cañas Maria
    Alejandra](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1000567192.xlsx){:target="\_blank"}
-   [Velez Osorno
    Daniel](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1037667652.xlsx){:target="\_blank"}
-   [Zarate Miranda Gabriela
    Andrea](https://github.com/jiperezga/jiperezga.github.io/raw/master/Dataset/Trabajo/T1017274210.xlsx){:target="\_blank"}

<h1>
Mucha Suerte!
</h1>
