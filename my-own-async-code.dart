// Using the whois package to play with async and futures

import 'package:whois/whois.dart';

Future<bool> domainAvailable(String domainName) async {
  var available = false;

  var options = const LookupOptions(
    // Set timeout to 10 seconds
    timeout: Duration(milliseconds: 10000),
    port: 43,
  );

  final whoisResponse = await Whois.lookup(domainName, options);

  final parsedResponse = Whois.formatLookup(whoisResponse);

  if (parsedResponse.containsKey('Domain Name')) {
    available = false;
  } else {
    available = true;
  }

  return Future.value(available);
}

Future<void> main() async {
  print(await domainAvailable('google.com'));
  print(await domainAvailable('sdsddgoogle.com'));
  print(await domainAvailable('tiaanvd.com'));
}
