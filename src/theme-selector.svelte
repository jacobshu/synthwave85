<script>
  import themes from './colors/colors.js';
  function getColor(palette, color, shade) {
    const theme = themes.find(theme => theme.id === palette)
    return theme[color][shade]
  }

  let elements = [
    {id: 'keyword', palette: 'sw85', color: 'green', shade: 500},
    {id: 'type', palette: 'sw85', color: 'red', shade: 500},
    {id: 'containers', palette: 'sw85', color: 'magenta', shade: 500},
    {id: 'method', palette: 'sw85', color: 'blue', shade: 500},
    ]

  let colors = ['neutral', 'red', 'green', 'yellow', 'blue', 'orange', 'magenta', 'cyan']

  $: palette = 'vim'
  let buttons = "inline-flex items-center w-48 px-4 py-2 border border-transparent text-sm text-white font-medium justify-center rounded-md shadow-sm bg-gray-400"

  function changeColor(colorName) {

  }
</script>

<div class="p-12">
  <div class="flex-column justify-center py-6">
    <button class={buttons} on:click="{() => {palette = 'sw84'}}">synthwave84</button>
    <button class={buttons} on:click="{() => {palette = 'sw85'}}">synthwave85</button>
    <button class={buttons} on:click="{() => {palette = 'nord'}}">nord</button>
  </div>
  {#each elements as {id, palette, color, shade}, i (id)}
    <div class="w-1/2" style="--slider:{getColor(palette, color, shade)}">
      <label for={id} class="font-bold text-gray-600">{id}</label>
      <input id={id} type="range" list="shades" step="100" bind:value={shade} min="100" max="900"
             class="w-full range ">
      <datalist id="shades" class="">
        <option value="100"></option>
        <option value="200"></option>
        <option value="300"></option>
        <option value="400"></option>
        <option value="500"></option>
        <option value="600"></option>
        <option value="700"></option>
        <option value="800"></option>
        <option value="900"></option>
      </datalist>
    </div>

    <div class="color-picker-holder" >
      <div class="values-dropdown">
        <div class="values-dropdown-grid">
          {#each colors as colorName, index}
            <button
              id="{i}-{color}-{shade}"
              style="background: {getColor(palette, colorName, shade)};"
              on:click={() => { changeColor(colorName) }}
              class="color-block">
            </button>
          {/each}
        </div>
      </div>
    </div>
  {/each}
</div>

<style>
    input[type="range"] {
        -webkit-appearance: none;
        appearance: none;
        background: transparent;
        cursor: pointer;
    }

    input[type="range"]::-webkit-slider-runnable-track {
        background: var(--slider);
        height: 0.5rem;
        border-radius: 5px;
    }

    input[type="range"]::-webkit-slider-thumb {
        -webkit-appearance: none; /* Override default look */
        appearance: none;
        margin-top: -4px; /* Centers thumb on the track */
        background-color: #fff;
        height: 1rem;
        width: 1rem;
        border-radius: 50%;
        border: 2px solid gray;
    }

</style>