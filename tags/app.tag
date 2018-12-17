<app>

  <div class="welcomePage" if={ first }>
     <h2>Lets' Start!</h2>
     <button onclick={ start }> Go! </button>
  </div>
  <div class="" if={ !first }>
    <h1 if={ !choose } class = "title"> {situation} </h1>
    <div if={ choose } class="h1">
      <h1> {situation} </h1>
      <div class="row buttonGroup">
        <div class="col buttondiv">
          <button type="button" class="emotionButton" name= { emotionOne } onclick={ chooseEmotion }> {emotionOne} </button>
        </div>
        <div class="col buttondiv primary">
          <button type="button" class="emotionButton" name={ emotionTwo } onclick={ chooseEmotion }> {emotionTwo} </button>
        </div>
    </div>
  </div>


  </div>


  <script>
  var that = this;
  var situationIndex = 0;
  var emotionIndex = 0;
  this.choose = false;
  this.first = true;

// Emotions Set Up
    this.emotionsList = [
      ["Ashamed", "Guilty"],
      ["Angry", "Ashamed"],
      ["Ashamed", "Worried"],
      ["Angry", "Guilty"],
      ["Worried", "Guilty"],
      ["Angry", "Worried"],
    ];
// Situations Set Up
    this.situationsList = [
      "When I fail to hand in homework, I feel...",
      "When I fail in English Class, I feel...",
      "When I fail in Math Class, I feel..."
    ];

    this.start = function(e) {
      console.log(performance.now());
      this.first = false;
      setTimeout(myFunction, 3000);
    }

    that.refreshPage = function(e) {
      this.situation = this.situationsList[situationIndex];
      this.emotionOne = this.emotionsList[emotionIndex][0];
      this.emotionTwo = this.emotionsList[emotionIndex][1];
    }


    this.chooseEmotion = function(e) {
      console.log(emotionIndex);
      if (emotionIndex == 5) {
        situationIndex ++;
        emotionIndex = 0;
      } else {
        emotionIndex ++;
        console.log(situationIndex,emotionIndex);
      };
        that.choose = false;
        setTimeout(myFunction, 3000);
        that.refreshPage();
        console.log(event.currentTarget.innerText, performance.now());
    }

      function myFunction() {
        that.choose = true;
        that.update();
        console.log("true");
      }

      this.refreshPage();

  </script>

  <style>
  :scope {
    display: block;
    border-radius: 5px;
    padding-left: 50px;
    padding-top: 100px;
    padding-bottom: 10px;
    font-size: 40px;
   }

    .h1 {

    }

    .title {
      font-size: 50px;
      padding-top: 200px;
      text-align: center;
    }

    .emotionButton {
      font-size: 40px;
      height: 300px;
      width: 300px;
      background-color: white;
    }

    .buttondiv {
      text-align: center;
    }

    .buttonGroup {
      margin-top: 100px;
    }
  </style>
</app>
