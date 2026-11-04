<#-- Shared page layout. Every page calls this macro, so the head and the navigation exist in ONE place. Usage in a
  page: <#import "layout.ftlh" as l>
  <@l.page title="Home" active="home"> ...page content... </@l.page> -->
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
        <#-- A flash message survives exactly one redirect (see RedirectAttributes in the controller). -->
          <#if message??>
            <p>${message}</p>
          </#if>
          <#nested>
      </main>

      <footer>Tekken Characters</footer>
    </body>

    </html>
  </#macro>