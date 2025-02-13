import 'dart:typed_data';

import 'package:b_encode_decode/b_encode_decode.dart' as bencode;

void main() {
  print(String.fromCharCodes(bencode.encode('string'))); // => "6:string"
  print(String.fromCharCodes(bencode.encode(123))); // => "i123e"
  print(
      String.fromCharCodes(bencode.encode(['str', 123]))); // => "l3:stri123ee"
  print(String.fromCharCodes(
      bencode.encode({'key': 'value'}))); // => "d3:key5:valuee"
  var map = bencode.decode(Uint8List.fromList('d3:key5:valuee'.codeUnits),
      stringEncoding:
          'utf-8'); // => { key: "value" } , the string value is bytes array

  print(map);
  // Special character
  var ccc = bencode.encode({'中文': 'ddd'});
  var m1 = bencode.decode(ccc);
  print(m1);
}
