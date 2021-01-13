import 'package:Final/bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Breeds extends StatefulWidget with NavigationStates {
  @override
  _Breeds createState() => _Breeds();
}

class _Breeds extends State<Breeds> {
  _Dogs() async {
    const url = 'https://dogtime.com/dog-breeds/profiles';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
_Cats() async {
  const url = 'https://www.petfinder.com/cat-breeds/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}_Fish() async {
  const url = 'https://www.thesprucepets.com/freshwater-fish-breeds-4162057';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}_Turtle() async {
  const url = 'https://www.thesprucepets.com/turtle-species-great-pets-4788330';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}_Ig() async {
  const url = 'https://petcomments.com/iguana-types-pets/';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}_Parrot() async {
  const url = 'https://www.exoticdirect.co.uk/news/best-parrots-have-pets';
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffBC0253),
        title: Text(
          "Breeds",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Stack(children: [
        Image(
          image: AssetImage('assets/images/bg.png'),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          fit: BoxFit.cover,
        ),
        Positioned(
            top: MediaQuery.of(context).size.height * 0.1,
            child: Container(
              width: MediaQuery.of(context).size.width,
            )),
        Column(
          children: [
            Row(
              children: [
                GestureDetector(onTap: _Dogs,
                                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: 
                                                 Image.network(
                            'https://images.unsplash.com/photo-1548199973-03cce0bbc87b?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60',
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                ),
                
                GestureDetector(onTap: _Cats,
                                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1559235038-1b0fadf76f78?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTZ8fGNhdHN8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60',
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),Row(
              children: [
                GestureDetector(onTap: _Fish,
                                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: 
                                                 Image.network(
                            'https://images.unsplash.com/photo-1578507065211-1c4e99a5fd24?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8Z29sZGZpc2h8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60',
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                ),
                
                GestureDetector(onTap: _Turtle,
                                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1437622368342-7a3d73a34c8f?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MXx8dHVydGxlfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60',
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),Row(
              children: [
                GestureDetector(onTap: _Ig,
                                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: 
                                                 Image.network(
                            'https://images.unsplash.com/photo-1504198314499-ed0d61645aa7?ixid=MXwxMjA3fDB8MHxzZWFyY2h8OHx8cGV0JTIwbGl6YXJkfGVufDB8fDB8&ixlib=rb-1.2.1&auto=format&fit=crop&w=900&q=60',
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: MediaQuery.of(context).size.width * 0.40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                ),
                
                GestureDetector(onTap: _Parrot,
                                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        child: Image.network(
                          'https://images.unsplash.com/photo-1452570053594-1b985d6ea890?ixlib=rb-1.2.1&ixid=MXwxMjA3fDB8MHxzZWFyY2h8Mnx8cGV0JTIwcGFycm90c3xlbnwwfHwwfA%3D%3D&auto=format&fit=crop&w=900&q=60',
                          height: MediaQuery.of(context).size.height * 0.2,
                          width: MediaQuery.of(context).size.width * 0.40,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        )
      ]),
    );
  }
}
