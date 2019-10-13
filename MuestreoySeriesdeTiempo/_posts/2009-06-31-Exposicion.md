---
layout: post
title: "Exposicion SARIMA"
main-class: 'guia'
permalink: /MuestreoySeriesdeTiempo/MyST:title.html
tags:

introduction: |
  Aplicación de modelo SARIMA: <br>
  - Identificación de componentes <br>
  - Raíces unitarias <br>
  - Identifcación del modelo <br>
  - Estimación del modelo <br>
  - Validación de supuestos <br>
  - Pronóstico del modelo 
  
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
  output_dir = "../../MuestreoySeriesdeTiempo/_posts/", output_format = "all"  ) })
bibliography: "../../referencias.bib"
csl: "../../apa.csl"
---







<br>

Introducción a modelos SARIMA
=============================

Existen situaciones en las que es posible enfrentarse a series
temporales que poseen entre sus componentes, un comportamiento
estacional, lo cual hace que tanto la media como otras estadísticas
dadas en un periodo **no sean estacionarias a lo largo del tiempo**. Y a
causa de ello, se tendrá que los métodos de modelación presentados hasta
el momento no resulten ser apropiados para el ajuste del conjunto de
observaciones asociados a la serie de interés.

La **componente estacional** de una serie temporal se ha definido hasta
ahora como **fluctuaciones que se repiten anualmente o en periodos que
poseen duración menor a un año**, las cuales se encuentran relacionadas
con fenómenos económicos, ambientales o sociales, que hacen que el
comportamiento de la serie tome un comportamiento repetitivo a través de
los años.

La periodicidad de la componente estacional es usualmente denotada por
la letra `$s$`, y define la longitud o número de periodos en los cuales
se observa que se repite el comportamiento de la serie. Ahora bien, dado
que la estacionalidad es una señal de que la serie de tiempo no es
estacionaria, **es necesario eliminar dicha componente** con el fin de
poder modelar ésta, de la forma como se ha venido trabajando hasta el
momento.

Ejemplo serie estacional
------------------------

Suponga que la siguiente serie temporal está dada por la producción
mensual de juguetes para niños (en millones), de una empresa ubicada en
el municipio de Itagüi, para el periodo marzo de 1995 hasta febrero de
2004.

