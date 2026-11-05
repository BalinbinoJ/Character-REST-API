<#import "layout.ftlh" as l>
  <@l.page title="character details" active="home">
<p><a href="/">Back to all characters</a></p>

    <div>
      <div>
        <h1>${character.name}</h1>
        <dl>
          <dt>Fighting Style</dt>
          <dd>${character.fightingStyle}</dd>
          <dt>Country of Origin</dt>
          <dd>${character.country}</dd>
          <dt>Description</dt>
          <dd>${character.description}</dd>
        </dl>

        <div class="actions">
          <a href="/characters/${character.id?c}/edit" class="button">Edit</a>
          <#-- HTML forms can only send GET and POST, so delete is a POST to its own URL. -->
            <form method="post" action="/characters/${character.id?c}/delete" onsubmit="return confirm('Remove this character?');">
              <button type="submit" class="button">Delete</button>
            </form>
        </div>
      </div>
    </div>
</@l.page>