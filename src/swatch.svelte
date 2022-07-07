<script>
  export let bg;

  function shouldBeDark(bg) {
    if (bg.includes('400') || bg.includes('300') ||bg.includes('200') ||bg.includes('100')) {
      return true
    }
    return false
  }
</script>
<div class="px-8 py-16 rounded-lg {shouldBeDark(bg) ? 'text-gray' : 'text-white'} {bg}">{bg}</div>