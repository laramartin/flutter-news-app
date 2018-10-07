import 'package:flutter_news/src/json_parser.dart';
import 'package:test/test.dart';

void main() {
  test("parses topstories.json", () {
    const jsonString =
        "[18120667,18123282,18122847,18122824,18123058,18110372,18123587,18122442,18120519,18113803,18120860,18123423,18123596,18119782,18123074,18110033,18120323,18120459,18122921,18112785,18120435,18122583,18121227,18120500,18111869,18120477,18120433,18119345,18119607,18123191,18118641,18119013,18121461,18119632,18119077,18111779,18111954,18111473,18119367,18119653,18119309,18119675,18116365,18118981,18120941,18117755,18115777,18119544,18121626,18110156,18109706,18107136,18121554,18111690,18113144,18112172,18118147,18117222,18119179,18120156,18111180,18111829,18120277,18111810,18114698,18111034,18121005,18112636,18121552,18109533,18115729,18116624,18117995,18113890,18117387,18111625,18119215,18114754,18117322,18109852,18113129,18115304,18106768,18112300,18120871,18121724,18108626,18118934,18120322,18115256,18108715,18117096,18104814,18105129,18115140,18104362,18121559,18115696,18104600,18111214,18104512,18115359,18120479,18110363,18099972,18105657,18120423,18112734,18113926,18118957,18111113,18109274,18111409,18105878,18119194,18112378,18110857,18115871,18111168,18106412,18102617,18107469,18110651,18113147,18121204,18109930,18113183,18114806,18110731,18115197,18113779,18109534,18109260,18120616,18105644,18118434,18106847,18107271,18117341,18112843,18104611,18109846,18103645,18118545,18109559,18105109,18111477,18114724,18115292,18102578,18115564,18114599,18118999,18111721,18109224,18118874,18118837,18118798,18110508,18108472,18120418,18110729,18110043,18119227,18112140,18110705,18107818,18103720,18099891,18116870,18103939,18109182,18104652,18114440,18106118,18115725,18105572,18109890,18105375,18108899,18108035,18105723,18105371,18106224,18118644,18100243,18104761,18102923,18103717,18099796,18115713,18117459,18104861,18108379,18107165,18101820,18120083,18108236,18101141,18105931,18104435,18114646,18104879,18119041,18106479,18111946,18103949,18110923,18111078,18100156,18109277,18103159,18118765,18114459,18109318,18104508,18112824,18099596,18114691,18100490,18107574,18118206,18099795,18109416,18102885,18099581,18100967,18099673,18113857,18106031,18100807,18103835,18120319,18109707,18119363,18112732,18111375,18108346,18104794,18118233,18108770,18113227,18104167,18106679,18103162,18116774,18119052,18105693,18100895,18116532,18103417,18102260,18111961,18115156,18100674,18106808,18104326,18104867,18102287,18103137,18117489,18110513,18099835,18114170,18102273,18105026,18100536,18108898,18110784,18113057,18116650,18112460,18101689,18099877,18116441,18113609,18117519,18118355,18109069,18102871,18101292,18100526,18113746,18112830,18100253,18110054,18106207,18109326,18106827,18113328,18117923,18099582,18116629,18103640,18105581,18100273,18104400,18102055,18112320,18116012,18111777,18113752,18115271,18109245,18109916,18100447,18104439,18105631,18117078,18104068,18101381,18103566,18109751,18101570,18099926,18106499,18112715,18101459,18111147,18101180,18103565,18102949,18105745,18105741,18101090,18100522,18105412,18109357,18105025,18113360,18102905,18106831,18109166,18101232,18112375,18117195,18100799,18110499,18099570,18099700,18111500,18108928,18107289,18101130,18100738,18102719,18106314,18100396,18109065,18105046,18103271,18101702,18102323,18108266,18107840,18102713,18104501,18109434,18101565,18106842,18106541,18100475,18106390,18103502,18104329,18112954,18108240,18108094,18105296,18103785,18101279,18103654,18104601,18100189,18100128,18104405,18102110,18101572,18104005,18101045,18100898,18103156,18103069,18100381,18099832,18105035,18101752,18114401,18101270,18101257,18110294,18100637,18109162,18103908,18101829,18100857,18100093,18113145,18103664,18107701,18102317,18120388,18115855,18119405,18102877,18113146,18109937,18109360,18109019,18110316,18100996,18117016,18115057,18115445,18105578,18115166,18101557,18115820]";

    expect(parseTopStories(jsonString).first, 18120667);
  });

  test("parses item.json", () {
    const jsonString = """{
      "by" : "norvig",
      "id" : 2921983,
      "kids" : [ 2922097, 2922429, 2924562, 2922709, 2922573, 2922140, 2922141 ],
      "parent" : 2921506,
      "text" : "Aw shucks, guys ... you make me blush with your compliments.<p>Tell you what, Ill make a deal: I'll keep writing if you keep reading. K?",
      "time" : 1314211127,
      "type" : "comment"
    }""";
    expect(parseArticle(jsonString).id, 2921983);
  });
}
