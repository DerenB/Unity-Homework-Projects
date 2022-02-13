using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public enum GameMode
{
	idle,
	playing,
	levelEnd
}

public class MissionDemolition : MonoBehaviour 
{
    static private MissionDemolition S; // a private Singleton
    public int highscore0 = 10;
    public int highscore1 = 10;
    public int highscore2 = 10;
    public int highscore3 = 10;
    public int highscore4 = 10;

    [Header("Set in Inspector")]
    public Text uitLevel;  // The UIText_Level Text
    public Text uiHighScore;    // The UIHigh_Score Text
    public Text uitShots;  // The UIText_Shots Text
    public Text uitButton; // The Text on UIButton_View
    public Vector3 castlePos; // The place to put castles
    public GameObject[] castles;   // An array of the castles

    [Header("Set Dynamically")]
    public int level;     // The current level
    public int levelMax;  // The number of levels
    public int shotsTaken;
    public GameObject castle;    // The current castle
    public GameMode mode = GameMode.idle;
    public string showing = "Show Slingshot"; // FollowCam mode

    void Start()
    {
        S = this; // Define the Singleton
        level = 0;
        levelMax = castles.Length;
        StartLevel();
    }

    void StartLevel()
    {
        // Get rid of the old castle if one exists
        if (castle != null)
        {
            Destroy(castle);
        }

        // Destroy old projectiles if they exist
        GameObject[] gos = GameObject.FindGameObjectsWithTag("Projectile");
        foreach (GameObject pTemp in gos)
        {
            Destroy(pTemp);
        }

        // Instantiate the new castle
        castle = Instantiate<GameObject>(castles[level]);
        castle.transform.position = castlePos;
        shotsTaken = 0;

        // Reset the camera
        SwitchView("Show Both");
        ProjectileLine.S.Clear();

        // Reset the goal
        Goal.goalMet = false;
        UpdateGUI();
        mode = GameMode.playing;
    }

    void UpdateGUI()
    {
        // Show the data in the GUITexts
        uitLevel.text = "Level: " + (level + 1) + " of " + levelMax;
        uitShots.text = "Shots Taken: " + shotsTaken;
        uiHighScore.text = "High Score: " + GetHighScore(level);
    }

    void Update()
    {
        UpdateGUI();
        // Check for level end
        if ((mode == GameMode.playing) && Goal.goalMet)
        {
            // Change mode to stop checking for level end
            mode = GameMode.levelEnd;

            // Zoom out
            SwitchView("Show Both");

            // Start the next level in 2 seconds
            Invoke("NextLevel", 2f);
        }
    }

    void NextLevel()
    {
        SetHighScore(shotsTaken, level);

        level++;
        if (level == levelMax)
        {
            level = 0;
        }
        StartLevel();
    }

    public void SwitchView(string eView = "")
    {
        if (eView == "")
        {
            eView = uitButton.text;
        }

        showing = eView;

        switch (showing)
        {
            case "Show Slingshot":
                FollowCam.POI = null;
                uitButton.text = "Show Castle";
                break;
            case "Show Castle":
                FollowCam.POI = S.castle;
                uitButton.text = "Show Both";
                break;
            case "Show Both":
                FollowCam.POI = GameObject.Find("ViewBoth");
                uitButton.text = "Show Slingshot";
                break;
        }
    }

    // Closes the Prorgam
    public void Quit()
    {
        Application.Quit();
    }

    // Static method that allows code anywhere to increment shotsTaken
    public static void ShotFired()
    {
        S.shotsTaken++;
    }


    //Method for setting High Scores
    void SetHighScore(int newScore, int currentLevel)
    {
        switch(currentLevel)
        {
            case 0:
                highscore0 = NewScoreCheck(highscore0, newScore);
                break;
            case 1:
                highscore1 = NewScoreCheck(highscore1, newScore);
                break;
            case 2:
                highscore2 = NewScoreCheck(highscore2, newScore);
                break;
            case 3:
                highscore3 = NewScoreCheck(highscore3, newScore);
                break;
            case 4:
                highscore4 = NewScoreCheck(highscore4, newScore);
                break;
        }
    }

    int NewScoreCheck(int highScore, int newScore)
    {
        return (newScore <= highScore) ? newScore : highScore;
    }

    int GetHighScore(int currentLevel)
    {
        switch (currentLevel)
        {
            case 0:
                return highscore0;
            case 1:
                return highscore1;
            case 2:
                return highscore2;
            case 3:
                return highscore3;
            case 4:
                return highscore4;
            default:
                return 10;
        }
    }
}
