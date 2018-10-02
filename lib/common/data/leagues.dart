import './hot-teams.dart';

final Map<int, Map> leagueList = {
  1: {
    "id": 1,
    "name": "欧美男足",
    "mini": "wzzq",
    "icon": "//statics.itc.cn/football/leagueicon/1.png",
    "ext": "",
    "feed": {"home": 85},
    "hotTeams": [],
    "keywords": ""
  },
  7: {
    "id": 7,
    "name": "欧冠",
    "mini": "og",
    "icon": "//statics.itc.cn/football/leagueicon/7.png",
    "ext": "",
    "feed": {"home": 83},
    "hotTeams": hotTeams['7'],
    "keywords": ""
  },
  8: {
    "id": 8,
    "name": "西甲",
    "mini": "xj",
    "icon": "//statics.itc.cn/football/leagueicon/8.png",
    "ext": "",
    "feed": {"home": 76, "team": 77, "match": 78},
    "hotTeams": hotTeams['8'],
    "keywords": "西甲,皇马,皇家马德里,巴萨罗那,巴萨,马竞,马德里竞技"
  },
  17: {
    "id": 17,
    "name": "英超",
    "mini": "yc",
    "icon": "//statics.itc.cn/football/leagueicon/17.png",
    "feed": {"home": 15, "match": 52, "team": 53},
    "ext": "",
    "hotTeams": hotTeams['17'],
    "keywords": "英超,曼联,曼城,利物浦,阿森纳,切尔西,热刺"
  },
  23: {
    "id": 23,
    "name": "意甲",
    "mini": "yj",
    "icon": "//statics.itc.cn/football/leagueicon/23.png",
    "ext": "",
    "feed": {"home": 71, "team": 70, "match": 72},
    "hotTeams": hotTeams['23'],
    "keywords": "意甲,尤文,国米,米兰,尤文图斯,国际米兰,AC米兰"
  },
  34: {
    "id": 34,
    "name": "法甲",
    "mini": "fj",
    "icon": "//statics.itc.cn/football/leagueicon/34.png",
    "ext": "",
    "feed": {"home": 67, "match": 68, "team": 69},
    "hotTeams": hotTeams['34'],
    "keywords": "法甲,巴黎,巴黎圣日耳曼"
  },
  35: {
    "id": 35,
    "name": "德甲",
    "mini": "dj",
    "icon": "//statics.itc.cn/football/leagueicon/35.png",
    "ext": "",
    "feed": {"home": 73, "team": 74, "match": 75},
    "hotTeams": hotTeams['35'],
    "keywords": "德甲,拜仁慕尼黑,拜仁"
  },
  679: {
    "id": 679,
    "name": "欧联",
    "mini": "ol",
    "icon": "//statics.itc.cn/football/leagueicon/679.png",
    "ext": "",
    "feed": {"home": 84},
    "hotTeams": hotTeams['679'],
    "keywords": ""
  }
};
