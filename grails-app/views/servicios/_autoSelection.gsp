<!-- This template renders a drop down after a city is selected -->

<g:select name="selectaut" from="${automoviles}" 
    optionValue="nombreAuto" noSelection="['':'Choose Marca']" optionKey="id"/>