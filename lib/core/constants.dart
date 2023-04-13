import 'package:empat_app/models/playlist.dart';
import 'package:empat_app/models/song.dart';
import 'package:flutter/material.dart';

const backgroundColor = Color.fromARGB(255, 18, 18, 22);
const surfaceColor = Color.fromARGB(255, 35, 35, 45);
const accentColor = Color.fromARGB(255, 238, 84, 102);

final constPlaylists = [
  Playlist(
    title: "Favorite",
    author: "Me",
    description: "My favorite songs",
    imageUrl:
        "https://th.bing.com/th/id/R.27e5c670f63bed4d19b19faf98bcfa94?rik=P51m1L7MYD4qJg&pid=ImgRaw&r=0",
    songs: constSongs.where((song) => song.title != "Test song").toList(),
  ),
];

final constSongs = [
  Song(
    title: "Testing",
    band: "Skusta Clee",
    imageUrl:
        "https://static.qobuz.com/images/covers/oc/gy/bn3r3r9bqgyoc_600.jpg",
    musicAsset: "assets/music/Skusta Clee - Testing.mp3",
  ),
  Song(
    title: "ROCK AROUND THE CLOCK 3",
    band: "Soundtrack 4 life",
    imageUrl:
        "https://th.bing.com/th/id/OIP.VdrxMrM4vwGEuSmi0cKhnQHaHQ?pid=ImgDet&rs=1",
    musicAsset:
        "assets//music//Soundtrack 4 Life - ROCK AROUND THE CLOCK 3.mp3",
  ),
  Song(
    title: "Test song",
    band: "Test band",
    imageUrl:
        "https://th.bing.com/th/id/OIP.mwzKOloKleTewNKiTvmgYQAAAA?pid=ImgDet&rs=1",
    musicAsset: "assets/music/test_music.mp3",
  ),
  Song(
    title: "Terracotta Instrumental",
    band: "Nuisance",
    imageUrl:
        "https://freemusicarchive.org/image/?file=album_image%2Fz8cV9MOTpxrQt4ADBklsahBLt2aH5m9aZyKxjMJz.jpg&width=290&height=290&type=album",
    musicAsset:
        "assets/music/Nuisance - Terracotta Instrumental (SAND).mp3.mp3",
  ),
  Song(
    title: "My Sweet Liberty",
    band: "John Lopker",
    imageUrl:
        "https://freemusicarchive.org/image/?file=track_image%2Fg4VkTPT3hFVPC1PWC17TBlNTvq2l2miTg08B7sjC.png&width=290&height=290&type=track",
    musicAsset:
        "assets/music/John Lopker _ Popular USA Majority LIVE - My Sweet Liberty _ Freedom = Responsibility.mp3",
  ),
  Song(
    title: "Finally",
    band: "HoliznaPATREON",
    imageUrl:
        "https://freemusicarchive.org/image/?file=album_image%2FkGueEkjWH104WW5jhcIJkzjFCJxTjEKcgBYMNBdf.png&width=290&height=290&type=album",
    musicAsset: "assets/music/HoliznaPATREON - Finally.mp3",
  ),
  Song(
    title: "Caelum",
    band: "Edoy",
    imageUrl:
        "https://freemusicarchive.org/image/?file=track_image%2F63nC7xFZ3kghzGInPuxPSnyiq4cbYvevvN20MKfF.jpg&width=290&height=290&type=track",
    musicAsset: "assets/music/Edoy - Caelum.mp3",
  ),
  Song(
    title: "Constance Chill",
    band: "Mr Smith",
    imageUrl:
        "https://freemusicarchive.org/image/?file=album_image%2FZjmln7vMynNlXCezIPDk44gSrFMwtelZAIW2MNHi.jpg&width=290&height=290&type=album",
    musicAsset: "assets/music/Mr Smith - Constance Chill.mp3",
  ),
  Song(
    title: "Endless Winter",
    band: "REDCVT",
    imageUrl:
        "https://freemusicarchive.org/image/?file=track_image%2FXZ03MEwksoi1H7B31VnnLtS3JWSplk4aG9amli1m.png&width=290&height=290&type=track",
    musicAsset: "assets/music/REDCVT - Endless Winter.mp3",
  ),
  Song(
    title: "Why Not?",
    band: "MASERPAN",
    imageUrl:
        "https://freemusicarchive.org/image/?file=track_image%2FzA6tIrARtOVxvBMhIMpQhLOpZ0WcIoySEPn5Kz8V.jpg&width=290&height=290&type=track",
    musicAsset: "assets/music/MASERPAN - Why Not_.mp3",
  ),
  Song(
    title: "spring rain",
    band: "yumenoma",
    imageUrl:
        "https://freemusicarchive.org/image/?file=track_image%2FR6RcGuRwbn09uy4Amd3stPWMLXCOzUgZPyoQOmYs.jpg&width=290&height=290&type=track",
    musicAsset: "assets/music/yumenoma - spring rain.mp3",
  ),
  Song(
    title: "Happy Birthday to You (Swing)",
    band: "Happy Birthday to You (Swing)",
    imageUrl:
        "https://freemusicarchive.org/image/?file=album_image%2FuyLBvpaiFDBwXT3KwIlD2ChUJqwN6GG71kTv0xgm.jpg&width=290&height=290&type=album",
    musicAsset: "assets/music/Dee Yan-Key - Happy Birthday to You (Swing).mp3",
  ),
];
