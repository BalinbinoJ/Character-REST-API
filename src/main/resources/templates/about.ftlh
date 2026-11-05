<#import "layout.ftlh" as l>
  <@l.page title="about" active="about">


    <h1>About This Site</h1>

    <img src="jin-and-kazuya.jpg" alt="Jin Kazama and Kazuya Mishima from Tekken" height="400" width="400" />

<p class="description">I created this site to showcase my favorite characters from my favorite fighting game, Tekken
        Ever since I played Tekken 4 as a kid, the lore and characters of this universe captivated me, and I wanted to share
        that passion with the world. I also wanted to show how much of a loser Kazuya is, he's lame.
    </p>

<p>Tekken Characters demo. The same database and the same service layer power <strong>two front ends</strong>:
     a JSON API for programs, and the HTML pages you are looking at now for people.</p>


  <h2>How a page request flows</h2>
  <ol>
    <li>The browser requests a URL, for example <code>/characters/3</code>.</li>
    <li>A <code>@Controller</code> method runs, asks the service for data, and puts it in the <code>Model</code>.</li>
    <li>The controller returns a view name. Spring renders the matching FreeMarker template.</li>
    <li>The browser receives HTML.</li>
  </ol>

  <h2>Two front ends, one backend</h2>
  <table>
    <thead><tr><th></th><th>Web pages</th><th>JSON API</th></tr></thead>
    <tbody>
      <tr><td>Controller</td><td><code>FighterUiController</code></td><td><code>FighterController</code></td></tr>
      <tr><td>URLs</td><td><code>/</code>, <code>/characters/...</code>, <code>/about</code></td><td><code>/api/characters/...</code></td></tr>
      <tr><td>Returns</td><td>HTML from templates</td><td>JSON</td></tr>
      <tr><td>Calls</td><td colspan="2">the same <code>FighterService</code> and <code>FighterRepository</code></td></tr>
    </tbody>
  </table>

  <p>Pictures are saved in a static directory.</p>
</@l.page>