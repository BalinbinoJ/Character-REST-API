<#import "layout.ftlh" as l>
  <@l.page title="add a character" active=(fighterId??)?then('', 'new')>
<h1>${formTitle}</h1>
    <form method="post" action="${formAction}" enctype="multipart/form-data" class="form">

      <label for="name">Name</label>
      <input id="name" name="name" type="text" value="${(fighter.name)!''}" required>

        <label for="country">Country of Origin:</label>
        <input id="country" name="country" type="text" value="${(fighter.country)!''}" required>

        <label for="fighting-style">Fighting Style:</label>
        <input id="fighting-style" name="fighting-style" type="text" value="${(fighter.fightingStyle)!''}" required>
        

        <label for="description">Description:<br/></label>
        <textarea id="description" name="description" required></textarea>
        <input id="description" name="description" type="text" value="${(fighter.description)!''}" required>

        <label for="imageFile">Picture (JPEG, PNG, or WebP, up to 1 MB)</label>
        <#if fighterId??>
          <img src="/characters/${fighterId?c}/image" alt="Current picture">
        </#if>
        <input id="imageFile" name="imageFile" type="file" accept="image/jpeg,image/png,image/webp">

        <div>
          <button type="submit">Save</button>
          <#if fighterId??>
            <a href="/characters/${fighterId?c}">Cancel</a>
            <#else>
              <a href="/">Cancel</a>
          </#if>
        </div>
    </form>
</body>
</html>
</@l.page>