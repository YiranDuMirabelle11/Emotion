<app>
<body onkeypress={ chooseEmotion }>
  <div class="welcomePage" if={ first }>
     <h2>Lets' Start!</h2>
     <button class="startButton" onclick={ start }> Go! </button>
  </div>
  <div class="" if={ !first }>
    <h1 if={ !choose } class = "title"> {situation} </h1>
    <div if={ choose } class="h1">
      <h1> {situation} </h1>
      <div class="row buttonGroup">
        <div class="col buttondiv">
          <button class="emotionButton" name= { emotionOne } onclick={ chooseEmotion }> {emotionOne} </button>
        </div>
        <div class="col buttondiv primary">
          <button class="emotionButton" name={ emotionTwo } onclick={ chooseEmotion }> { emotionTwo } </button>
        </div>
       </div>
    </div>
  </div>
</body>


  <script>
  var that = this;
  var situationIndex = 0;
  var emotionIndex = 0;
  var answers = [];
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
      "When I fail to in P.E. class, I feel...",
      "When I fail in English Class, I feel...",
      "When I fail in Math Class, I feel..."
    ];

    this.start = function(e) {
      answers.push(performance.now());
      console.log(performance.now());
      this.first = false;
      setTimeout(myFunction, 3000);
    }

    that.refreshPage = function(e) {
      this.situation = this.situationsList[situationIndex];
      this.emotionOne = this.emotionsList[emotionIndex][0];
      this.emotionTwo = this.emotionsList[emotionIndex][1];
    }


    this.chooseEmotion = function(event) {

      // console.log(event.which);
      // if (event.which === 113) {
      //   var emotion = that.emotionOne;
      // } else if (event.which === 112) {
      //   var emotion = that.emotionTwo;
      // } else {
      //   console.log("return");
      //   return;
      // }
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
        answers.push([event.currentTarget.innerText, performance.now()]);
        console.log(answers);
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
      font-size: 50px;
      height: 300px;
      width: 300px;
      background-color: white;
      border-radius: 10px;
    }

    .buttondiv {
      text-align: center;
    }

    .buttonGroup {
      margin-top: 100px;
    }

    .startButton {
      font-size: 20px;
    }

    .welcomePage {
      font-size: 20px;
      text-align: center;
    }
  </style>
</app>
