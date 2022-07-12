<script>
  import ThemeSelector from '../theme-selector.svelte'

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

  let theme = 'sw84';
  $: background = themes.background[theme]
  $: keyword = themes.keyword[theme]
  $: type = themes.type[theme]
  $: method = themes.method[theme]
  $: string = themes.string[theme]
  $: container = themes.container[theme]

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
  <section class="{background} flex items-start justify-start min-h-screen max-w-4xl p-16 mx-auto rounded-md">
    <div class="px-4 py-5 sm:px-6">
      <p><span class={keyword}>import</span> <span class={string}>'dart:async'</span>;</p>
      <p><span class={keyword}>import</span> <span class={string}>'dart:io'</span>;</p>
      <br/>
      <p><span class={keyword}>class</span> <span class={type}>ApiProvider</span> &#123;</p>
      <p class={indent[1]}><span class={keyword}>final</span> <span class={type}>String</span><span
        class={keyword}>?</span>
        _baseUrl <span class={keyword}>=</span> dotenv.env<span class={container}>[</span>'SERVER'<span
          class={container}>]</span>;</p>

      <p class={indent[1]}><span class={type}>Future</span>&#60;<span class={type}>dynamic</span>&#62; <span
        class={method}>get</span><span class={container}>(</span><span class={type}>String</span> url<span
        class={keyword}>,</span> params<span class={container}>)</span> <span class={keyword}>async</span> <span
        class={container}>&#123;</span></p>
      <p class={indent[2]}><span class={keyword}>if</span> (_port <span class={keyword}>!= null</span>) iPort <span
        class={keyword}>=</span> <span class={type}>int</span><span class={keyword}>.</span><span class={method}>tryParse</span>(_port <span class={keyword}>as</span> <span class={type}>String</span>)<span class={keyword}>;</span>
      </p>

      <!--  dynamic responseJson;-->
      <!--  Uri uri = Uri(-->
      <!--  scheme: 'https',-->
      <!--  host: _baseUrl,-->
      <!--  port: iPort,-->
      <!--  path: url,-->
      <!--  queryParameters: params);-->
      <!--  Inspector.log('GET : $uri');-->
      <!--  try &#123;-->
      <!--  final response = await http.get(uri,-->
      <!--  headers: &#123;HttpHeaders.authorizationHeader: 'Bearer $&#123;_token!&#125;'&#125;);-->
      <!--  responseJson = _response(response);-->
      <!--&#125; on SocketException &#123;-->
      <!--  throw FetchDataException('No Internet connection');-->
      <!--&#125;-->
      <!--  return responseJson;-->
      <!--&#125;-->

      <!--  Future<dynamic> post(String url, body) async &#123;-->
      <!--  int? iPort;-->
      <!--  if (_port != null) iPort = int.tryParse(_port as String);-->
      <!--  dynamic responseJson;-->
      <!--  Uri uri = Uri(-->
      <!--  scheme: 'https',-->
      <!--  host: _baseUrl,-->
      <!--  port: iPort,-->
      <!--  path: url,-->
      <!--  );-->
      <!--  Inspector.log('POST : $uri');-->
      <!--  try &#123;-->
      <!--  final response = await http.post(uri, body: json.encode(body), headers: &#123;-->
      <!--  'Content-type': 'application/json',-->
      <!--  HttpHeaders.authorizationHeader: 'Bearer $&#123;_token!&#125;'-->
      <!--&#125;);-->
      <!--  responseJson = _response(response);-->
      <!--&#125; on SocketException &#123;-->
      <!--  throw FetchDataException('No Internet connection');-->
      <!--&#125;-->
      <!--  return responseJson;-->
      <!--&#125;-->

      <!--  Future<dynamic> getLineItemsByPurchaseOrder(String purchaseOrder) async &#123;-->
      <!--  return await get('/po/line-items', &#123;'purchaseOrderNumber': purchaseOrder&#125;);-->
      <!--&#125;-->

      <!--  Future<dynamic> getMatchedLineItems(String purchaseOrder) async &#123;-->
      <!--  return await get(-->
      <!--  '/so/matched-items', &#123;'purchaseOrderNumber': purchaseOrder&#125;);-->
      <!--&#125;-->

      <!--  Future<dynamic> getRecentPOs() async &#123;-->
      <!--  return await get('/po', null);-->
      <!--&#125;-->

      <!--  Future<dynamic> createPackage(package) async &#123;-->
      <!--  return await post('/package', package);-->
      <!--&#125;-->

      <!--  Future<dynamic> receiveStock(package) async &#123;-->
      <!--  return await post('po/receive', package);-->
      <!--&#125;-->

      <!--  Future<dynamic> sendImageForScan(File imageFile) async &#123;-->
      <!--  Inspector.wtf('sending image', imageFile);-->
      <!--  dynamic responseJson;-->
      <!--  int? iPort;-->
      <!--  if (_port != null) iPort = int.tryParse(_port as String);-->

      <!--  final imageBytes = await imageFile.readAsBytes();-->
      <!--  Uri uri = Uri(-->
      <!--  scheme: 'https',-->
      <!--  host: _baseUrl,-->
      <!--  port: iPort,-->
      <!--  path: 'scan/image',-->
      <!--  );-->

      <!--  Inspector.log('POST : $uri');-->
      <!--  int now = DateTime-->
      <!--  .now()-->
      <!--  .millisecondsSinceEpoch;-->
      <!--  try &#123;-->
      <!--  var request = http.MultipartRequest('POST', uri)-->
      <!--  ..files.add(http.MultipartFile.fromBytes('label', imageBytes,-->
      <!--  filename: '$now-scanned-label'));-->
      <!--  var streamedResponse = await request.send();-->
      <!--  var response = await http.Response.fromStream(streamedResponse);-->
      <!--  responseJson = _response(response);-->
      <!--&#125; on SocketException &#123;-->
      <!--  throw FetchDataException('No Internet connection');-->
      <!--&#125;-->
      <!--  return responseJson;-->
      <!--&#125;-->

      <!--  dynamic _response(http.Response response) &#123;-->
      <!--  switch (response.statusCode) &#123;-->
      <!--  case 200:-->
      <!--  var responseJson = json.decode(response.body);-->
      <!--  return responseJson;-->
      <!--  case 400:-->
      <!--  throw BadRequestException(response.body.toString());-->
      <!--  case 401:-->

      <!--  case 403:-->
      <!--  throw UnauthorisedException(response.body.toString());-->
      <!--  case 500:-->
      <!--  throw ServerException('Error from the server : $&#123;response.statusCode&#125;');-->
      <!--  default:-->
      <!--  throw FetchDataException(-->
      <!--  'Error occured during communication with the server with status code : $&#123;response-->
      <!--  .statusCode&#125;');-->
      <!--&#125;-->
      <!--&#125;-->
      <!--&#125;-->
    </div>
  </section>
</div>