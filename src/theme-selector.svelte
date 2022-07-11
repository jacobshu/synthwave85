<script>
  import colorPalette from '../colors/colors.js'
  let element = 'keyword'
  let themes = [
    {palette: '', name: 'keyword', color: '', shade: 500}
  ]
  $: palette
  $: bgColor = theme[element][shade]
  $: shade = 500

  function getColor(tw) {
    let [theme, color, shade] = tw.split('-')
    return {themedColor: `${theme}-${color}`, shade: shade}
  }

</script>
<style >
    input[type="range"] {
        -webkit-appearance: none;
        appearance: none;
        background: transparent;
        cursor: pointer;
    }
    input[type="range"]::-webkit-slider-runnable-track {
        background: red;
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
<div class="w-1/2">
    <label for={element} class="font-bold text-gray-600">{element}</label>
    <input id={element} type="range" list="tickmarks" step="100" bind:value={shade} min="100" max="900" class="w-full range ">
    <datalist id="tickmarks" class="">
      <option value="100" class=""></option>
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
