<script>
  import themes from './colors/colors.js';

  function getColor(palette, color, shade) {
    console.log('get color: ', palette, color, shade)
    const theme = themes.find(theme => theme.id === palette)
    return theme[color][shade]
  }

  $: elements = [
    {id: 'keyword', palette: 'sw85', color: 'green', shade: 500},
    {id: 'type', palette: 'sw85', color: 'red', shade: 500},
    {id: 'containers', palette: 'sw85', color: 'magenta', shade: 500},
    {id: 'method', palette: 'sw85', color: 'blue', shade: 500},
  ]

  let palettes = ['vim', 'sw84', 'sw85', 'nord']
  let colors = ['neutral', 'red', 'magenta', 'blue', 'green', 'yellow',  'orange',  'cyan']

  function changeColor(id, colorName) {
    elements = elements.map(item => {
      if (item.id === id) {
        item.color = colorName
        return item
      }
      return item
    })
  }

  function changePalette(paletteName) {
    elements = elements.map(item => {
        item.palette = paletteName
        return item
    })
  }
</script>

<div class="p-12 w-1/3">
  <div class="flex justify-between py-6">
    {#each palettes as palette}
    <button class="inline-flex justify-center w-24 py-2 border border-transparent text-sm text-white font-medium rounded-md shadow-sm bg-gray-800" on:click="{() => {changePalette(palette)}}">{palette}</button>
      {/each}
  </div>
  {#each elements as {id, palette, color, shade}, i (id)}
    <div class="flex flex-col mb-6">

      <div class="mb-2" style="--slider:{getColor(palette, color, shade)}">
        <label for={id} class="font-bold text-gray-600">{id}</label>
        <input id={id} dir="rtl" type="range" list="shades" step="100" bind:value={shade} min="100" max="900"
               class="w-full range">
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

      <div class="color-picker-holder w-full">
        <div class="values-dropdown">
          <div class="flex justify-between">
            {#each colors as colorName, index}
              <button
                id="{index}-{colorName}"
                style="background: {getColor(palette, colorName, shade)};"
                on:click={() => { changeColor(id, colorName) }}
                class="h-8 w-8 rounded">
              </button>
            {/each}
          </div>
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