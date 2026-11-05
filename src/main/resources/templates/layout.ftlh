  <#macro page title active="">
    <!DOCTYPE html>
    <html lang="en">

    <head>
      <meta charset="UTF-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>${title} | Tekken Characters</title>
      <link rel="stylesheet" href="/css/style.css">
    </head>

    <body>
      <header class="task-bar">
        <a href="/"> Tekken Characters</a>
        <nav>
          <a href="/" class="${(active == 'home')?then('active', '')}">Home</a>
          <a href="/about" class="${(active == 'about')?then('active', '')}">About</a>
          <a href="/characters/new" class="${(active == 'new')?then('active', '')}">Add a Character</a>
        </nav>
      </header>

      <main>
          <#if message??>
            <p>${message}</p>
          </#if>
          <#nested>
      </main>

      <footer>Tekken Characters</footer>
    </body>

    </html>
  </#macro>