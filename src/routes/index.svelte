<script>
  import Swatch from '../swatch.svelte'

  const themes = ['vim', 'sw85', 'sw84', 'nord', ]
  const domains = ['neutral', 'red', 'green', 'yellow', 'blue', 'orange', 'magenta', 'cyan']
  const levels = ['100', '200', '300', '400', '500', '600', '700', '800', '900']
  let qualifiedColors = []

  let withDomains = []
  domains.forEach(domain => {
    let temp = []
    themes.forEach(theme => {
      let qualified = `${theme}-${domain}`;
      temp.push(qualified)
    })
    withDomains.push(temp)
  })


  withDomains.forEach(domainGroup => {
    levels.forEach(lvl => {
      domainGroup.forEach(theme => {
        qualifiedColors.push(`${theme}-${lvl}`)
      })
    })
  })
  // levels.forEach(level => {
  //   })
  console.log(qualifiedColors)
  let classes = ["bg-vim-neutral-100",
    "bg-sw85-neutral-100",
    "bg-sw84-neutral-100",
    "bg-nord-neutral-100",
    "bg-vim-neutral-200",
    "bg-sw85-neutral-200",
    "bg-sw84-neutral-200",
    "bg-nord-neutral-200",
    "bg-vim-neutral-300",
    "bg-sw85-neutral-300",
    "bg-sw84-neutral-300",
    "bg-nord-neutral-300",
    "bg-vim-neutral-400",
    "bg-sw85-neutral-400",
    "bg-sw84-neutral-400",
    "bg-nord-neutral-400",
    "bg-vim-neutral-500",
    "bg-sw85-neutral-500",
    "bg-sw84-neutral-500",
    "bg-nord-neutral-500",
    "bg-vim-neutral-600",
    "bg-sw85-neutral-600",
    "bg-sw84-neutral-600",
    "bg-nord-neutral-600",
    "bg-vim-neutral-700",
    "bg-sw85-neutral-700",
    "bg-sw84-neutral-700",
    "bg-nord-neutral-700",
    "bg-vim-neutral-800",
    "bg-sw85-neutral-800",
    "bg-sw84-neutral-800",
    "bg-nord-neutral-800",
    "bg-vim-neutral-900",
    "bg-sw85-neutral-900",
    "bg-sw84-neutral-900",
    "bg-nord-neutral-900",
    "bg-vim-red-100",
    "bg-sw85-red-100",
    "bg-sw84-red-100",
    "bg-nord-red-100",
    "bg-vim-red-200",
    "bg-sw85-red-200",
    "bg-sw84-red-200",
    "bg-nord-red-200",
    "bg-vim-red-300",
    "bg-sw85-red-300",
    "bg-sw84-red-300",
    "bg-nord-red-300",
    "bg-vim-red-400",
    "bg-sw85-red-400",
    "bg-sw84-red-400",
    "bg-nord-red-400",
    "bg-vim-red-500",
    "bg-sw85-red-500",
    "bg-sw84-red-500",
    "bg-nord-red-500",
    "bg-vim-red-600",
    "bg-sw85-red-600",
    "bg-sw84-red-600",
    "bg-nord-red-600",
    "bg-vim-red-700",
    "bg-sw85-red-700",
    "bg-sw84-red-700",
    "bg-nord-red-700",
    "bg-vim-red-800",
    "bg-sw85-red-800",
    "bg-sw84-red-800",
    "bg-nord-red-800",
    "bg-vim-red-900",
    "bg-sw85-red-900",
    "bg-sw84-red-900",
    "bg-nord-red-900",
    "bg-vim-green-100",
    "bg-sw85-green-100",
    "bg-sw84-green-100",
    "bg-nord-green-100",
    "bg-vim-green-200",
    "bg-sw85-green-200",
    "bg-sw84-green-200",
    "bg-nord-green-200",
    "bg-vim-green-300",
    "bg-sw85-green-300",
    "bg-sw84-green-300",
    "bg-nord-green-300",
    "bg-vim-green-400",
    "bg-sw85-green-400",
    "bg-sw84-green-400",
    "bg-nord-green-400",
    "bg-vim-green-500",
    "bg-sw85-green-500",
    "bg-sw84-green-500",
    "bg-nord-green-500",
    "bg-vim-green-600",
    "bg-sw85-green-600",
    "bg-sw84-green-600",
    "bg-nord-green-600",
    "bg-vim-green-700",
    "bg-sw85-green-700",
    "bg-sw84-green-700",
    "bg-nord-green-700",
    "bg-vim-green-800",
    "bg-sw85-green-800",
    "bg-sw84-green-800",
    "bg-nord-green-800",
    "bg-vim-green-900",
    "bg-sw85-green-900",
    "bg-sw84-green-900",
    "bg-nord-green-900",
    "bg-vim-yellow-100",
    "bg-sw85-yellow-100",
    "bg-sw84-yellow-100",
    "bg-nord-yellow-100",
    "bg-vim-yellow-200",
    "bg-sw85-yellow-200",
    "bg-sw84-yellow-200",
    "bg-nord-yellow-200",
    "bg-vim-yellow-300",
    "bg-sw85-yellow-300",
    "bg-sw84-yellow-300",
    "bg-nord-yellow-300",
    "bg-vim-yellow-400",
    "bg-sw85-yellow-400",
    "bg-sw84-yellow-400",
    "bg-nord-yellow-400",
    "bg-vim-yellow-500",
    "bg-sw85-yellow-500",
    "bg-sw84-yellow-500",
    "bg-nord-yellow-500",
    "bg-vim-yellow-600",
    "bg-sw85-yellow-600",
    "bg-sw84-yellow-600",
    "bg-nord-yellow-600",
    "bg-vim-yellow-700",
    "bg-sw85-yellow-700",
    "bg-sw84-yellow-700",
    "bg-nord-yellow-700",
    "bg-vim-yellow-800",
    "bg-sw85-yellow-800",
    "bg-sw84-yellow-800",
    "bg-nord-yellow-800",
    "bg-vim-yellow-900",
    "bg-sw85-yellow-900",
    "bg-sw84-yellow-900",
    "bg-nord-yellow-900",
    "bg-vim-blue-100",
    "bg-sw85-blue-100",
    "bg-sw84-blue-100",
    "bg-nord-blue-100",
    "bg-vim-blue-200",
    "bg-sw85-blue-200",
    "bg-sw84-blue-200",
    "bg-nord-blue-200",
    "bg-vim-blue-300",
    "bg-sw85-blue-300",
    "bg-sw84-blue-300",
    "bg-nord-blue-300",
    "bg-vim-blue-400",
    "bg-sw85-blue-400",
    "bg-sw84-blue-400",
    "bg-nord-blue-400",
    "bg-vim-blue-500",
    "bg-sw85-blue-500",
    "bg-sw84-blue-500",
    "bg-nord-blue-500",
    "bg-vim-blue-600",
    "bg-sw85-blue-600",
    "bg-sw84-blue-600",
    "bg-nord-blue-600",
    "bg-vim-blue-700",
    "bg-sw85-blue-700",
    "bg-sw84-blue-700",
    "bg-nord-blue-700",
    "bg-vim-blue-800",
    "bg-sw85-blue-800",
    "bg-sw84-blue-800",
    "bg-nord-blue-800",
    "bg-vim-blue-900",
    "bg-sw85-blue-900",
    "bg-sw84-blue-900",
    "bg-nord-blue-900",
    "bg-vim-orange-100",
    "bg-sw85-orange-100",
    "bg-sw84-orange-100",
    "bg-nord-orange-100",
    "bg-vim-orange-200",
    "bg-sw85-orange-200",
    "bg-sw84-orange-200",
    "bg-nord-orange-200",
    "bg-vim-orange-300",
    "bg-sw85-orange-300",
    "bg-sw84-orange-300",
    "bg-nord-orange-300",
    "bg-vim-orange-400",
    "bg-sw85-orange-400",
    "bg-sw84-orange-400",
    "bg-nord-orange-400",
    "bg-vim-orange-500",
    "bg-sw85-orange-500",
    "bg-sw84-orange-500",
    "bg-nord-orange-500",
    "bg-vim-orange-600",
    "bg-sw85-orange-600",
    "bg-sw84-orange-600",
    "bg-nord-orange-600",
    "bg-vim-orange-700",
    "bg-sw85-orange-700",
    "bg-sw84-orange-700",
    "bg-nord-orange-700",
    "bg-vim-orange-800",
    "bg-sw85-orange-800",
    "bg-sw84-orange-800",
    "bg-nord-orange-800",
    "bg-vim-orange-900",
    "bg-sw85-orange-900",
    "bg-sw84-orange-900",
    "bg-nord-orange-900",
    "bg-vim-magenta-100",
    "bg-sw85-magenta-100",
    "bg-sw84-magenta-100",
    "bg-nord-magenta-100",
    "bg-vim-magenta-200",
    "bg-sw85-magenta-200",
    "bg-sw84-magenta-200",
    "bg-nord-magenta-200",
    "bg-vim-magenta-300",
    "bg-sw85-magenta-300",
    "bg-sw84-magenta-300",
    "bg-nord-magenta-300",
    "bg-vim-magenta-400",
    "bg-sw85-magenta-400",
    "bg-sw84-magenta-400",
    "bg-nord-magenta-400",
    "bg-vim-magenta-500",
    "bg-sw85-magenta-500",
    "bg-sw84-magenta-500",
    "bg-nord-magenta-500",
    "bg-vim-magenta-600",
    "bg-sw85-magenta-600",
    "bg-sw84-magenta-600",
    "bg-nord-magenta-600",
    "bg-vim-magenta-700",
    "bg-sw85-magenta-700",
    "bg-sw84-magenta-700",
    "bg-nord-magenta-700",
    "bg-vim-magenta-800",
    "bg-sw85-magenta-800",
    "bg-sw84-magenta-800",
    "bg-nord-magenta-800",
    "bg-vim-magenta-900",
    "bg-sw85-magenta-900",
    "bg-sw84-magenta-900",
    "bg-nord-magenta-900",
    "bg-vim-cyan-100",
    "bg-sw85-cyan-100",
    "bg-sw84-cyan-100",
    "bg-nord-cyan-100",
    "bg-vim-cyan-200",
    "bg-sw85-cyan-200",
    "bg-sw84-cyan-200",
    "bg-nord-cyan-200",
    "bg-vim-cyan-300",
    "bg-sw85-cyan-300",
    "bg-sw84-cyan-300",
    "bg-nord-cyan-300",
    "bg-vim-cyan-400",
    "bg-sw85-cyan-400",
    "bg-sw84-cyan-400",
    "bg-nord-cyan-400",
    "bg-vim-cyan-500",
    "bg-sw85-cyan-500",
    "bg-sw84-cyan-500",
    "bg-nord-cyan-500",
    "bg-vim-cyan-600",
    "bg-sw85-cyan-600",
    "bg-sw84-cyan-600",
    "bg-nord-cyan-600",
    "bg-vim-cyan-700",
    "bg-sw85-cyan-700",
    "bg-sw84-cyan-700",
    "bg-nord-cyan-700",
    "bg-vim-cyan-800",
    "bg-sw85-cyan-800",
    "bg-sw84-cyan-800",
    "bg-nord-cyan-800",
    "bg-vim-cyan-900",
    "bg-sw85-cyan-900",
    "bg-sw84-cyan-900",
    "bg-nord-cyan-900",]
</script>
<h1 class="text-center text-3xl font-bold">
  Colors
</h1>
<section class="px-40 py-20">
  <div class="grid grid-cols-4 gap-2">
    {#each classes as color}
      <Swatch bg={color}/>
    {/each}
  </div>
</section>