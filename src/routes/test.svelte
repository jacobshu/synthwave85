<script>
  let theme = 'sw';
  $: keyword = theme === 'sw84' ? 'text-sw84-red-400' : 'text-sw85-red-400'
</script>

<button
  on:click="{() => {theme = 'sw84'}}"
>synthwave84</button>
<button
  on:click="{() => {theme = 'sw85'}}"
>synthwave85</button>
<button
  on:click="{() => {theme = 'nord'}}"
>nord</button>

<p><span class="keyword">import</span> <span class="2">'dart:async'</span>;</p>
<p><span class="keyword">import</span> <span class="2">'dart:io'</span>;</p>

<p><span class="keyword">class</span> <span class="type">ApiProvider</span> &#123;</p>
<p class="indent"><span class="keyword">final</span> <span class="type">String</span><span class="keyword">?</span>
  _baseUrl <span class="keyword">=</span> dotenv.env<span class="container">[</span>'SERVER'<span
    class="container">]</span>;</p>

<p class="indent"><span class="type">Future</span><<span class="type">dynamic</span>> <span
  class="method">get</span><span class="container">(</span><span class="type">String</span> url<span
  class="keyword">,</span> params<span class="container">)</span> <span class="keyword">async</span> <span
  class="container">&#123;</span></p>
<!--  if (_port != null) iPort = int.tryParse(_port as String);-->

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
