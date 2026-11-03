<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Character</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <h3 class="task-bar"> <a href="index.html">Home</a>
    <a href="details.html">Character Details</a>
    <a href="new-character-form.html">Add New Character</a>
    <a href="about.html">What this site is about</a>
    </h3>

    <h1>Add a New Character</h1>

    <img src="Mokujin.jpg" alt="Mokujin from Tekken" height="300" width="300" />

    <form>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        <p><br/></p>

        <label for="country">Country of Origin:</label>
        <input type="text" id="country" name="country" required>
        <p><br/></p>

        <label for="fighting-style">Fighting Style:</label>
        <input type="text" id="fighting-style" name="fighting-style" required>
        <p><br/></p>
        

        <label for="description">Description:<br/></label>
        <textarea id="description" name="description" required></textarea>
        <p><br/></p>

        <label for="image">Image URL:<br/></label>
        <input type="url" id="image" name="image" required>
        <p><br/></p>

        <button type="submit">Add Character</button>
    </form>
</body>
</html>