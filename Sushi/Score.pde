int time;
int score;
int timeScore;
int placementScore;
int cuttingScore;

void setTimeScore(){
    if (time <= 30) timeScore = 100;
    else{
      timeScore = 100 - time + 30;
    }
}

int getTimeScore(){
  return timeScore;
}

void setScore(){
  score = timeScore + placementScore + cuttingScore;
  score /= 3;
}

int getScore(){
  return score;
}
