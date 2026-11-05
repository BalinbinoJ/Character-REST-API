<#import "layout.ftlh" as l>
  <@l.page title=formTitle active=(fighterId??)?then('', 'new' )>
        <h1>${formTitle}</h1>
    <form method="post" action="${formAction}" enctype="form-data" class="form">

      <label for="name">Name</label>
      <input id="name" name="name" type="text" value="${(fighter.name)!''}" required>


        <label for="country">Country of Origin:</label>
        <input id="country" name="country" type="text" value="${(fighter.country)!''}" required>

        <label for="fightingStyle">Fighting Style:</label>
        <input id="fightingStyle" name="fightingStyle" type="text" value="${(fighter.fightingStyle)!''}" required>
        

        <label for="description">Description:</label>
        <textarea id="description" name="description" required>${(fighter.description)!''}</textarea>

        <div class="actions">
          <button type="submit">Save</button>
          <#if fighterId??>
            <a href="/characters/${fighterId?c}">Cancel</a>
            <#else>
              <a href="/">Cancel</a>
          </#if>
        </div>
    </form>

</@l.page>