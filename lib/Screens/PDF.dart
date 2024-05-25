import 'package:flutter/material.dart';
// import 'package:flutter_pdfview/flutter_pdfview.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';  not used
import 'package:pdfx/pdfx.dart';
import 'package:audioplayers/audioplayers.dart';
class PDF extends StatefulWidget {
  const PDF({super.key});
  @override
  State<PDF> createState() => _PDFState();
}


class _PDFState extends State<PDF> {
  late PdfControllerPinch pdfControllerPinch;
  final player = AudioPlayer();
  bool _isPlaying = false;
  bool _isLocked = false;
  bool _playerUp = true;
  bool _durationUp = false;
  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  String formatTime(int seconds){
    return '${(Duration(seconds: seconds, ))}'.split('.')[0].padLeft(8,'0');
  }
  @override
  void dispose() {
    // TODO: implement dispose
    print("Back To old Screen");
    super.dispose();
    player.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pdfControllerPinch = PdfControllerPinch(document: PdfDocument.openAsset('assets/book.pdf'));

    player.onPlayerStateChanged.listen((state) {
      setState(() {
        _isPlaying = state == PlayerState.playing;
      });
    });

    player.onDurationChanged.listen((newduration) {
      setState(() {
        _duration = newduration;
      });
    });

    player.onPositionChanged.listen((newposition) {
      setState(() {
        _position = newposition;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body:Stack(
          children: [
            GestureDetector(child: PdfViewPinch(controller: pdfControllerPinch),
                onTap: (){
              setState(() {
                if(!_isLocked)
                _playerUp = !_playerUp;
              });
                }),
            Align(
              alignment: Alignment.topRight,
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: (){
                    setState(() {
                      _isLocked = !_isLocked;
                    });
                  },
                icon: Icon( _isLocked? Icons.lock_outline : Icons.lock_open , size: 45, color: Colors.black,)),
                ),
            ),
            // FloatingActionButton.large(onPressed: (){
            //   player.play(AssetSource('audio.mp3'));
            // })
            Visibility(
              visible: _playerUp,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: 115,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff2E4374),
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20),),

                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: IconButton(onPressed: (){
                                setState(() {
                                  if(!_isLocked)
                                    {
                                      _position -= Duration(seconds: 5);
                                      player.seek(_position);
                                    }
                                });
                              },
                                  icon: Icon(Icons.replay_10_outlined, color: Colors.white, size: 40)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: IconButton(onPressed: (){
                                setState(() {
                                  _position = Duration.zero;
                                  player.seek(_position);
                                });
                              },
                                icon: Icon(Icons.skip_previous, color: Colors.white, size: 40,),),
                            ),

                            Stack(
                              children: [
                                Positioned(
                                    child: CircleAvatar(radius: 16, backgroundColor: Colors.white,),
                                  top: 15,
                                  left: 16,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 0),
                                  child: IconButton(onPressed: (){
                                    setState(() {
                                      if(!_isLocked){
                                        if(_isPlaying)
                                          player.pause();
                                        else player.play(AssetSource('audio.mp3'));
                                        _durationUp = true;
                                      }
                                    });
                                  },
                                      icon: Icon( _isPlaying? Icons.pause_circle : Icons.play_circle , color: Color(0xff5EC9EF), size: 55)),
                                ),

                              ]
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: IconButton(onPressed: (){
                                setState(() {
                                  _position = _duration;
                                  player.seek(_position);
                                });
                              },
                                icon: Icon(Icons.skip_next, color: Colors.white, size: 40,),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10),
                              child: IconButton(onPressed:(){
                                setState(() {
                                  if(!_isLocked){
                                    _position += Duration(seconds: 5);
                                    player.seek(_position);
                                  }
                                });
                              } ,
                                  icon: Icon(Icons.forward_10_outlined, color: Colors.white, size: 40)),
                            ),
                          //  IconButton(onPressed: null, icon: Icon(Icons.skip_next, color: Colors.blueAccent, size: 35)),
                          ],
                        ),
                      ),
                      Slider(
                        inactiveColor: Colors.white,
                        activeColor: Colors.blue[200],
                        min: 0,
                        max: _duration.inSeconds.round().toDouble(),
                        value: _position.inSeconds.round().toDouble(),
                        onChanged: (value) {
                          if(!_isLocked){
                            final position = Duration(seconds: value.toInt());
                            player.seek(position);
                            //   player.resume();
                          }
                        },
                      ),
                      Visibility(
                        visible: _durationUp,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(formatTime(_position.inSeconds) , style: TextStyle(height: 1, color: Colors.white),),
                              Text(formatTime(_duration.inSeconds), style: TextStyle(height: 1, color: Colors.white)),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }
}
