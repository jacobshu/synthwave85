/* ******************************************************************************
 *  File: synthwave
 *  Description: Synthwave/Outrun color scheme
 *  Author: jacobshu <jacob@builtdigital.io>
 *  Source: https://github.com/jacobshu/synthwave85
 ********************************************************************************/

const colorPalettes = [{
  id: 'vim', neutral: {
    900: '#191B26',
    800: '#2F3141',
    700: '#484A5C',
    600: '#646677',
    500: '#7D7F8C',
    400: '#95959B',
    300: '#B6B6BC',
    200: '#D7D7DE',
    100: '#F9F9FF',
  }, red: {
    900: '#cb2a31',
    800: '#cb2a31',
    700: '#cb2a31',
    600: '#ff5c57',
    500: '#ff5c57',
    400: '#ff5c57',
    300: '#ff8a7f',
    200: '#ff8a7f',
    100: '#ff8a7f',
  }, green: {
    900: '#8effba',
    800: '#8effba',
    700: '#8effba',
    600: '#5af78e',
    500: '#5af78e',
    400: '#5af78e',
    300: '#0cc864',
    200: '#0cc864',
    100: '#0cc864',
  }, yellow: {
    900: '#ffffca',
    800: '#ffffca',
    700: '#ffffca',
    600: '#f3f99d',
    500: '#f3f99d',
    400: '#f3f99d',
    300: '#c4cb72',
    200: '#c4cb72',
    100: '#c4cb72',
  }, blue: {
    900: '#8cf5ff',
    800: '#8cf5ff',
    700: '#8cf5ff',
    600: '#57c7ff',
    500: '#57c7ff',
    400: '#57c7ff',
    300: '#009bd1',
    200: '#009bd1',
    100: '#009bd1',
  }, orange: {
    900: '#ffd892',
    800: '#ffd892',
    700: '#ffd892',
    600: '#fdab68',
    500: '#fdab68',
    400: '#fdab68',
    300: '#cc803f',
    200: '#cc803f',
    100: '#cc803f',
  }, magenta: {
    900: '#ff98ef',
    800: '#ff98ef',
    700: '#ff98ef',
    600: '#ff6ac1',
    500: '#ff6ac1',
    400: '#ff6ac1',
    300: '#ce3a95',
    200: '#ce3a95',
    100: '#ce3a95',
  }, cyan: {
    900: '#6cbfd0',
    800: '#6cbfd0',
    700: '#6cbfd0',
    600: '#9aedfe',
    500: '#9aedfe',
    400: '#9aedfe',
    300: '#c9ffff',
    200: '#c9ffff',
    100: '#c9ffff',
  },

}, {
  id: 'nord', neutral: {
    900: '#242931',
    800: '#2E3440',
    700: '#3B4252',
    600: '#434C5E',
    500: '#4C566A',
    400: '#D8DEE9',
    300: '#E5E9F0',
    200: '#ECEFF4',
  }, blue: {
    900: '#5E81AC',
    800: '#5E81AC',
    700: '#5E81AC',
    600: '#5E81AC',
    500: '#81A1C1',
    400: '#81A1C1',
    300: '#81A1C1',
    200: '#81A1C1',
    100: '#81A1C1',
  }, green: {
    900: '#8FBCBB',
    800: '#8FBCBB',
    700: '#8FBCBB',
    600: '#8FBCBB',
    500: '#A3BE8C',
    400: '#A3BE8C',
    300: '#A3BE8C',
    200: '#A3BE8C',
    100: '#A3BE8C',
  }, magenta: {
    900: '#B48EAD',
    800: '#B48EAD',
    700: '#B48EAD',
    600: '#B48EAD',
    500: '#B48EAD',
    400: '#B48EAD',
    300: '#B48EAD',
    200: '#B48EAD',
    100: '#B48EAD',
  }, yellow: {
    900: '#EBCB8B',
    800: '#EBCB8B',
    700: '#EBCB8B',
    600: '#EBCB8B',
    500: '#EBCB8B',
    400: '#EBCB8B',
    300: '#EBCB8B',
    200: '#EBCB8B',
    100: '#EBCB8B',
  }, orange: {
    900: '#D08770',
    800: '#D08770',
    700: '#D08770',
    600: '#D08770',
    500: '#D08770',
    400: '#D08770',
    300: '#D08770',
    200: '#D08770',
    100: '#D08770',
  }, cyan: {
    900: '#88C0D0',
    800: '#88C0D0',
    700: '#88C0D0',
    600: '#88C0D0',
    500: '#88C0D0',
    400: '#88C0D0',
    300: '#88C0D0',
    200: '#88C0D0',
    100: '#88C0D0',
  }, red: {
    900: '#BF616A',
    800: '#BF616A',
    700: '#BF616A',
    600: '#BF616A',
    500: '#BF616A',
    400: '#BF616A',
    300: '#BF616A',
    200: '#BF616A',
    100: '#BF616A',
  },
}, {
  id: 'sw85', neutral: {
    900: '#08080F',
    800: '#11111F',
    700: '#19192F',
    600: '#22223F',
    500: '#2B2A4F',
    400: '#50547B',
    300: '#7F86A7',
    200: '#B7BFD3',
    100: '#FAFCFF',
  }, blue: {
    900: '#0065A2',
    800: '#0065A2',
    700: '#1480B1',
    600: '#2B9BC1',
    500: '#46B6D0',
    400: '#6DD0DF',
    300: '#98E9EF',
    200: '#C8FEFE',
    100: '#C8FEFE',
  }, green: {
    900: '#20834E',
    800: '#20834E',
    700: '#279A5E',
    600: '#2DB16B',
    500: '#34C777',
    400: '#43DA84',
    300: '#66EC9D',
    200: '#8EFFBA',
    100: '#8EFFBA',
  }, magenta: {
    900: '#842D6E',
    800: '#842D6E',
    700: '#9B3684',
    600: '#B2409A',
    500: '#CA49B0',
    400: '#DB60C5',
    300: '#ED7BDA',
    200: '#FF98EF',
    100: '#FF98EF',
  }, yellow: {
    900: '#D3C46F',
    800: '#D3C46F',
    700: '#DBD278',
    500: '#E8EB8C',
    400: '#F0F2A0',
    600: '#E3E182',
    300: '#F8F8B5',
    200: '#FFFFCA',
    100: '#FFFFCA',
  }, orange: {
    900: '#CA7730',
    800: '#CA7730',
    700: '#D58538',
    600: '#DD9240',
    500: '#E59F49',
    400: '#EEB360',
    300: '#F7C578',
    200: '#FFD892',
    100: '#FFD892',
  }, cyan: {
    900: '#5A9FAD',
    800: '#5A9FAD',
    700: '#69AFBB',
    600: '#7ABFC8',
    500: '#8CD0D6',
    400: '#9FE0E4',
    300: '#B3F0F1',
    200: '#C9FFFF',
    100: '#C9FFFF',
  }, red: {
    900: '#CB2A2A',
    800: '#CB2A2A',
    700: '#D43836',
    600: '#DC4743',
    500: '#CB2A2A',
    400: '#EE675F',
    300: '#F6786F',
    200: '#FF8A7F',
    100: '#FF8A7F',
  }, bright: {
    800: '#CB2A2A', 700: '#D036D4', 600: '#4343DC', 500: '#51E2E5', 400: '#5FEE65', 300: '#EEF66F', 200: '#FF8A7F',
  },
}, {
  id: 'sw84',

  neutral: {
    900: '#08080F',
    800: '#11101F',
    700: '#1C192F',
    600: '#27213F',
    500: '#34294F',
    400: '#534E7B',
    300: '#7D80A7',
    200: '#B6BED3',
    100: '#FAFCFF',
  }, green: {
    900: '#206d4b',
    800: '#206d4b',
    700: '#09f7a0',
    600: '#09f7a0',
    500: '#09f7a0',
    400: '#0beb99',
    300: '#0beb99',
    200: '#72f1b8',
    100: '#72f1b8',
  }, blue: {
    900: '#03edf9',
    800: '#03edf9',
    700: '#03edf9',
    600: '#2ee2fa',
    500: '#2ee2fa',
    400: '#2ee2fa',
    300: '#36f9f6',
    200: '#36f9f6',
    100: '#36f9f6',
  }, magenta: {
    1: '#495495',
    2: '#463465',
    3: '#463564',
    4: '#614D85',
    5: '#7059AB',
    6: '#848bbd',
    7: '#9d8bca',
    8: '#b893ce',
    9: '#A148AB',
    10: '#ff7edb',
    11: '#880088',
  }, red: {
    900: '#fa2e46',
    800: '#fa2e46',
    700: '#fa2e46',
    600: '#fa2e46',
    500: '#fa2e46',
    400: '#fe4450',
    300: '#fe4450',
    200: '#fe4450',
    100: '#fe4450',
  }, yellow: {
    900: '#fede5d',
    800: '#fede5d',
    700: '#fede5d',
    600: '#fede5d',
    500: '#fede5d',
    400: '#fede5d',
    300: '#fede5d',
    200: '#fede5d',
    100: '#fede5d',
  }, orange: {
    900: '#D18616',
    800: '#D18616',
    700: '#D18616',
    600: '#D18616',
    500: '#ff8b39',
    400: '#ff8b39',
    300: '#ff8b39',
    200: '#ff8b39',
    100: '#ff8b39', // 200: '#D50',
  }
}]

export default colorPalettes;