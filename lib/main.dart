import 'package:flutter/material.dart';

void main() {
  runApp(GalleryApp());
}

class GalleryApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GalleryHomePage(),
    );
  }
}

class GalleryHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(98),
        child: Container(
          width: 428,
          height: 98,
          color: Color(0xFF2CAB00),
          child: Stack(
            children: [
              Positioned(
                top: 49,
                left: 17.24,
                child: Transform.rotate(
                  angle: 0.00,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.lightGreenAccent,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                    ),
                    child: Icon(
                      Icons.chevron_left,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 59,
                right: 398,
                child: Row(
                  children: [
                    _buildEllipse(),
                    SizedBox(width: 4),
                    _buildEllipse(),
                    SizedBox(width: 4),
                    _buildEllipse(),
                  ],
                ),
              ),
              Positioned(
                top: 39,
                width: 428,
                child: Text(
                  'Photo Gallery',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildColumn(context, ["Mood", "Animals", "Travels", "Road"]),
            _buildColumn(context, ["Aesthetic", "City", "Sky", "Flowers"]),
          ],
        ),
      ),
    );
  }

  Widget _buildEllipse() {
    return Container(
      width: 4,
      height: 22,
      color: Colors.white.withOpacity(0),
    );
  }

  Widget _buildColumn(BuildContext context, List<String> albums) {
    return Column(
      children: albums.map((album) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AlbumDetailsPage(album)),
            );
          },
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(10),
                width: 150,
                height: 150,
                child: Image.network(
                  getAlbumCoverUrl(album),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 5), // Space between image and text
              Text(
                album,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  String getAlbumCoverUrl(String albumName) {
    // Provide cover image URL based on the album name
    switch (albumName) {
      case "Mood":
        return "https://www.pexels.com/photo/person-in-gray-hoodie-holding-beer-576494//150";
      case "Animals":
        return "https://kids.nationalgeographic.com/animals/mammals/facts/tiger/150";
      case "Travels":
        return "https://www.self.com/story/coronavirus-travel-safety/150";
      case "Road":
        return "https://www.pexels.com/search/road//150";
      case "Aesthetic":
        return "https://www.peakpx.com/en/hd-wallpaper-desktop-awjyf/150";
      case "City":
        return "https://en.wikipedia.org/wiki/Downtown#/media/File:Lights_of_Rockefeller_Center_during_sunset.jpg/150";
      case "Sky":
        return "https://unsplash.com/photos/above-cloud-photo-of-blue-skies-yQorCngxzwI/150";
      case "Flowers":
      default:
        return "";
    }
  }
}

class AlbumDetailsPage extends StatelessWidget {
  final String albumName;

  AlbumDetailsPage(this.albumName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(albumName)),
      body: Container(
        width: 390,
        height: 325,
        margin: EdgeInsets.only(top: 104, left: 19),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: 387,
              height: 51,
              margin: EdgeInsets.only(top: 593, left: 19),
              decoration: BoxDecoration(
                color: Color(0xFF2CAB00),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
              child: Center(
                child: Text(
                  'See more',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}