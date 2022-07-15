<script>
  import ThemeSelector from '../theme-selector.svelte'
  import Parser from 'web-tree-sitter';

  async function parse() {
    await Parser.init()
    const parser = new Parser()
    const JavaScript = await Parser.Language.load('/Users/jacobshu/dev/synthwave/src/tree-sitter-javascript.wasm');
    parser.setLanguage(JavaScript);
    const sourceCode = 'let x = 1; console.log(x);';
    const tree = parser.parse(sourceCode);

    console.log(tree.rootNode.text);
    console.log(tree.walk().currentNode().child(0).child(0).tree)

  }

  parse();
  const themes = {
    background: {
      sw84: 'bg-sw84-neutral-600',
      sw85: 'bg-sw85-neutral-600',
      nord: 'bg-nord-neutral-600'
    },
    keyword: {
      sw84: 'text-sw84-blue-400',
      sw85: 'text-sw85-blue-600',
      nord: 'text-nord-blue-400'
    },
    type: {
      sw84: '',
      sw85: '',
      nord: ''
    },
    method: {
      sw84: '',
      sw85: '',
      nord: ''
    },
    string: {
      sw84: 'text-sw84-green-400',
      sw85: 'text-sw85-green-400',
      nord: 'text-nord--green-400'
    },
    container: {
      sw84: '',
      sw85: '',
      nord: ''
    },
  }


  let indent = {
    1: "py-0.5 px-8",
    2: "py-0.5 px-16",
    3: "py-0.5 px-24"
  }
</script>
<style>
    p {
        font-family: "Source Code Pro", sans-serif;
        color: white;
    }
</style>
<div class="flex flex-row-reverse p-12">
  <ThemeSelector/>
  <input value=""/>
  <!--  <section class="{background} flex items-start justify-start min-h-screen max-w-4xl p-16 mx-auto rounded-md">-->
  <!--    <div class="px-4 py-5 sm:px-6">-->
  <!--      <p><span class={keyword}>import</span> <span class={string}>'dart:async'</span>;</p>-->
  <!--      <p><span class={keyword}>import</span> <span class={string}>'dart:io'</span>;</p>-->
  <!--      <br/>-->
  <!--      <p><span class={keyword}>class</span> <span class={type}>ApiProvider</span> &#123;</p>-->
  <!--      <p class={indent[1]}><span class={keyword}>final</span> <span class={type}>String</span><span-->
  <!--        class={keyword}>?</span>-->
  <!--        _baseUrl <span class={keyword}>=</span> dotenv.env<span class={container}>[</span>'SERVER'<span-->
  <!--          class={container}>]</span>;</p>-->

  <!--      <p class={indent[1]}><span class={type}>Future</span>&#60;<span class={type}>dynamic</span>&#62; <span-->
  <!--        class={method}>get</span><span class={container}>(</span><span class={type}>String</span> url<span-->
  <!--        class={keyword}>,</span> params<span class={container}>)</span> <span class={keyword}>async</span> <span-->
  <!--        class={container}>&#123;</span></p>-->
  <!--      <p class={indent[2]}><span class={keyword}>if</span> (_port <span class={keyword}>!= null</span>) iPort <span-->
  <!--        class={keyword}>=</span> <span class={type}>int</span><span class={keyword}>.</span><span class={method}>tryParse</span>(_port <span class={keyword}>as</span> <span class={type}>String</span>)<span class={keyword}>;</span>-->
  <!--      </p>-->

  <!--    </div>-->
  <!--  </section>-->
</div>