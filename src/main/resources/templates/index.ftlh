<#import "layout.ftlh" as l>
  <@l.page title="Tekken Characters" active="home">

    <h1>Welcome to my Tekken character appreciation site!</h1>


    <form method="get" action="/characters" class="search">
      <input type="text" name="name" value="${name!''}" placeholder="Search by name">
      <input type="text" name="fightingStyle" value="${selectedFightingStyle!''}" placeholder="Search by fighting style">

      <button type="submit">Search</button>
      <#if name?has_content || selectedFightingStyle?has_content>
        <a href="/characters" class="clear">Clear</a>
      </#if>
    </form>

    <h2>My favorite characters:</h2>

    <div class="character-grid">
      <#list characters as character>
        <article class="character-card">
          <a href="/characters/${character.id?c}">
            <img src="/thumbnails/${(character.thumbnailUrl)!'character-placeholder.svg'}" alt="${character.name}" width="200"
              height="200">
          </a>
          <div class="card-body">
            <h3><a href="/characters/${character.id?c}">${character.name}</a></h3>
            <p class="meta">Fighting Style: ${character.fightingStyle}</p>
            <p class="meta">Country of Origin: ${character.country}</p>
            <p class="meta">Description: ${character.description}</p>
          </div>
        </article>
        <#else>
          <p class="empty">No fighters found.</p>
      </#list>
    </div>



</@l.page>