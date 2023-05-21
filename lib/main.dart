import 'package:destiniapp/story_brain.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}

StoryBrain storyBrain = StoryBrain();

class StoryPage extends StatefulWidget {
  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/bggg.jpg'), fit: BoxFit.cover)),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  flex: 12,
                  child: Center(
                    child: Text(
                      storyBrain.getStory(),
                      style: TextStyle(fontSize: 25.0),
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Visibility(
                    child: ElevatedButton(
                      onPressed: () {
                        // Button click logic
                        setState(() {
                          storyBrain.nextStory(1);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blueAccent, // Set the background color of the button
                      ),
                      child: Text(
                        storyBrain.getChoice1(),
                        style: TextStyle(
                          color:
                              Colors.white, // Set the text color of the button
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  )),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                  flex: 2,
                  child: Visibility(
                    visible: storyBrain.buttonShouldBeVisible(),
                    child: ElevatedButton(
                      onPressed: () {
                        // Button click logic
                        setState(() {
                          storyBrain.nextStory(2);
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors
                            .blue, // Set the background color of the button
                      ),
                      child: Text(
                        storyBrain.getChoice2(),
                        style: TextStyle(
                          color:
                              Colors.white, // Set the text color of the button
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