<!-- puse en width 100% en 3 partes-->
<button class="Show1">
Mostrar código R
</button>
<button class="Hide1">
Ocultar código R
</button>
<main id="botoncito1">
<section class="language-r highlighter-rouge" style="width: 100%;">
<section class="highlight" style="width: 100%;">
<pre class="highlight" style="width: 100%;">
<code><span class="n">library</span><span class="p">(</span><span class="n">plotly</span><span class="p">)</span><span class="w">
</span><span class="n">library</span><span class="p">(</span><span class="n">sarima</span><span class="p">)</span><span class="w">
</span><span class="n">set.seed</span><span class="p">(</span><span class="m">127102</span><span class="p">)</span><span class="w">
</span><span class="n">Serie1</span><span class="w"> </span><span class="o">&lt;-</span><span class="w"> </span><span class="n">sim_sarima</span><span class="p">(</span><span class="n">n</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">108</span><span class="p">,</span><span class="w"> </span><span class="n">model</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nf">list</span><span class="p">(</span><span class="n">ar</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nf">c</span><span class="p">(</span><span class="m">-0.89</span><span class="p">,</span><span class="w"> </span><span class="m">-0.9</span><span class="p">),</span><span class="w"> </span><span class="n">ma</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">0.5</span><span class="p">,</span><span class="w"> </span><span class="n">sar</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nf">c</span><span class="p">(</span><span class="m">0.2</span><span class="p">,</span><span class="w"> 
    </span><span class="m">0.15</span><span class="p">),</span><span class="w"> </span><span class="n">sma</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">0</span><span class="p">,</span><span class="w"> </span><span class="n">sigma2</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">50</span><span class="p">,</span><span class="w"> </span><span class="n">nseasons</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">12</span><span class="p">,</span><span class="w"> </span><span class="n">iorder</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">0</span><span class="p">,</span><span class="w"> </span><span class="n">siorder</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">1</span><span class="p">),</span><span class="w"> </span><span class="n">xintercept</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">0</span><span class="p">,</span><span class="w"> 
    </span><span class="n">n.start</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">1050</span><span class="p">)</span><span class="w"> </span><span class="o">+</span><span class="w"> </span><span class="m">250</span><span class="w">
</span><span class="n">Serie1</span><span class="w"> </span><span class="o">&lt;-</span><span class="w"> </span><span class="n">ts</span><span class="p">(</span><span class="n">Serie1</span><span class="p">,</span><span class="w"> </span><span class="n">start</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nf">c</span><span class="p">(</span><span class="m">1995</span><span class="p">,</span><span class="w"> </span><span class="m">3</span><span class="p">),</span><span class="w"> </span><span class="n">frequency</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">12</span><span class="p">)</span><span class="w">
</span><span class="n">fechas1</span><span class="w"> </span><span class="o">&lt;-</span><span class="w"> </span><span class="n">time</span><span class="p">(</span><span class="n">Serie1</span><span class="p">)</span><span class="w">
</span><span class="c1">## Gráfico Básico</span><span class="w">
</span><span class="n">plot.ts</span><span class="p">(</span><span class="n">Serie1</span><span class="p">,</span><span class="w"> </span><span class="n">main</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="s2">"Producción mensual de juguetes"</span><span class="p">,</span><span class="w"> </span><span class="n">ylab</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="s2">"Producción mensual"</span><span class="p">)</span><span class="w">

</span><span class="c1">## Gráfico Avanzado</span><span class="w">
</span><span class="n">plot_ly</span><span class="p">(</span><span class="n">x</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="o">~</span><span class="n">fechas1</span><span class="p">,</span><span class="w"> </span><span class="n">y</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="o">~</span><span class="n">Serie1</span><span class="p">,</span><span class="w"> </span><span class="n">mode</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="s2">"lines"</span><span class="p">,</span><span class="w"> </span><span class="n">text</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="n">paste</span><span class="p">(</span><span class="s2">"Valor ="</span><span class="p">,</span><span class="w"> </span><span class="nf">round</span><span class="p">(</span><span class="n">Serie1</span><span class="p">,</span><span class="w"> 
    </span><span class="m">3</span><span class="p">)),</span><span class="w"> </span><span class="n">width</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">700</span><span class="p">,</span><span class="w"> </span><span class="n">height</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">400</span><span class="p">,</span><span class="w"> </span><span class="n">type</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="s2">"scatter"</span><span class="p">)</span><span class="w"> </span><span class="o">%&gt;%</span><span class="w"> </span><span class="n">layout</span><span class="p">(</span><span class="n">title</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="s2">"Producción mensual de juguetes"</span><span class="p">,</span><span class="w"> 
    </span><span class="n">xaxis</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nf">list</span><span class="p">(</span><span class="n">title</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="s2">"Mes"</span><span class="p">),</span><span class="w"> </span><span class="n">yaxis</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nf">list</span><span class="p">(</span><span class="n">title</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="s2">"Producción mensual"</span><span class="p">))</span><span class="w"> </span><span class="o">%&gt;%</span><span class="w"> 
    </span><span class="n">layout</span><span class="p">(</span><span class="n">margin</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="nf">list</span><span class="p">(</span><span class="n">l</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">60</span><span class="p">,</span><span class="w"> </span><span class="n">r</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">30</span><span class="p">,</span><span class="w"> </span><span class="n">b</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">60</span><span class="p">,</span><span class="w"> </span><span class="n">t</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">60</span><span class="p">,</span><span class="w"> </span><span class="n">pad</span><span class="w"> </span><span class="o">=</span><span class="w"> </span><span class="m">4</span><span class="p">))</span><span class="w">
</span></code></pre>
</section>
</section>
</main>
<pre>
<!--html_preserve--><div id="htmlwidget-a938c9c38effb73ca5f4" style="width:50%;height:400px;" class="plotly html-widget"></div>
<script type="application/json" data-for="htmlwidget-a938c9c38effb73ca5f4">{"x":{"visdat":{"41834321f83":["function () ","plotlyVisDat"]},"cur_data":"41834321f83","attrs":{"41834321f83":{"x":{},"y":{},"mode":"lines","text":["Valor = 253.477","Valor = 291.809","Valor = 164.777","Valor = 279.011","Valor = 210.281","Valor = 282.061","Valor = 193.247","Valor = 270.13","Valor = 349.643","Valor = 132.087","Valor = 291.386","Valor = 147.349","Valor = 226.15","Valor = 287.616","Valor = 191.134","Valor = 245.721","Valor = 211.708","Valor = 308.645","Valor = 167.851","Valor = 258.602","Valor = 392.12","Valor = 115.274","Valor = 256.906","Valor = 192.478","Valor = 221.575","Valor = 262.92","Valor = 232.955","Valor = 228.383","Valor = 186.023","Valor = 338.877","Valor = 172.387","Valor = 240.761","Valor = 414.617","Valor = 114.821","Valor = 241.301","Valor = 214.026","Valor = 213.25","Valor = 256.563","Valor = 260.072","Valor = 208.641","Valor = 176.638","Valor = 348.6","Valor = 161.823","Valor = 241.72","Valor = 422.642","Valor = 122.406","Valor = 229.023","Valor = 212.221","Valor = 232.056","Valor = 254.399","Valor = 254.194","Valor = 210.006","Valor = 176.095","Valor = 342.28","Valor = 168.716","Valor = 252.269","Valor = 404.224","Valor = 124.225","Valor = 245.886","Valor = 202.299","Valor = 228.763","Valor = 272.481","Valor = 251.392","Valor = 202.996","Valor = 187.834","Valor = 336.512","Valor = 169.791","Valor = 256.136","Valor = 391.922","Valor = 130.832","Valor = 249.59","Valor = 196.731","Valor = 225.885","Valor = 273.367","Valor = 254.64","Valor = 195.566","Valor = 199.317","Valor = 343.974","Valor = 153.858","Valor = 277.992","Valor = 378.62","Valor = 122.47","Valor = 277.934","Valor = 187.048","Valor = 200.169","Valor = 287.349","Valor = 265.807","Valor = 171.541","Valor = 207.703","Valor = 360.768","Valor = 129.335","Valor = 289.984","Valor = 383.852","Valor = 115.756","Valor = 282.694","Valor = 191.193","Valor = 191.164","Valor = 277.076","Valor = 282.612","Valor = 168.858","Valor = 182.296","Valor = 386.933","Valor = 138.009","Valor = 264.521","Valor = 392.497","Valor = 130.158","Valor = 264.724","Valor = 197.036"],"alpha_stroke":1,"sizes":[10,100],"spans":[1,20],"type":"scatter"}},"layout":{"width":"50%","margin":{"b":60,"l":60,"t":60,"r":30,"pad":4},"title":"Producción mensual de juguetes","xaxis":{"domain":[0,1],"automargin":true,"title":"Mes"},"yaxis":{"domain":[0,1],"automargin":true,"title":"Producción mensual"},"hovermode":"closest","showlegend":false},"source":"A","config":{"showSendToCloud":false},"data":[{"x":[1995.16666666667,1995.25,1995.33333333333,1995.41666666667,1995.5,1995.58333333333,1995.66666666667,1995.75,1995.83333333333,1995.91666666667,1996,1996.08333333333,1996.16666666667,1996.25,1996.33333333333,1996.41666666667,1996.5,1996.58333333333,1996.66666666667,1996.75,1996.83333333333,1996.91666666667,1997,1997.08333333333,1997.16666666667,1997.25,1997.33333333333,1997.41666666667,1997.5,1997.58333333333,1997.66666666667,1997.75,1997.83333333333,1997.91666666667,1998,1998.08333333333,1998.16666666667,1998.25,1998.33333333333,1998.41666666667,1998.5,1998.58333333333,1998.66666666667,1998.75,1998.83333333333,1998.91666666667,1999,1999.08333333333,1999.16666666667,1999.25,1999.33333333333,1999.41666666667,1999.5,1999.58333333333,1999.66666666667,1999.75,1999.83333333333,1999.91666666667,2000,2000.08333333333,2000.16666666667,2000.25,2000.33333333333,2000.41666666667,2000.5,2000.58333333333,2000.66666666667,2000.75,2000.83333333333,2000.91666666667,2001,2001.08333333333,2001.16666666667,2001.25,2001.33333333333,2001.41666666667,2001.5,2001.58333333333,2001.66666666667,2001.75,2001.83333333333,2001.91666666667,2002,2002.08333333333,2002.16666666667,2002.25,2002.33333333333,2002.41666666667,2002.5,2002.58333333333,2002.66666666667,2002.75,2002.83333333333,2002.91666666667,2003,2003.08333333333,2003.16666666667,2003.25,2003.33333333333,2003.41666666667,2003.5,2003.58333333333,2003.66666666667,2003.75,2003.83333333333,2003.91666666667,2004,2004.08333333333],"y":[253.477339242828,291.809259108726,164.776593383598,279.010611935139,210.281380953738,282.061381031179,193.246747722955,270.129766962356,349.642908788173,132.086685792731,291.385764624485,147.348991287353,226.150399619542,287.616397338344,191.13395880042,245.721311897458,211.708076520212,308.645174675193,167.851469709603,258.602490924956,392.120113518458,115.274118599036,256.90579220955,192.477712769748,221.574913184629,262.919738519741,232.95493343764,228.383045299448,186.023261434849,338.876624076704,172.387475224356,240.7613310814,414.617165735804,114.820772488217,241.301383657727,214.026167911043,213.249928273472,256.563194173471,260.071534185275,208.640737274444,176.637722495907,348.599779538119,161.823350085821,241.720134209285,422.641720673937,122.406080952034,229.023287591264,212.220849501337,232.056115085612,254.398884222829,254.194318969041,210.005711204777,176.095320409429,342.280213466407,168.715594745664,252.26866084002,404.224143659453,124.224551354719,245.886499206086,202.298930977421,228.763459030793,272.481259915145,251.39224124407,202.995772379489,187.834253418055,336.512002006535,169.790835938566,256.135593472825,391.92232078658,130.831693285699,249.590252510011,196.730840433775,225.8850862976,273.366768979545,254.639758114653,195.566453273845,199.316845130533,343.973562725132,153.858205153695,277.992407086224,378.619824813862,122.470385149579,277.934480234416,187.047866490989,200.16912071246,287.34882867368,265.807000971609,171.540858309223,207.703475181546,360.767815486959,129.335244598538,289.983923256633,383.851729032249,115.75632775035,282.694298797557,191.193204004437,191.164213788521,277.075940927894,282.61151467201,168.857880427154,182.29562299898,386.933387747873,138.008818885291,264.521077609411,392.496520232101,130.158100176252,264.723627036796,197.036014390935],"mode":"lines","text":["Valor = 253.477","Valor = 291.809","Valor = 164.777","Valor = 279.011","Valor = 210.281","Valor = 282.061","Valor = 193.247","Valor = 270.13","Valor = 349.643","Valor = 132.087","Valor = 291.386","Valor = 147.349","Valor = 226.15","Valor = 287.616","Valor = 191.134","Valor = 245.721","Valor = 211.708","Valor = 308.645","Valor = 167.851","Valor = 258.602","Valor = 392.12","Valor = 115.274","Valor = 256.906","Valor = 192.478","Valor = 221.575","Valor = 262.92","Valor = 232.955","Valor = 228.383","Valor = 186.023","Valor = 338.877","Valor = 172.387","Valor = 240.761","Valor = 414.617","Valor = 114.821","Valor = 241.301","Valor = 214.026","Valor = 213.25","Valor = 256.563","Valor = 260.072","Valor = 208.641","Valor = 176.638","Valor = 348.6","Valor = 161.823","Valor = 241.72","Valor = 422.642","Valor = 122.406","Valor = 229.023","Valor = 212.221","Valor = 232.056","Valor = 254.399","Valor = 254.194","Valor = 210.006","Valor = 176.095","Valor = 342.28","Valor = 168.716","Valor = 252.269","Valor = 404.224","Valor = 124.225","Valor = 245.886","Valor = 202.299","Valor = 228.763","Valor = 272.481","Valor = 251.392","Valor = 202.996","Valor = 187.834","Valor = 336.512","Valor = 169.791","Valor = 256.136","Valor = 391.922","Valor = 130.832","Valor = 249.59","Valor = 196.731","Valor = 225.885","Valor = 273.367","Valor = 254.64","Valor = 195.566","Valor = 199.317","Valor = 343.974","Valor = 153.858","Valor = 277.992","Valor = 378.62","Valor = 122.47","Valor = 277.934","Valor = 187.048","Valor = 200.169","Valor = 287.349","Valor = 265.807","Valor = 171.541","Valor = 207.703","Valor = 360.768","Valor = 129.335","Valor = 289.984","Valor = 383.852","Valor = 115.756","Valor = 282.694","Valor = 191.193","Valor = 191.164","Valor = 277.076","Valor = 282.612","Valor = 168.858","Valor = 182.296","Valor = 386.933","Valor = 138.009","Valor = 264.521","Valor = 392.497","Valor = 130.158","Valor = 264.724","Valor = 197.036"],"type":"scatter","marker":{"color":"rgba(31,119,180,1)","line":{"color":"rgba(31,119,180,1)"}},"error_y":{"color":"rgba(31,119,180,1)"},"error_x":{"color":"rgba(31,119,180,1)"},"line":{"color":"rgba(31,119,180,1)"},"xaxis":"x","yaxis":"y","frame":null}],"highlight":{"on":"plotly_click","persistent":false,"dynamic":false,"selectize":false,"opacityDim":0.2,"selected":{"opacity":1},"debounce":0},"shinyEvents":["plotly_hover","plotly_click","plotly_selected","plotly_relayout","plotly_brushed","plotly_brushing","plotly_clickannotation","plotly_doubleclick","plotly_deselect","plotly_afterplot"],"base_url":"https://plot.ly"},"evals":[],"jsHooks":[]}</script><!--/html_preserve-->
</pre>
