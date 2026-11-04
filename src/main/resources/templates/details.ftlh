<#import "layout.ftlh" as l>
  <@l.page title="character details" active="home">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lee Chaolan - Tekken Character</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>

    <h1>${char.name}</h1>
    <img src="lee.jpg" alt="Lee Chaolan from Tekken" height="400" width="400" />

    <p class="description">${char.description}</p>

    <p class="description">Fighting Style: Hybridized Martial Arts (Jeet Kune Do and Mishima-style Karate)</p>

    <p class="description">Lee Chaolan is the adopted son of Heihachi Mishima and the adoptive brother of Kazuya Mishima. He is a skilled martial artist and a rival to Kazuya, though there is really no competition between the two.
        You see Lee is absolutely boss-made. Unlike Kazuya who has to kill his father to inherit the Mishima Zaibatsu, Lee started his own company, Violet Systems, and makes mad bread off of his own intelligence and swagger.

</body>
</html>
</@l.page>