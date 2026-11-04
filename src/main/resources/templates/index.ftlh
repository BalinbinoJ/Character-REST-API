<#import "layout.ftlh" as l>
  <@l.page title="Tekken Characters" active="home">
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tekken characters</title>
    <link rel="stylesheet" href="/css/style.css">
</head>
<body>
    <h1>Welcome to my Tekken character appreciation site!</h1>


    <div class="container">
        <form>
            <input type="text" placeholder="Find a character" />
            <button type="submit">Search</button>
        </form>
    </div>

    <h2>My favorite characters:</h2>

    <div class="character-grid">
    <div class="character-card">
    <p class="description">Heihachi Mishima</p>
    <a href="./details"><img src="heihachi.jpg" alt="Heihachi Mishima from Tekken" height="200" width="200" /></a>
    </div>
    
    <div class="character-card">
    <p class="description">Kazuya Mishima</p>
    <a href="./details"><img src="kazuya.jpg" alt="Kazuya Mishima from Tekken" height="200" width="200" /></a>
    </div>

    <div class="character-card">
    <p class="description">Lee Chaolan</p>
    <a href="./details"><img src="lee.jpg" alt="Lee Chaolan from Tekken" height="200" width="200" /></a>
    </div>

    <div class="character-card">
    <p class="description">Lars Alexandersson</p>
    <a href="./details"><img src="lars.jpg" alt="Lars Alexandersson from Tekken" height="200" width="200" /></a>
    </div>

    <div class="character-card">
    <p class="description">Kuma</p>
    <a href="./details"><img src="kuma.jpg" alt="Kuma from Tekken" height="200" width="200" /></a>
    </div>
</div>

</body>
</html>
</@l.page>