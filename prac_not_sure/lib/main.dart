import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyDemoApp());

class MyDemoApp extends StatelessWidget {
  const MyDemoApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter app',
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const BirdsHome(),
      );
}

class BirdsHome extends StatefulWidget {
  const BirdsHome({super.key});

  @override
  State<BirdsHome> createState() => _BirdsHomeState();
}

class _BirdsHomeState extends State<BirdsHome> {
  AudioPlayer player =
      AudioPlayer(); //This line will create the instance of the audio player class
  bool isPlaying =
      false; // it helps to detect whether the audio is playing or not
  // duration and postion is called state variables
  Duration duration =
      Duration.zero; // duration represents the total duration of the audio
  Duration position =
      Duration.zero; // postion represents the current playback position

  // init state is a life cycle method in flutter. This will insert our widget into the widget tree once it has been called
  @override
  void initState() {
    super.initState();
    setAudio(); // It is a future async method which will be used to initialize the audio setup

    // We will be using 3 listeners to react to the changes in the audio player state whenever the player is stopped, played or paused, the isPlaying boolean variable needs to be updated.
    // Similarly duration and position needs to be updated
    // listeners are added basically to keep track of the audio and update the state variables

    // listen to the state: playing, paused,stopped
    player.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.playing;
      });
    });

    // listen to audio duration
    player.onDurationChanged.listen((newDuration) {
      // print("Duration changed $newDuration");
      setState(() {
        duration = newDuration;
      });
    });

    // listen to audio position changes
    player.onPositionChanged.listen((newPosition) {
      // print("Position changed $newPosition");
      setState(() {
        position = newPosition;
      });
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Play the sound of the Wild Babbler bird"),
          backgroundColor: Colors.red,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(
                    'https://images.pexels.com/photos/4256925/pexels-photo-4256925.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    width: double.infinity,
                    height: 350,
                    fit: BoxFit.cover),
              ),
              const SizedBox(
                height: 32,
              ),
              const Text(
                "The Wild Babbler sings",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              /*
              Slider is a flutter widget which permits the user to interactively change the position (seek) of the audio play back.
              It has certain certain properties:
              min - sets the min value of slider (start of the audio)
              max - sets the max value of slider (end of the audio)
              value - It represents the current postion of the audio playback
              onChange - It is a callback method that is triggered each time the user interacts with the slider. The value paramter represents the current position. 
              */
              Slider(
                min: 0,
                max: duration.inSeconds.toDouble(),
                value: position.inSeconds.toDouble(),
                onChanged: (value) async {
                  // This converts the choosen value or position into integer. It epresents the new position in the slider
                  final position = Duration(seconds: value.toInt());

                  // This invokes the seek method on the audio player to change to the current playing position
                  await player.seek(position);

                  //It is optional it resumes the player if it was paused. It will automatically at the new positon
                  if(!isPlaying){

                  await player.resume();
                  }
                }
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(formatTime(position)),
                    Text(formatTime(duration))
                  ],
                ),
              ),
              CircleAvatar(
                radius: 35,
                child: IconButton(
                  icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                  iconSize: 50,
                  onPressed: () async {
                    /* 
                      if the audio is not currently playing the isPlaying boolean variable will evaluate to false thus executing the else block which creates a new instance of audio cache called mplayer.
                      The mplayer object will be used to load the audio file which is in mp3
                      */
                    if (isPlaying) {
                      await player.pause();
                    } else {
                       player.play(AssetSource("audio/video.mp3"));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      );
  String formatTime(Duration duration) {
    // helper function are those functions which execute a part of the function within another function. These are used to make your program easier to read. They assist in code resusability.
    // Two digits is a helper function that takes an integer n and converts it to a String.
    // padLeft (2,0 )ensures that the resultant string will atleast 2 digits. Padding with 0 if necessary
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [
      if (duration.inHours > 0) hours,
      minutes,
      seconds,
    ].join(":"); // join ensures that wherever there is space add a colon
  }

  Future setAudio() async {
    // The below line sets the audio into a loop
    player.setReleaseMode(ReleaseMode.loop);

    final mplayer = AudioCache(prefix: 'assets/audio/');
    final url = await mplayer.load('assets/audio/video.mp3');
    player.setSource(url.path as Source);
  }
}